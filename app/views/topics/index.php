<!-- Topics List Page -->
<section class="page-header">
    <div class="container">
        <h1><i class="fas fa-book-open"></i> Chủ đề học tập</h1>
        <p>Chọn chủ đề phù hợp với trình độ của bạn</p>
    </div>
</section>

<section class="topics-section">
    <div class="container">
        <!-- Level Filter -->
        <div class="filter-bar">
            <a href="<?= BASE_URL ?>/topic" class="filter-btn <?= empty($level) ? 'active' : '' ?>">Tất cả</a>
            <a href="<?= BASE_URL ?>/topic?level=beginner" class="filter-btn <?= $level === 'beginner' ? 'active' : '' ?>">
                <i class="fas fa-seedling"></i> Beginner
            </a>
            <a href="<?= BASE_URL ?>/topic?level=intermediate" class="filter-btn <?= $level === 'intermediate' ? 'active' : '' ?>">
                <i class="fas fa-fire"></i> Intermediate
            </a>
            <a href="<?= BASE_URL ?>/topic?level=advanced" class="filter-btn <?= $level === 'advanced' ? 'active' : '' ?>">
                <i class="fas fa-crown"></i> Advanced
            </a>
        </div>

        <!-- Topics Grid -->
        <div class="topics-grid">
            <?php foreach ($topics as $topic): ?>
                <?php if ($level && $topic['level'] !== $level) continue; ?>
                <a href="<?= BASE_URL ?>/topic/show/<?= $topic['id'] ?>" class="topic-card" id="topic-<?= $topic['id'] ?>">
                    <div class="topic-card-header">
                        <span class="topic-level level-<?= $topic['level'] ?>"><?= ucfirst($topic['level']) ?></span>
                    </div>
                    <div class="topic-card-body">
                        <h3><?= htmlspecialchars($topic['name']) ?></h3>
                        <p><?= htmlspecialchars($topic['description']) ?></p>
                    </div>
                    <div class="topic-card-footer">
                        <span><i class="fas fa-font"></i> <?= $topic['vocab_count'] ?> từ vựng</span>
                        <span><i class="fas fa-book"></i> <?= $topic['lesson_count'] ?> bài học</span>
                        <span><i class="fas fa-clipboard"></i> <?= $topic['test_count'] ?> bài test</span>
                        <span><i class="fas fa-microphone"></i> <?= $topic['speaking_count'] ?> speaking</span>
                    </div>
                </a>
            <?php endforeach; ?>
        </div>
    </div>
</section>
