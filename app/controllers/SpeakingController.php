<?php
/**
 * SpeakingController
 * Luyện nói + chấm điểm
 */
class SpeakingController extends Controller {

    /**
     * Danh sách bài speaking
     */
    public function index() {
        $speakingModel = $this->model('SpeakingAttempt');
        $prompts = $speakingModel->getAllPrompts();

        // Group theo topic
        $groupedPrompts = [];
        foreach ($prompts as $p) {
            $groupedPrompts[$p['topic_name']][] = $p;
        }

        $this->view('speaking/index', [
            'title'          => 'Luyện nói - ' . APP_NAME,
            'groupedPrompts' => $groupedPrompts,
            'user'           => Middleware::user()
        ]);
    }

    /**
     * Trang luyện nói
     * @param int $promptId
     */
    public function practice($promptId = null) {
        Middleware::requireLogin();
        Middleware::requirePro();
        if (!$promptId) $this->redirect('speaking');

        $speakingModel = $this->model('SpeakingAttempt');
        $prompt = $speakingModel->getPrompt($promptId);
        if (!$prompt) $this->redirect('speaking');

        // Lấy lịch sử attempts
        $stmt = getDB()->prepare("
            SELECT * FROM speaking_attempts 
            WHERE user_id = :user_id AND prompt_id = :prompt_id 
            ORDER BY created_at DESC LIMIT 5
        ");
        $stmt->execute(['user_id' => $_SESSION['user_id'], 'prompt_id' => $promptId]);
        $history = $stmt->fetchAll();

        $this->view('speaking/practice', [
            'title'   => 'Luyện nói - ' . APP_NAME,
            'prompt'  => $prompt,
            'history' => $history,
            'user'    => Middleware::user()
        ]);
    }

    /**
     * Chấm điểm speaking (AJAX)
     */
    public function score() {
        Middleware::requireLogin();

        if (!$this->isMethod('POST')) {
            $this->json(['error' => 'Method not allowed'], 405);
        }

        $input = json_decode(file_get_contents('php://input'), true);
        $promptId   = intval($input['prompt_id'] ?? 0);
        $transcript = $input['transcript'] ?? '';
        $confidence = floatval($input['confidence'] ?? 0.5);

        if (!$promptId || empty($transcript)) {
            $this->json(['error' => 'Dữ liệu không hợp lệ'], 400);
        }

        $speakingModel = $this->model('SpeakingAttempt');
        $prompt = $speakingModel->getPrompt($promptId);

        if (!$prompt) {
            $this->json(['error' => 'Prompt không tồn tại'], 404);
        }

        // Chấm điểm
        $scores = $speakingModel->scoreSpeaking($transcript, $prompt['sample_answer'], $confidence);

        // Lưu attempt
        $attemptId = $speakingModel->saveAttempt($_SESSION['user_id'], $promptId, $transcript, $scores);

        // Cập nhật progress
        $progressModel = $this->model('UserProgress');
        $progressModel->increment($_SESSION['user_id'], $prompt['topic_id'], 'speaking_practiced');
        $progressModel->addScore($_SESSION['user_id'], $prompt['topic_id'], $scores['overall_score']);

        $this->json([
            'success'    => true,
            'attempt_id' => $attemptId,
            'scores'     => $scores,
            'transcript' => $transcript
        ]);
    }
}
