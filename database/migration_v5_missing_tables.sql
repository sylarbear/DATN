-- ============================================
-- Migration V5: Tạo các bảng còn thiếu
-- Bao gồm: bookmarks, xp_history, activation_codes,
--           membership_plans, membership_orders,
--           grammar_lessons, grammar_questions
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE english_master;

-- ============================================
-- BẢNG BOOKMARKS - Từ vựng yêu thích
-- ============================================
CREATE TABLE IF NOT EXISTS `bookmarks` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `vocabulary_id` INT NOT NULL,
    `note` TEXT DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    UNIQUE KEY `unique_user_vocab` (`user_id`, `vocabulary_id`),
    INDEX `idx_user` (`user_id`),
    INDEX `idx_vocab` (`vocabulary_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabularies`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- BẢNG XP_HISTORY - Lịch sử XP
-- ============================================
CREATE TABLE IF NOT EXISTS `xp_history` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `xp_amount` INT NOT NULL DEFAULT 0,
    `activity_type` VARCHAR(50) NOT NULL,
    `description` VARCHAR(255) DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX `idx_user` (`user_id`),
    INDEX `idx_type` (`activity_type`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- BẢNG MEMBERSHIP_PLANS - Gói hội viên
-- ============================================
CREATE TABLE IF NOT EXISTS `membership_plans` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `duration_months` INT NOT NULL DEFAULT 1,
    `price` INT NOT NULL DEFAULT 0 COMMENT 'Giá VND',
    `description` TEXT DEFAULT NULL,
    `is_active` TINYINT(1) DEFAULT 1,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dữ liệu mẫu cho membership_plans
INSERT IGNORE INTO `membership_plans` (`id`, `name`, `duration_months`, `price`, `description`) VALUES
(1, 'Pro 1 tháng', 1, 49000, 'Trải nghiệm Pro trong 1 tháng'),
(2, 'Pro 3 tháng', 3, 119000, 'Tiết kiệm 20% so với gói 1 tháng'),
(3, 'Pro 1 năm', 12, 399000, 'Tiết kiệm 32% - Ưu đãi tốt nhất');

-- ============================================
-- BẢNG ACTIVATION_CODES - Mã kích hoạt Pro
-- ============================================
CREATE TABLE IF NOT EXISTS `activation_codes` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(30) NOT NULL UNIQUE,
    `plan_id` INT NOT NULL,
    `is_used` TINYINT(1) DEFAULT 0,
    `used_by` INT DEFAULT NULL,
    `used_at` DATETIME DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX `idx_code` (`code`),
    INDEX `idx_plan` (`plan_id`),
    FOREIGN KEY (`plan_id`) REFERENCES `membership_plans`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`used_by`) REFERENCES `users`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- BẢNG MEMBERSHIP_ORDERS - Đơn nâng cấp Pro
-- ============================================
CREATE TABLE IF NOT EXISTS `membership_orders` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `plan_id` INT NOT NULL,
    `activation_code` VARCHAR(30) DEFAULT NULL,
    `transfer_note` TEXT DEFAULT NULL,
    `amount` INT NOT NULL DEFAULT 0,
    `payment_method` ENUM('qr_transfer', 'activation_code', 'casso_auto') DEFAULT 'qr_transfer',
    `status` ENUM('pending', 'completed', 'cancelled') DEFAULT 'pending',
    `expired_at` DATETIME DEFAULT NULL,
    `activated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX `idx_user` (`user_id`),
    INDEX `idx_status` (`status`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`plan_id`) REFERENCES `membership_plans`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- BẢNG GRAMMAR_LESSONS - Bài học ngữ pháp
-- ============================================
CREATE TABLE IF NOT EXISTS `grammar_lessons` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(200) NOT NULL,
    `category` VARCHAR(100) NOT NULL COMMENT 'Thì, Giới từ, Mệnh đề...',
    `level` ENUM('beginner', 'intermediate', 'advanced') DEFAULT 'beginner',
    `content` LONGTEXT NOT NULL COMMENT 'Nội dung bài học HTML',
    `sort_order` INT DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX `idx_category` (`category`),
    INDEX `idx_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- BẢNG GRAMMAR_QUESTIONS - Quiz ngữ pháp
-- ============================================
CREATE TABLE IF NOT EXISTS `grammar_questions` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `grammar_lesson_id` INT NOT NULL,
    `question_text` TEXT NOT NULL,
    `option_a` VARCHAR(255) NOT NULL,
    `option_b` VARCHAR(255) NOT NULL,
    `option_c` VARCHAR(255) DEFAULT NULL,
    `option_d` VARCHAR(255) DEFAULT NULL,
    `correct_answer` CHAR(1) NOT NULL COMMENT 'A, B, C hoặc D',
    `explanation` TEXT DEFAULT NULL COMMENT 'Giải thích đáp án',

    INDEX `idx_lesson` (`grammar_lesson_id`),
    FOREIGN KEY (`grammar_lesson_id`) REFERENCES `grammar_lessons`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- DỮ LIỆU MẪU - Grammar Lessons
-- ============================================
INSERT IGNORE INTO `grammar_lessons` (`id`, `title`, `category`, `level`, `content`, `sort_order`) VALUES
(1, 'Present Simple (Thì hiện tại đơn)', 'Tenses', 'beginner',
'<h3>Present Simple Tense</h3>
<p><strong>Cấu trúc:</strong></p>
<ul>
<li><strong>Khẳng định:</strong> S + V(s/es) + O</li>
<li><strong>Phủ định:</strong> S + do/does + not + V + O</li>
<li><strong>Nghi vấn:</strong> Do/Does + S + V + O?</li>
</ul>
<p><strong>Cách dùng:</strong></p>
<ul>
<li>Diễn tả thói quen, sự thật hiển nhiên</li>
<li>Diễn tả lịch trình, thời gian biểu cố định</li>
</ul>
<p><strong>Ví dụ:</strong></p>
<ul>
<li>I <strong>go</strong> to school every day.</li>
<li>She <strong>doesn''t like</strong> coffee.</li>
<li>The sun <strong>rises</strong> in the east.</li>
</ul>
<p><strong>Dấu hiệu nhận biết:</strong> always, usually, often, sometimes, never, every day/week/month...</p>', 1),

(2, 'Present Continuous (Thì hiện tại tiếp diễn)', 'Tenses', 'beginner',
'<h3>Present Continuous Tense</h3>
<p><strong>Cấu trúc:</strong></p>
<ul>
<li><strong>Khẳng định:</strong> S + am/is/are + V-ing + O</li>
<li><strong>Phủ định:</strong> S + am/is/are + not + V-ing + O</li>
<li><strong>Nghi vấn:</strong> Am/Is/Are + S + V-ing + O?</li>
</ul>
<p><strong>Cách dùng:</strong></p>
<ul>
<li>Diễn tả hành động đang xảy ra tại thời điểm nói</li>
<li>Diễn tả kế hoạch tương lai gần đã lên lịch</li>
</ul>
<p><strong>Ví dụ:</strong></p>
<ul>
<li>I <strong>am studying</strong> English now.</li>
<li>They <strong>are playing</strong> football.</li>
</ul>
<p><strong>Dấu hiệu nhận biết:</strong> now, right now, at the moment, at present, Look!, Listen!...</p>', 2),

(3, 'Prepositions of Time (Giới từ chỉ thời gian)', 'Prepositions', 'beginner',
'<h3>Prepositions of Time: in, on, at</h3>
<p><strong>AT</strong> - dùng cho giờ, thời điểm cụ thể:</p>
<ul>
<li>at 7 o''clock, at noon, at night, at the weekend</li>
</ul>
<p><strong>ON</strong> - dùng cho ngày, ngày tháng:</p>
<ul>
<li>on Monday, on 25th December, on my birthday</li>
</ul>
<p><strong>IN</strong> - dùng cho tháng, năm, mùa, khoảng thời gian dài:</p>
<ul>
<li>in January, in 2024, in summer, in the morning</li>
</ul>', 3);

-- Dữ liệu mẫu Quiz cho Present Simple
INSERT IGNORE INTO `grammar_questions` (`id`, `grammar_lesson_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `explanation`) VALUES
(1, 1, 'She ___ to school every day.', 'go', 'goes', 'going', 'gone', 'B', 'Với chủ ngữ ngôi thứ 3 số ít (she/he/it), động từ thêm -s/-es.'),
(2, 1, 'They ___ coffee in the morning.', 'drinks', 'drink', 'drinking', 'drunk', 'B', 'Với chủ ngữ số nhiều (they), động từ giữ nguyên.'),
(3, 1, '___ he like pizza?', 'Do', 'Does', 'Is', 'Are', 'B', 'Với chủ ngữ ngôi thứ 3 số ít, dùng Does trong câu hỏi.'),
(4, 1, 'The earth ___ around the sun.', 'revolve', 'revolves', 'revolving', 'revolved', 'B', 'Sự thật hiển nhiên dùng thì hiện tại đơn. The earth là ngôi 3 số ít.'),

(5, 2, 'Look! The children ___ in the park.', 'play', 'plays', 'are playing', 'played', 'C', 'Dấu hiệu "Look!" cho thấy hành động đang xảy ra → dùng Present Continuous.'),
(6, 2, 'I ___ English right now.', 'study', 'studies', 'am studying', 'studied', 'C', '"right now" là dấu hiệu của thì hiện tại tiếp diễn.'),
(7, 2, 'She ___ TV at the moment.', 'watches', 'watch', 'is watching', 'watched', 'C', '"at the moment" → Present Continuous. She + is + V-ing.'),

(8, 3, 'I have a meeting ___ Monday.', 'in', 'on', 'at', 'by', 'B', 'Dùng ON với ngày trong tuần: on Monday, on Friday...'),
(9, 3, 'The class starts ___ 8 o''clock.', 'in', 'on', 'at', 'by', 'C', 'Dùng AT với giờ cụ thể: at 8 o''clock, at noon...'),
(10, 3, 'We go on vacation ___ summer.', 'in', 'on', 'at', 'by', 'A', 'Dùng IN với mùa: in summer, in winter...');

SET FOREIGN_KEY_CHECKS = 1;
