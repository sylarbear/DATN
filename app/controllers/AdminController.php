<?php
/**
 * AdminController
 * Trang quản trị cho admin: quản lý users, topics, questions, codes
 */
class AdminController extends Controller {

    public function __construct() {
        Middleware::requireAdmin();
    }

    /** Dashboard admin - thống kê tổng quan */
    public function index() {
        $db = getDB();
        $stats = [];
        $stats['total_users'] = $db->query("SELECT COUNT(*) FROM users WHERE role='student'")->fetchColumn();
        $stats['pro_users'] = $db->query("SELECT COUNT(*) FROM users WHERE membership='pro'")->fetchColumn();
        $stats['total_topics'] = $db->query("SELECT COUNT(*) FROM topics")->fetchColumn();
        $stats['total_tests'] = $db->query("SELECT COUNT(*) FROM tests")->fetchColumn();
        $stats['total_questions'] = $db->query("SELECT COUNT(*) FROM questions")->fetchColumn();
        $stats['total_attempts'] = $db->query("SELECT COUNT(*) FROM test_attempts")->fetchColumn();
        $stats['unused_codes'] = $db->query("SELECT COUNT(*) FROM activation_codes WHERE is_used=0")->fetchColumn();
        $stats['used_codes'] = $db->query("SELECT COUNT(*) FROM activation_codes WHERE is_used=1")->fetchColumn();

        // Recent users
        $stats['recent_users'] = $db->query("SELECT * FROM users ORDER BY created_at DESC LIMIT 5")->fetchAll();
        // Recent attempts
        $stats['recent_attempts'] = $db->query("
            SELECT ta.*, u.username, t.title as test_title 
            FROM test_attempts ta 
            JOIN users u ON ta.user_id = u.id 
            JOIN tests t ON ta.test_id = t.id 
            ORDER BY ta.completed_at DESC LIMIT 5
        ")->fetchAll();

        $this->view('admin/dashboard', [
            'title' => 'Admin Dashboard - ' . APP_NAME,
            'stats' => $stats
        ]);
    }

    /** Quản lý Users */
    public function users() {
        $db = getDB();
        $search = $_GET['search'] ?? '';
        if ($search) {
            $stmt = $db->prepare("SELECT * FROM users WHERE username LIKE :s OR full_name LIKE :s OR email LIKE :s ORDER BY created_at DESC");
            $stmt->execute(['s' => "%$search%"]);
        } else {
            $stmt = $db->query("SELECT * FROM users ORDER BY created_at DESC");
        }
        $users = $stmt->fetchAll();

        $this->view('admin/users', [
            'title' => 'Quản lý Users - Admin',
            'users' => $users,
            'search' => $search
        ]);
    }

    /** Sửa user (AJAX) */
    public function updateUser() {
        if (!$this->isMethod('POST')) $this->json(['error' => 'Method not allowed'], 405);
        $input = json_decode(file_get_contents('php://input'), true);
        $db = getDB();
        $stmt = $db->prepare("UPDATE users SET full_name=:name, email=:email, role=:role, membership=:mem WHERE id=:id");
        $stmt->execute([
            'name' => $input['full_name'],
            'email' => $input['email'],
            'role' => $input['role'],
            'mem' => $input['membership'],
            'id' => $input['id']
        ]);
        $this->json(['success' => true, 'message' => 'Cập nhật thành công']);
    }

    /** Xóa user (AJAX) */
    public function deleteUser() {
        if (!$this->isMethod('POST')) $this->json(['error' => 'Method not allowed'], 405);
        $input = json_decode(file_get_contents('php://input'), true);
        $db = getDB();
        $db->prepare("DELETE FROM test_attempts WHERE user_id=:id")->execute(['id' => $input['id']]);
        $db->prepare("DELETE FROM speaking_attempts WHERE user_id=:id")->execute(['id' => $input['id']]);
        $db->prepare("DELETE FROM membership_orders WHERE user_id=:id")->execute(['id' => $input['id']]);
        $db->prepare("DELETE FROM users WHERE id=:id AND role != 'admin'")->execute(['id' => $input['id']]);
        $this->json(['success' => true, 'message' => 'Đã xóa user']);
    }

    /** Quản lý Topics */
    public function topics() {
        $db = getDB();
        $topics = $db->query("
            SELECT t.*, 
                (SELECT COUNT(*) FROM lessons WHERE topic_id=t.id) as lesson_count,
                (SELECT COUNT(*) FROM vocabularies WHERE topic_id=t.id) as vocab_count,
                (SELECT COUNT(*) FROM tests WHERE topic_id=t.id) as test_count
            FROM topics t ORDER BY t.id
        ")->fetchAll();

        $this->view('admin/topics', [
            'title' => 'Quản lý Chủ đề - Admin',
            'topics' => $topics
        ]);
    }

    /** Thêm/sửa topic (AJAX) */
    public function saveTopic() {
        if (!$this->isMethod('POST')) $this->json(['error' => 'Method not allowed'], 405);
        $input = json_decode(file_get_contents('php://input'), true);
        $db = getDB();

        if (!empty($input['id'])) {
            $stmt = $db->prepare("UPDATE topics SET name=:name, description=:desc, level=:level WHERE id=:id");
            $stmt->execute(['name'=>$input['name'], 'desc'=>$input['description'], 'level'=>$input['level'], 'id'=>$input['id']]);
            $this->json(['success' => true, 'message' => 'Cập nhật chủ đề thành công']);
        } else {
            $stmt = $db->prepare("INSERT INTO topics (name, description, level) VALUES (:name, :desc, :level)");
            $stmt->execute(['name'=>$input['name'], 'desc'=>$input['description'], 'level'=>$input['level']]);
            $this->json(['success' => true, 'message' => 'Thêm chủ đề thành công', 'id' => $db->lastInsertId()]);
        }
    }

    /** Quản lý Questions theo Test */
    public function questions() {
        $db = getDB();
        $testId = $_GET['test_id'] ?? null;
        $tests = $db->query("SELECT t.*, tp.name as topic_name FROM tests t JOIN topics tp ON t.topic_id=tp.id ORDER BY t.id")->fetchAll();
        $questions = [];
        $currentTest = null;

        if ($testId) {
            $stmt = $db->prepare("SELECT * FROM questions WHERE test_id=:tid ORDER BY id");
            $stmt->execute(['tid' => $testId]);
            $questions = $stmt->fetchAll();
            foreach ($tests as $t) { if ($t['id'] == $testId) { $currentTest = $t; break; } }
        }

        $this->view('admin/questions', [
            'title' => 'Quản lý Câu hỏi - Admin',
            'tests' => $tests,
            'questions' => $questions,
            'currentTest' => $currentTest,
            'testId' => $testId
        ]);
    }

    /** Thêm/sửa question (AJAX) */
    public function saveQuestion() {
        if (!$this->isMethod('POST')) $this->json(['error' => 'Method not allowed'], 405);
        $input = json_decode(file_get_contents('php://input'), true);
        $db = getDB();

        $options = json_encode([
            'A' => $input['option_a'],
            'B' => $input['option_b'],
            'C' => $input['option_c'],
            'D' => $input['option_d']
        ], JSON_UNESCAPED_UNICODE);

        if (!empty($input['id'])) {
            $stmt = $db->prepare("UPDATE questions SET question_text=:q, options=:o, correct_answer=:a, passage=:p WHERE id=:id");
            $stmt->execute(['q'=>$input['question_text'], 'o'=>$options, 'a'=>$input['correct_answer'], 'p'=>$input['passage']??null, 'id'=>$input['id']]);
            $this->json(['success' => true, 'message' => 'Cập nhật câu hỏi thành công']);
        } else {
            $stmt = $db->prepare("INSERT INTO questions (test_id, question_text, options, correct_answer, passage) VALUES (:tid, :q, :o, :a, :p)");
            $stmt->execute(['tid'=>$input['test_id'], 'q'=>$input['question_text'], 'o'=>$options, 'a'=>$input['correct_answer'], 'p'=>$input['passage']??null]);
            $this->json(['success' => true, 'message' => 'Thêm câu hỏi thành công', 'id' => $db->lastInsertId()]);
        }
    }

    /** Xóa question (AJAX) */
    public function deleteQuestion() {
        if (!$this->isMethod('POST')) $this->json(['error' => 'Method not allowed'], 405);
        $input = json_decode(file_get_contents('php://input'), true);
        $db = getDB();
        $db->prepare("DELETE FROM questions WHERE id=:id")->execute(['id' => $input['id']]);
        $this->json(['success' => true, 'message' => 'Đã xóa câu hỏi']);
    }

    /** Quản lý mã kích hoạt */
    public function codes() {
        $db = getDB();
        $codes = $db->query("
            SELECT ac.*, mp.name as plan_name, u.username as used_by_name 
            FROM activation_codes ac 
            JOIN membership_plans mp ON ac.plan_id = mp.id
            LEFT JOIN users u ON ac.used_by = u.id
            ORDER BY ac.is_used ASC, ac.created_at DESC
        ")->fetchAll();
        $plans = $db->query("SELECT * FROM membership_plans ORDER BY duration_months")->fetchAll();

        $this->view('admin/codes', [
            'title' => 'Quản lý Mã kích hoạt - Admin',
            'codes' => $codes,
            'plans' => $plans
        ]);
    }

    /** Tạo mã kích hoạt (AJAX) */
    public function createCode() {
        if (!$this->isMethod('POST')) $this->json(['error' => 'Method not allowed'], 405);
        $input = json_decode(file_get_contents('php://input'), true);
        $db = getDB();
        $code = strtoupper($input['code']);
        
        // Check trùng
        $exists = $db->prepare("SELECT COUNT(*) FROM activation_codes WHERE code=:c");
        $exists->execute(['c' => $code]);
        if ($exists->fetchColumn() > 0) {
            $this->json(['error' => 'Mã đã tồn tại'], 400);
        }

        $stmt = $db->prepare("INSERT INTO activation_codes (code, plan_id) VALUES (:code, :plan)");
        $stmt->execute(['code' => $code, 'plan' => $input['plan_id']]);
        $this->json(['success' => true, 'message' => 'Tạo mã thành công']);
    }

    /** Xóa code */
    public function deleteCode() {
        if (!$this->isMethod('POST')) $this->json(['error' => 'Method not allowed'], 405);
        $input = json_decode(file_get_contents('php://input'), true);
        $db = getDB();
        $db->prepare("DELETE FROM activation_codes WHERE id=:id AND is_used=0")->execute(['id' => $input['id']]);
        $this->json(['success' => true, 'message' => 'Đã xóa mã']);
    }
}
