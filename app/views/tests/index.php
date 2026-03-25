<!-- Tests List Page -->
<section class="page-header">
    <div class="container">
        <h1><i class="fas fa-clipboard-check"></i> Bài kiểm tra</h1>
        <p>Đánh giá trình độ tiếng Anh của bạn</p>
    </div>
</section>

<section class="tests-section">
    <div class="container">
        <?php if (empty($tests)): ?>
            <div class="empty-state">
                <i class="fas fa-clipboard"></i>
                <p>Chưa có bài test nào.</p>
            </div>
        <?php else: ?>
            <div class="tests-grid">
                <?php foreach ($tests as $test): ?>
                    <div class="test-card" id="test-<?= $test['id'] ?>">
                        <div class="test-card-header">
                            <span class="test-type type-<?= $test['test_type'] ?>">
                                <?php
                                    $typeIcons = ['quiz' => 'fa-question-circle', 'listening' => 'fa-headphones', 'reading' => 'fa-book-reader'];
                                    $typeLabels = ['quiz' => 'Quiz', 'listening' => 'Listening', 'reading' => 'Reading'];
                                ?>
                                <i class="fas <?= $typeIcons[$test['test_type']] ?>"></i>
                                <?= $typeLabels[$test['test_type']] ?>
                            </span>
                            <span class="test-topic"><?= htmlspecialchars($test['topic_name']) ?></span>
                        </div>
                        <div class="test-card-body">
                            <h3><?= htmlspecialchars($test['title']) ?></h3>
                            <div class="test-meta">
                                <span><i class="fas fa-list-ol"></i> <?= $test['question_count'] ?> câu hỏi</span>
                                <span><i class="fas fa-clock"></i> <?= $test['duration_minutes'] ?> phút</span>
                                <span><i class="fas fa-trophy"></i> Đạt: <?= $test['pass_score'] ?>%</span>
                            </div>
                        </div>
                        <div class="test-card-footer">
                            <?php if (Middleware::isLoggedIn()): ?>
                                <a href="<?= BASE_URL ?>/test/take/<?= $test['id'] ?>" class="btn btn-primary btn-block">
                                    <i class="fas fa-play"></i> Làm bài
                                </a>
                            <?php else: ?>
                                <a href="<?= BASE_URL ?>/auth/login" class="btn btn-outline btn-block">
                                    <i class="fas fa-lock"></i> Đăng nhập để làm bài
                                </a>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</section>
