<!-- Lesson Detail Page -->
<section class="page-header">
    <div class="container">
        <nav class="breadcrumb">
            <a href="<?= BASE_URL ?>/topic">Chủ đề</a>
            <span>/</span>
            <a href="<?= BASE_URL ?>/topic/show/<?= $topic['id'] ?>"><?= htmlspecialchars($topic['name']) ?></a>
            <span>/</span>
            <span><?= htmlspecialchars($lesson['title']) ?></span>
        </nav>
        <h1><?= htmlspecialchars($lesson['title']) ?></h1>
        <p><?= htmlspecialchars($lesson['description']) ?></p>
    </div>
</section>

<section class="lesson-content-section">
    <div class="container">
        <div class="lesson-body">
            <?php foreach ($lesson['contents'] as $content): ?>
                <div class="content-block content-<?= $content['content_type'] ?>">
                    <?php if ($content['content_type'] === 'text'): ?>
                        <div class="text-content">
                            <?= $content['content'] ?>
                        </div>
                    <?php elseif ($content['content_type'] === 'image'): ?>
                        <div class="image-content">
                            <img src="<?= $content['content'] ?>" alt="Lesson image" loading="lazy">
                        </div>
                    <?php elseif ($content['content_type'] === 'audio'): ?>
                        <div class="audio-content">
                            <audio controls>
                                <source src="<?= $content['content'] ?>" type="audio/mpeg">
                                Trình duyệt không hỗ trợ audio.
                            </audio>
                        </div>
                    <?php elseif ($content['content_type'] === 'video'): ?>
                        <div class="video-content">
                            <video controls width="100%">
                                <source src="<?= $content['content'] ?>" type="video/mp4">
                                Trình duyệt không hỗ trợ video.
                            </video>
                        </div>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        </div>

        <!-- Navigation giữa các bài -->
        <div class="lesson-navigation">
            <?php if ($prevLesson): ?>
                <a href="<?= BASE_URL ?>/lesson/show/<?= $prevLesson['id'] ?>" class="btn btn-outline">
                    <i class="fas fa-arrow-left"></i> <?= htmlspecialchars($prevLesson['title']) ?>
                </a>
            <?php else: ?>
                <span></span>
            <?php endif; ?>

            <?php if ($nextLesson): ?>
                <a href="<?= BASE_URL ?>/lesson/show/<?= $nextLesson['id'] ?>" class="btn btn-primary">
                    <?= htmlspecialchars($nextLesson['title']) ?> <i class="fas fa-arrow-right"></i>
                </a>
            <?php else: ?>
                <a href="<?= BASE_URL ?>/topic/show/<?= $topic['id'] ?>" class="btn btn-primary">
                    <i class="fas fa-check"></i> Hoàn thành
                </a>
            <?php endif; ?>
        </div>
    </div>
</section>
