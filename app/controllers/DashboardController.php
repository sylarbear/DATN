<?php
/**
 * DashboardController
 * Hiển thị tiến độ học tập
 */
class DashboardController extends Controller {

    /**
     * Trang dashboard
     */
    public function index() {
        Middleware::requireLogin();

        $progressModel = $this->model('UserProgress');
        $dashboardData = $progressModel->getDashboardData($_SESSION['user_id']);

        $this->view('dashboard/index', [
            'title'    => 'Dashboard - ' . APP_NAME,
            'data'     => $dashboardData,
            'user'     => Middleware::user()
        ]);
    }

    /**
     * API lấy dữ liệu chart (AJAX)
     */
    public function chartData() {
        Middleware::requireLogin();

        $progressModel = $this->model('UserProgress');
        $data = $progressModel->getDashboardData($_SESSION['user_id']);

        // Chuẩn bị dữ liệu cho Chart.js
        $chartData = [
            'topics' => [],
            'scores' => [],
            'vocab'  => [],
            'tests'  => [],
            'speaking' => []
        ];

        foreach ($data['topic_progress'] as $tp) {
            $chartData['topics'][]   = $tp['topic_name'];
            $chartData['scores'][]   = $tp['total_score'];
            $chartData['vocab'][]    = $tp['vocab_learned'];
            $chartData['tests'][]    = $tp['tests_passed'];
            $chartData['speaking'][] = $tp['speaking_practiced'];
        }

        $this->json($chartData);
    }
}
