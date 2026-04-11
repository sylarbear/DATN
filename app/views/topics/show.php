<!-- Topic Detail Page -->
<section class="page-header">
    <div class="container">
        <nav class="breadcrumb">
            <a href="<?= BASE_URL ?>/topic">Chủ đề</a>
            <span>/</span>
            <span><?= htmlspecialchars($topic['name']) ?></span>
        </nav>
        <h1><?= htmlspecialchars($topic['name']) ?></h1>
        <p><?= htmlspecialchars($topic['description']) ?></p>
        <span class="topic-level level-<?= $topic['level'] ?>"><?= ucfirst($topic['level']) ?></span>
    </div>
</section>

<!-- Progress Bar (if logged in) -->
<?php if ($progress): ?>
<section class="progress-section">
    <div class="container">
        <div class="progress-overview">
            <div class="progress-item">
                <div class="progress-icon"><i class="fas fa-font"></i></div>
                <div class="progress-info">
                    <span><?= min($progress['vocab_learned'], $topic['vocab_count']) ?> / <?= $topic['vocab_count'] ?></span>
                    <small>Từ vựng đã học</small>
                </div>
            </div>
            <div class="progress-item">
                <div class="progress-icon"><i class="fas fa-book"></i></div>
                <div class="progress-info">
                    <span><?= min($progress['lessons_completed'], $topic['lesson_count']) ?> / <?= $topic['lesson_count'] ?></span>
                    <small>Bài học hoàn thành</small>
                </div>
            </div>
            <div class="progress-item">
                <div class="progress-icon"><i class="fas fa-trophy"></i></div>
                <div class="progress-info">
                    <span><?= min($progress['tests_passed'], $topic['test_count']) ?> / <?= $topic['test_count'] ?></span>
                    <small>Test đã đạt</small>
                </div>
            </div>
            <div class="progress-item">
                <div class="progress-icon"><i class="fas fa-star"></i></div>
                <div class="progress-info">
                    <span><?= $progress['total_score'] ?></span>
                    <small>Tổng điểm</small>
                </div>
            </div>
        </div>
    </div>
</section>
<?php endif; ?>

<!-- Tab Navigation -->
<section class="topic-content">
    <div class="container">
        <div class="tab-nav">
            <button class="tab-btn active" onclick="showTab('vocab')"><i class="fas fa-font"></i> Từ vựng (<?= count($vocabularies) ?>)</button>
            <button class="tab-btn" onclick="showTab('lessons')"><i class="fas fa-book"></i> Bài học (<?= count($lessons) ?>)</button>
            <a href="<?= BASE_URL ?>/topic/flashcard/<?= $topic['id'] ?>" class="btn btn-primary btn-sm" style="margin-left:auto;"><i class="fas fa-clone"></i> Flashcard</a>
        </div>

        <!-- Vocabulary Tab -->
        <div class="tab-content active" id="tab-vocab">
            <div class="vocab-grid">
                <?php foreach ($vocabularies as $i => $vocab): ?>
                    <div class="vocab-card" id="vocab-<?= $vocab['id'] ?>">
                        <div class="vocab-word">
                            <h3><?= htmlspecialchars($vocab['word']) ?></h3>
                            <span class="vocab-pronunciation"><?= htmlspecialchars($vocab['pronunciation']) ?></span>
                            <button class="btn-speak" onclick="speakWord('<?= htmlspecialchars($vocab['word']) ?>')" title="Phát âm">
                                <i class="fas fa-volume-up"></i>
                            </button>
                        </div>
                        <div class="vocab-meaning">
                            <p class="meaning-vi"><strong>Nghĩa:</strong> <?= htmlspecialchars($vocab['meaning_vi']) ?></p>
                            <?php if ($vocab['example_sentence']): ?>
                                <p class="vocab-example"><strong>Ví dụ:</strong> <em><?= htmlspecialchars($vocab['example_sentence']) ?></em></p>
                            <?php endif; ?>
                        </div>
                        <?php if (Middleware::isLoggedIn()): ?>
                            <button class="btn btn-sm btn-success btn-learn" 
                                    onclick="markLearned(this, <?= $topic['id'] ?>)" 
                                    data-vocab-id="<?= $vocab['id'] ?>">
                                <i class="fas fa-check"></i> Đã học
                            </button>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

        <!-- Lessons Tab -->
        <div class="tab-content" id="tab-lessons">
            <div class="lessons-list">
                <?php foreach ($lessons as $i => $lesson): ?>
                    <a href="<?= BASE_URL ?>/lesson/show/<?= $lesson['id'] ?>" class="lesson-item" id="lesson-<?= $lesson['id'] ?>">
                        <div class="lesson-number"><?= $i + 1 ?></div>
                        <div class="lesson-info">
                            <h3><?= htmlspecialchars($lesson['title']) ?></h3>
                            <p><?= htmlspecialchars($lesson['description']) ?></p>
                        </div>
                        <div class="lesson-arrow"><i class="fas fa-chevron-right"></i></div>
                    </a>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>

<script>
// Tab switching
function showTab(tab) {
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
    
    event.target.closest('.tab-btn').classList.add('active');
    document.getElementById('tab-' + tab).classList.add('active');
}

// Text-to-Speech cho từ vựng
function speakWord(word) {
    speechSynthesis.cancel(); // Dừng audio trước đó
    const utterance = new SpeechSynthesisUtterance(word);
    utterance.lang = 'en-US';
    utterance.rate = 0.8;
    speechSynthesis.speak(utterance);
}

// Đánh dấu từ đã học
function markLearned(btn, topicId) {
    btn.disabled = true;
    btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang lưu...';
    
    fetch('<?= BASE_URL ?>/topic/learnVocab', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'same-origin',
        body: JSON.stringify({topic_id: topicId})
    })
    .then(r => r.json())
    .then(data => {
        if (data.success) {
            btn.innerHTML = '<i class="fas fa-check-double"></i> Đã ghi nhận';
            btn.classList.add('learned');
        }
    })
    .catch(() => {
        btn.disabled = false;
        btn.innerHTML = '<i class="fas fa-check"></i> Đã học';
    });
}
</script>
