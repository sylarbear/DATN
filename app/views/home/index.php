<!-- Home Page -->
<section class="hero">
    <div class="hero-content">
        <div class="hero-badge">🎓 Nền tảng học tiếng Anh #1</div>
        <h1>Chinh phục tiếng Anh<br><span class="gradient-text">theo cách của bạn</span></h1>
        <p class="hero-description">Học từ vựng theo chủ đề, luyện kỹ năng Reading, Listening và Speaking với công nghệ AI đánh giá phát âm thông minh.</p>
        <div class="hero-actions">
            <?php if (!Middleware::isLoggedIn()): ?>
                <a href="<?= BASE_URL ?>/auth/register" class="btn btn-primary btn-lg">
                    <i class="fas fa-rocket"></i> Bắt đầu miễn phí
                </a>
                <a href="<?= BASE_URL ?>/topic" class="btn btn-outline btn-lg">
                    <i class="fas fa-compass"></i> Khám phá
                </a>
            <?php else: ?>
                <a href="<?= BASE_URL ?>/topic" class="btn btn-primary btn-lg">
                    <i class="fas fa-book-open"></i> Tiếp tục học
                </a>
                <a href="<?= BASE_URL ?>/dashboard" class="btn btn-outline btn-lg">
                    <i class="fas fa-chart-line"></i> Xem tiến độ
                </a>
            <?php endif; ?>
        </div>
        <div class="hero-stats">
            <div class="stat-item">
                <span class="stat-number"><?= count($topics) ?></span>
                <span class="stat-label">Chủ đề</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">100+</span>
                <span class="stat-label">Từ vựng</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">AI</span>
                <span class="stat-label">Chấm Speaking</span>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="features">
    <div class="container">
        <div class="section-header">
            <h2>Tính năng nổi bật</h2>
            <p>Hệ thống học tập toàn diện giúp bạn nắm vững tiếng Anh</p>
        </div>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon" style="background: linear-gradient(135deg, #667eea, #764ba2);">
                    <i class="fas fa-book-open"></i>
                </div>
                <h3>Học theo chủ đề</h3>
                <p>Từ vựng và bài học được phân chia theo chủ đề từ cơ bản đến nâng cao.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon" style="background: linear-gradient(135deg, #f093fb, #f5576c);">
                    <i class="fas fa-clipboard-check"></i>
                </div>
                <h3>Bài kiểm tra đa dạng</h3>
                <p>Quiz trắc nghiệm, Listening và Reading comprehension giúp đánh giá trình độ.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon" style="background: linear-gradient(135deg, #4facfe, #00f2fe);">
                    <i class="fas fa-microphone"></i>
                </div>
                <h3>Luyện nói với AI</h3>
                <p>Ghi âm giọng nói, chuyển thành text và được AI chấm điểm phát âm.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon" style="background: linear-gradient(135deg, #43e97b, #38f9d7);">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3>Theo dõi tiến độ</h3>
                <p>Dashboard trực quan giúp bạn nắm bắt tiến trình học tập mọi lúc.</p>
            </div>
        </div>
    </div>
</section>

<!-- Topics Preview -->
<section class="topics-preview">
    <div class="container">
        <div class="section-header">
            <h2>Chủ đề phổ biến</h2>
            <p>Bắt đầu với những chủ đề hàng đầu của chúng tôi</p>
        </div>
        <div class="topics-grid">
            <?php foreach (array_slice($topics, 0, 6) as $topic): ?>
                <a href="<?= BASE_URL ?>/topic/show/<?= $topic['id'] ?>" class="topic-card">
                    <div class="topic-card-header">
                        <span class="topic-level level-<?= $topic['level'] ?>"><?= ucfirst($topic['level']) ?></span>
                    </div>
                    <div class="topic-card-body">
                        <h3><?= htmlspecialchars($topic['name']) ?></h3>
                        <p><?= htmlspecialchars(mb_substr($topic['description'], 0, 80)) ?>...</p>
                    </div>
                    <div class="topic-card-footer">
                        <span><i class="fas fa-font"></i> <?= $topic['vocab_count'] ?> từ vựng</span>
                        <span><i class="fas fa-book"></i> <?= $topic['lesson_count'] ?> bài học</span>
                    </div>
                </a>
            <?php endforeach; ?>
        </div>
        <div class="text-center" style="margin-top: 2rem;">
            <a href="<?= BASE_URL ?>/topic" class="btn btn-primary">Xem tất cả chủ đề <i class="fas fa-arrow-right"></i></a>
        </div>
    </div>
</section>
