<?php
/**
 * LessonController
 * Hiển thị bài học
 */
class LessonController extends Controller {

    /**
     * Danh sách bài học theo topic
     * @param int $topicId
     */
    public function index($topicId = null) {
        if (!$topicId) $this->redirect('topic');

        $topicModel = $this->model('Topic');
        $lessonModel = $this->model('Lesson');

        $topic = $topicModel->find($topicId);
        if (!$topic) $this->redirect('topic');

        $lessons = $lessonModel->getByTopic($topicId);

        $this->view('lessons/index', [
            'title'   => 'Bài học: ' . $topic['name'] . ' - ' . APP_NAME,
            'topic'   => $topic,
            'lessons' => $lessons,
            'user'    => Middleware::user()
        ]);
    }

    /**
     * Chi tiết bài học
     * @param int $id Lesson ID
     */
    public function show($id = null) {
        if (!$id) $this->redirect('topic');

        $lessonModel = $this->model('Lesson');
        $lesson = $lessonModel->getWithContents($id);
        if (!$lesson) $this->redirect('topic');

        $topicModel = $this->model('Topic');
        $topic = $topicModel->find($lesson['topic_id']);

        // Đánh dấu hoàn thành nếu đã đăng nhập
        if (Middleware::isLoggedIn()) {
            $progressModel = $this->model('UserProgress');
            $progressModel->increment($_SESSION['user_id'], $lesson['topic_id'], 'lessons_completed');
        }

        // Lấy bài học tiếp theo
        $allLessons = $lessonModel->getByTopic($lesson['topic_id']);
        $nextLesson = null;
        $prevLesson = null;
        foreach ($allLessons as $i => $l) {
            if ($l['id'] == $id) {
                $nextLesson = $allLessons[$i + 1] ?? null;
                $prevLesson = $allLessons[$i - 1] ?? null;
                break;
            }
        }

        $this->view('lessons/show', [
            'title'      => $lesson['title'] . ' - ' . APP_NAME,
            'lesson'     => $lesson,
            'topic'      => $topic,
            'nextLesson' => $nextLesson,
            'prevLesson' => $prevLesson,
            'user'       => Middleware::user()
        ]);
    }
}
