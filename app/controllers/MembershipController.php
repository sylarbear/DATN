<?php
/**
 * MembershipController
 * Quản lý đăng ký hội viên Pro
 */
class MembershipController extends Controller {

    /**
     * Trang giới thiệu gói Pro + pricing
     */
    public function index() {
        Middleware::requireLogin();

        $db = getDB();

        // Lấy danh sách gói
        $stmt = $db->query("SELECT * FROM membership_plans ORDER BY duration_months ASC");
        $plans = $stmt->fetchAll();

        // Lấy lịch sử đăng ký của user
        $stmt = $db->prepare("
            SELECT mo.*, mp.name as plan_name 
            FROM membership_orders mo 
            JOIN membership_plans mp ON mo.plan_id = mp.id
            WHERE mo.user_id = :user_id 
            ORDER BY mo.activated_at DESC LIMIT 10
        ");
        $stmt->execute(['user_id' => $_SESSION['user_id']]);
        $orders = $stmt->fetchAll();

        $this->view('membership/index', [
            'title'  => 'Nâng cấp Pro - ' . APP_NAME,
            'plans'  => $plans,
            'orders' => $orders,
            'user'   => Middleware::user(),
            'isPro'  => Middleware::isPro()
        ]);
    }

    /**
     * Kích hoạt mã Pro (AJAX)
     */
    public function activate() {
        Middleware::requireLogin();

        if (!$this->isMethod('POST')) {
            $this->json(['error' => 'Method not allowed'], 405);
        }

        $input = json_decode(file_get_contents('php://input'), true);
        $code = trim($input['code'] ?? '');

        if (empty($code)) {
            $this->json(['error' => 'Vui lòng nhập mã kích hoạt.'], 400);
        }

        $db = getDB();

        // Tìm mã kích hoạt
        $stmt = $db->prepare("
            SELECT ac.*, mp.name as plan_name, mp.duration_months 
            FROM activation_codes ac 
            JOIN membership_plans mp ON ac.plan_id = mp.id
            WHERE ac.code = :code
        ");
        $stmt->execute(['code' => strtoupper($code)]);
        $activation = $stmt->fetch();

        if (!$activation) {
            $this->json(['error' => 'Mã kích hoạt không hợp lệ.'], 400);
        }

        if ($activation['is_used']) {
            $this->json(['error' => 'Mã kích hoạt đã được sử dụng.'], 400);
        }

        // Tính ngày hết hạn
        $now = new DateTime();
        $currentExpiry = $_SESSION['membership_expired_at'] ?? null;
        if ($currentExpiry && strtotime($currentExpiry) > time()) {
            // Nếu đang là Pro, cộng thêm thời gian
            $baseDate = new DateTime($currentExpiry);
        } else {
            $baseDate = $now;
        }
        $expiredAt = $baseDate->modify('+' . $activation['duration_months'] . ' months')->format('Y-m-d H:i:s');

        try {
            $db->beginTransaction();

            // 1. Đánh dấu mã đã sử dụng
            $stmt = $db->prepare("UPDATE activation_codes SET is_used = 1, used_by = :user_id, used_at = NOW() WHERE id = :id");
            $stmt->execute(['user_id' => $_SESSION['user_id'], 'id' => $activation['id']]);

            // 2. Cập nhật user
            $stmt = $db->prepare("UPDATE users SET membership = 'pro', membership_expired_at = :expired WHERE id = :id");
            $stmt->execute(['expired' => $expiredAt, 'id' => $_SESSION['user_id']]);

            // 3. Tạo order
            $stmt = $db->prepare("
                INSERT INTO membership_orders (user_id, plan_id, activation_code, amount, payment_method, status, expired_at)
                VALUES (:user_id, :plan_id, :code, 0, 'activation_code', 'completed', :expired)
            ");
            $stmt->execute([
                'user_id' => $_SESSION['user_id'],
                'plan_id' => $activation['plan_id'],
                'code'    => $activation['code'],
                'expired' => $expiredAt
            ]);

            $db->commit();

            // Cập nhật session
            $_SESSION['membership'] = 'pro';
            $_SESSION['membership_expired_at'] = $expiredAt;

            $this->json([
                'success'    => true,
                'plan_name'  => $activation['plan_name'],
                'expired_at' => date('d/m/Y', strtotime($expiredAt)),
                'message'    => 'Kích hoạt thành công! Bạn đã là hội viên ' . $activation['plan_name']
            ]);

        } catch (Exception $e) {
            $db->rollBack();
            $this->json(['error' => 'Có lỗi xảy ra. Vui lòng thử lại.'], 500);
        }
    }
}
