-- ============================================
-- EnglishMaster Database Schema
-- Hệ thống học tiếng Anh trực tuyến
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- Tạo database
CREATE DATABASE IF NOT EXISTS english_master
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE english_master;

-- ============================================
-- 1. BẢNG USERS - Người dùng
-- ============================================
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NOT NULL,
    `full_name` VARCHAR(100) DEFAULT NULL,
    `avatar` VARCHAR(255) DEFAULT 'default.png',
    `role` ENUM('student', 'admin') DEFAULT 'student',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX `idx_username` (`username`),
    INDEX `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 2. BẢNG TOPICS - Chủ đề học
-- ============================================
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `slug` VARCHAR(100) UNIQUE,
    `description` TEXT,
    `thumbnail` VARCHAR(255) DEFAULT NULL,
    `level` ENUM('beginner', 'intermediate', 'advanced') DEFAULT 'beginner',
    `sort_order` INT DEFAULT 0,
    `is_active` TINYINT(1) DEFAULT 1,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_slug` (`slug`),
    INDEX `idx_level` (`level`),
    INDEX `idx_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 3. BẢNG VOCABULARIES - Từ vựng
-- ============================================
DROP TABLE IF EXISTS `vocabularies`;
CREATE TABLE `vocabularies` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `topic_id` INT NOT NULL,
    `word` VARCHAR(100) NOT NULL,
    `pronunciation` VARCHAR(100) DEFAULT NULL,
    `meaning_vi` VARCHAR(255) NOT NULL,
    `example_sentence` TEXT,
    `audio_url` VARCHAR(255) DEFAULT NULL,
    `image_url` VARCHAR(255) DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_topic` (`topic_id`),
    FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 4. BẢNG LESSONS - Bài học
-- ============================================
DROP TABLE IF EXISTS `lessons`;
CREATE TABLE `lessons` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `topic_id` INT NOT NULL,
    `title` VARCHAR(200) NOT NULL,
    `description` TEXT,
    `sort_order` INT DEFAULT 0,
    `is_active` TINYINT(1) DEFAULT 1,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_topic` (`topic_id`),
    FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 5. BẢNG LESSON_CONTENTS - Nội dung bài học
-- ============================================
DROP TABLE IF EXISTS `lesson_contents`;
CREATE TABLE `lesson_contents` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `lesson_id` INT NOT NULL,
    `content_type` ENUM('text', 'image', 'audio', 'video') NOT NULL DEFAULT 'text',
    `content` TEXT NOT NULL,
    `sort_order` INT DEFAULT 0,
    
    INDEX `idx_lesson` (`lesson_id`),
    FOREIGN KEY (`lesson_id`) REFERENCES `lessons`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 6. BẢNG TESTS - Bài kiểm tra
-- ============================================
DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `topic_id` INT NOT NULL,
    `title` VARCHAR(200) NOT NULL,
    `test_type` ENUM('quiz', 'listening', 'reading') NOT NULL,
    `duration_minutes` INT DEFAULT 30,
    `pass_score` INT DEFAULT 60,
    `is_active` TINYINT(1) DEFAULT 1,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_topic` (`topic_id`),
    INDEX `idx_type` (`test_type`),
    FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 7. BẢNG QUESTIONS - Câu hỏi
-- ============================================
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `test_id` INT NOT NULL,
    `question_text` TEXT NOT NULL,
    `question_type` ENUM('multiple_choice', 'true_false', 'fill_blank') NOT NULL DEFAULT 'multiple_choice',
    `options_json` JSON DEFAULT NULL COMMENT 'Mảng JSON các đáp án',
    `correct_answer` VARCHAR(255) NOT NULL,
    `audio_url` VARCHAR(255) DEFAULT NULL COMMENT 'Audio cho listening',
    `passage` TEXT DEFAULT NULL COMMENT 'Đoạn văn cho reading',
    `points` INT DEFAULT 1,
    `sort_order` INT DEFAULT 0,
    
    INDEX `idx_test` (`test_id`),
    FOREIGN KEY (`test_id`) REFERENCES `tests`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 8. BẢNG TEST_RESULTS - Kết quả thi
-- ============================================
DROP TABLE IF EXISTS `test_results`;
CREATE TABLE `test_results` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `test_id` INT NOT NULL,
    `score` INT NOT NULL DEFAULT 0,
    `total_points` INT NOT NULL DEFAULT 0,
    `time_spent` INT DEFAULT NULL COMMENT 'Thời gian làm bài (giây)',
    `completed_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_user` (`user_id`),
    INDEX `idx_test` (`test_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`test_id`) REFERENCES `tests`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 9. BẢNG USER_ANSWERS - Bài làm chi tiết
-- ============================================
DROP TABLE IF EXISTS `user_answers`;
CREATE TABLE `user_answers` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `test_result_id` INT NOT NULL,
    `question_id` INT NOT NULL,
    `user_answer` TEXT DEFAULT NULL,
    `is_correct` TINYINT(1) DEFAULT 0,
    
    INDEX `idx_result` (`test_result_id`),
    INDEX `idx_question` (`question_id`),
    FOREIGN KEY (`test_result_id`) REFERENCES `test_results`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`question_id`) REFERENCES `questions`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 10. BẢNG SPEAKING_PROMPTS - Đề speaking
-- ============================================
DROP TABLE IF EXISTS `speaking_prompts`;
CREATE TABLE `speaking_prompts` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `topic_id` INT NOT NULL,
    `prompt_text` TEXT NOT NULL,
    `sample_answer` TEXT DEFAULT NULL,
    `difficulty` ENUM('easy', 'medium', 'hard') DEFAULT 'easy',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_topic` (`topic_id`),
    INDEX `idx_difficulty` (`difficulty`),
    FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 11. BẢNG SPEAKING_ATTEMPTS - Lượt luyện nói
-- ============================================
DROP TABLE IF EXISTS `speaking_attempts`;
CREATE TABLE `speaking_attempts` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `prompt_id` INT NOT NULL,
    `transcript` TEXT DEFAULT NULL,
    `pronunciation_score` INT DEFAULT 0 COMMENT '0-100',
    `fluency_score` INT DEFAULT 0 COMMENT '0-100',
    `accuracy_score` INT DEFAULT 0 COMMENT '0-100',
    `overall_score` INT DEFAULT 0 COMMENT '0-100',
    `feedback` TEXT DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX `idx_user` (`user_id`),
    INDEX `idx_prompt` (`prompt_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`prompt_id`) REFERENCES `speaking_prompts`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 12. BẢNG USER_PROGRESS - Tiến độ học
-- ============================================
DROP TABLE IF EXISTS `user_progress`;
CREATE TABLE `user_progress` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `topic_id` INT NOT NULL,
    `vocab_learned` INT DEFAULT 0,
    `lessons_completed` INT DEFAULT 0,
    `tests_passed` INT DEFAULT 0,
    `speaking_practiced` INT DEFAULT 0,
    `total_score` INT DEFAULT 0,
    `last_activity` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY `unique_user_topic` (`user_id`, `topic_id`),
    INDEX `idx_user` (`user_id`),
    INDEX `idx_topic` (`topic_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- DỮ LIỆU MẪU (SEED DATA)
-- ============================================

-- Admin account (password: admin123)
INSERT INTO `users` (`username`, `email`, `password_hash`, `full_name`, `role`) VALUES
('admin', 'admin@englishmaster.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrator', 'admin');

-- Student account (password: student123)
INSERT INTO `users` (`username`, `email`, `password_hash`, `full_name`, `role`) VALUES
('student1', 'student@englishmaster.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Nguyễn Văn A', 'student');

-- Topics
INSERT INTO `topics` (`name`, `slug`, `description`, `level`, `sort_order`) VALUES
('Daily Life', 'daily-life', 'Từ vựng và hội thoại về cuộc sống hàng ngày: chào hỏi, giới thiệu bản thân, thói quen hàng ngày.', 'beginner', 1),
('Travel & Tourism', 'travel-tourism', 'Học tiếng Anh giao tiếp khi đi du lịch: đặt vé, khách sạn, hỏi đường, mua sắm.', 'intermediate', 2),
('Food & Cooking', 'food-cooking', 'Từ vựng về đồ ăn, nấu ăn, gọi món tại nhà hàng và công thức nấu ăn.', 'beginner', 3),
('Education', 'education', 'Tiếng Anh trong môi trường học tập: lớp học, trường đại học, học online.', 'intermediate', 4),
('Technology', 'technology', 'Từ vựng về công nghệ, máy tính, internet và các thuật ngữ IT phổ biến.', 'advanced', 5),
('Health & Fitness', 'health-fitness', 'Tiếng Anh về sức khỏe, bệnh viện, tập gym và dinh dưỡng.', 'intermediate', 6);

-- Vocabularies for "Daily Life"
INSERT INTO `vocabularies` (`topic_id`, `word`, `pronunciation`, `meaning_vi`, `example_sentence`) VALUES
(1, 'greeting', '/ˈɡriːtɪŋ/', 'lời chào', 'She gave him a friendly greeting.'),
(1, 'introduce', '/ˌɪntrəˈdjuːs/', 'giới thiệu', 'Let me introduce myself.'),
(1, 'routine', '/ruːˈtiːn/', 'thói quen', 'My morning routine starts at 6 AM.'),
(1, 'breakfast', '/ˈbrekfəst/', 'bữa sáng', 'I usually have cereal for breakfast.'),
(1, 'commute', '/kəˈmjuːt/', 'đi làm hàng ngày', 'My daily commute takes about 30 minutes.'),
(1, 'schedule', '/ˈʃedjuːl/', 'lịch trình', 'What is your schedule for today?'),
(1, 'neighbor', '/ˈneɪbər/', 'hàng xóm', 'Our neighbors are very friendly.'),
(1, 'household', '/ˈhaʊshoʊld/', 'hộ gia đình', 'She manages the household chores.'),
(1, 'appointment', '/əˈpɔɪntmənt/', 'cuộc hẹn', 'I have a doctor''s appointment at 3 PM.'),
(1, 'leisure', '/ˈleʒər/', 'giải trí', 'What do you do in your leisure time?');

-- Vocabularies for "Travel & Tourism"
INSERT INTO `vocabularies` (`topic_id`, `word`, `pronunciation`, `meaning_vi`, `example_sentence`) VALUES
(2, 'departure', '/dɪˈpɑːrtʃər/', 'khởi hành', 'The departure time is 8:00 AM.'),
(2, 'destination', '/ˌdestɪˈneɪʃn/', 'điểm đến', 'What is your final destination?'),
(2, 'luggage', '/ˈlʌɡɪdʒ/', 'hành lý', 'Please check your luggage at the counter.'),
(2, 'reservation', '/ˌrezərˈveɪʃn/', 'đặt trước', 'I made a hotel reservation online.'),
(2, 'passport', '/ˈpæspɔːrt/', 'hộ chiếu', 'Don''t forget to bring your passport.'),
(2, 'itinerary', '/aɪˈtɪnəreri/', 'lịch trình', 'Our travel itinerary includes 5 cities.'),
(2, 'currency', '/ˈkʌrənsi/', 'tiền tệ', 'You need to exchange your currency.'),
(2, 'souvenir', '/ˌsuːvəˈnɪr/', 'quà lưu niệm', 'I bought some souvenirs for my family.'),
(2, 'accommodation', '/əˌkɒməˈdeɪʃn/', 'chỗ ở', 'The accommodation was very comfortable.'),
(2, 'excursion', '/ɪkˈskɜːrʒn/', 'chuyến tham quan', 'We went on a boat excursion.');

-- Vocabularies for "Food & Cooking"
INSERT INTO `vocabularies` (`topic_id`, `word`, `pronunciation`, `meaning_vi`, `example_sentence`) VALUES
(3, 'ingredient', '/ɪnˈɡriːdiənt/', 'nguyên liệu', 'What are the main ingredients?'),
(3, 'recipe', '/ˈresɪpi/', 'công thức', 'This recipe is very easy to follow.'),
(3, 'appetizer', '/ˈæpɪtaɪzər/', 'món khai vị', 'Would you like to order an appetizer?'),
(3, 'dessert', '/dɪˈzɜːrt/', 'món tráng miệng', 'The chocolate dessert was delicious.'),
(3, 'seasoning', '/ˈsiːzənɪŋ/', 'gia vị', 'Add some seasoning to taste.'),
(3, 'portion', '/ˈpɔːrʃn/', 'phần ăn', 'The portion size was quite generous.'),
(3, 'cuisine', '/kwɪˈziːn/', 'ẩm thực', 'Vietnamese cuisine is famous worldwide.'),
(3, 'beverage', '/ˈbevərɪdʒ/', 'đồ uống', 'Would you like a hot or cold beverage?');

-- Lessons for "Daily Life"
INSERT INTO `lessons` (`topic_id`, `title`, `description`, `sort_order`) VALUES
(1, 'Greetings & Introductions', 'Học cách chào hỏi và giới thiệu bản thân bằng tiếng Anh', 1),
(1, 'Daily Routine', 'Mô tả thói quen hàng ngày', 2),
(1, 'At Home', 'Từ vựng và hội thoại về nhà cửa và gia đình', 3);

-- Lessons for "Travel"
INSERT INTO `lessons` (`topic_id`, `title`, `description`, `sort_order`) VALUES
(2, 'At the Airport', 'Hội thoại và từ vựng tại sân bay', 1),
(2, 'Hotel Check-in', 'Học cách check-in khách sạn bằng tiếng Anh', 2),
(2, 'Asking for Directions', 'Hỏi và chỉ đường bằng tiếng Anh', 3);

-- Lesson Contents
INSERT INTO `lesson_contents` (`lesson_id`, `content_type`, `content`, `sort_order`) VALUES
(1, 'text', '<h3>Common Greetings</h3>
<p>Khi gặp ai đó lần đầu, bạn có thể sử dụng các cách chào hỏi sau:</p>
<ul>
<li><strong>Hello / Hi</strong> - Chào (thân mật)</li>
<li><strong>Good morning</strong> - Chào buổi sáng</li>
<li><strong>Good afternoon</strong> - Chào buổi chiều</li>
<li><strong>Good evening</strong> - Chào buổi tối</li>
<li><strong>How are you?</strong> - Bạn khỏe không?</li>
<li><strong>Nice to meet you</strong> - Rất vui được gặp bạn</li>
</ul>', 1),
(1, 'text', '<h3>Introducing Yourself</h3>
<p>Cách giới thiệu bản thân:</p>
<div class="dialogue">
<p><strong>A:</strong> Hi! My name is John. What''s your name?</p>
<p><strong>B:</strong> Hello John! I''m Sarah. Nice to meet you!</p>
<p><strong>A:</strong> Nice to meet you too! Where are you from?</p>
<p><strong>B:</strong> I''m from Vietnam. How about you?</p>
<p><strong>A:</strong> I''m from the United States.</p>
</div>', 2),
(2, 'text', '<h3>Describing Your Daily Routine</h3>
<p>Sử dụng thì hiện tại đơn để mô tả thói quen:</p>
<ul>
<li>I <strong>wake up</strong> at 6:00 AM every day.</li>
<li>I <strong>have breakfast</strong> at 7:00 AM.</li>
<li>I <strong>go to work</strong> by bus.</li>
<li>I <strong>have lunch</strong> at noon.</li>
<li>I <strong>get home</strong> at 6:00 PM.</li>
<li>I <strong>go to bed</strong> at 10:30 PM.</li>
</ul>', 1);

-- Tests
INSERT INTO `tests` (`topic_id`, `title`, `test_type`, `duration_minutes`, `pass_score`) VALUES
(1, 'Daily Life - Vocabulary Quiz', 'quiz', 15, 60),
(1, 'Daily Life - Listening Test', 'listening', 20, 60),
(2, 'Travel - Reading Comprehension', 'reading', 25, 60),
(2, 'Travel - Vocabulary Quiz', 'quiz', 15, 60),
(3, 'Food - Vocabulary Quiz', 'quiz', 10, 60);

-- Questions for "Daily Life - Vocabulary Quiz"
INSERT INTO `questions` (`test_id`, `question_text`, `question_type`, `options_json`, `correct_answer`, `points`, `sort_order`) VALUES
(1, 'What does "routine" mean?', 'multiple_choice', '["A thing done regularly", "A type of exercise", "A greeting phrase", "A cooking method"]', 'A thing done regularly', 1, 1),
(1, 'Choose the correct meaning of "commute":', 'multiple_choice', '["To travel regularly between work and home", "To communicate with someone", "To compute something", "To compete in a race"]', 'To travel regularly between work and home', 1, 2),
(1, 'What is the meaning of "leisure"?', 'multiple_choice', '["Work time", "Free time for enjoyment", "Study time", "Sleep time"]', 'Free time for enjoyment', 1, 3),
(1, '"Appointment" means:', 'multiple_choice', '["A surprise visit", "A scheduled meeting", "A casual chat", "A random event"]', 'A scheduled meeting', 1, 4),
(1, 'The word "neighbor" refers to:', 'multiple_choice', '["A family member", "A colleague", "A person living nearby", "A stranger"]', 'A person living nearby', 1, 5),
(1, '"Household" is related to:', 'multiple_choice', '["Office work", "Home and family", "School activities", "Travel plans"]', 'Home and family', 1, 6),
(1, 'What is the correct translation of "schedule"?', 'multiple_choice', '["Kế hoạch", "Lịch trình", "Bài tập", "Thời gian"]', 'Lịch trình', 1, 7),
(1, '"Greeting" means:', 'multiple_choice', '["Lời chào", "Lời hứa", "Lời khuyên", "Lời mời"]', 'Lời chào', 1, 8),
(1, 'True or False: "Introduce" means to make someone known to another person.', 'true_false', '["True", "False"]', 'True', 1, 9),
(1, 'Fill in the blank: I usually have cereal for _____.', 'fill_blank', NULL, 'breakfast', 1, 10);

-- Questions for "Travel - Reading Comprehension"
INSERT INTO `questions` (`test_id`, `question_text`, `question_type`, `options_json`, `correct_answer`, `passage`, `points`, `sort_order`) VALUES
(3, 'What should you do first when arriving at the airport?', 'multiple_choice', '["Go to the gate", "Check in at the counter", "Buy souvenirs", "Find a restaurant"]', 'Check in at the counter',
'When traveling by air, there are several important steps to follow. First, you should arrive at the airport at least 2 hours before your departure time. After arriving, go to the airline counter to check in and drop off your luggage. Make sure you have your passport and boarding pass ready. Then proceed through security screening. Finally, find your departure gate and wait for boarding.', 2, 1),
(3, 'How early should you arrive at the airport?', 'multiple_choice', '["30 minutes", "1 hour", "At least 2 hours", "3 hours"]', 'At least 2 hours',
'When traveling by air, there are several important steps to follow. First, you should arrive at the airport at least 2 hours before your departure time. After arriving, go to the airline counter to check in and drop off your luggage. Make sure you have your passport and boarding pass ready. Then proceed through security screening. Finally, find your departure gate and wait for boarding.', 2, 2),
(3, 'What documents should you have ready?', 'multiple_choice', '["Driver''s license only", "Passport and boarding pass", "Student ID", "Credit card"]', 'Passport and boarding pass',
'When traveling by air, there are several important steps to follow. First, you should arrive at the airport at least 2 hours before your departure time. After arriving, go to the airline counter to check in and drop off your luggage. Make sure you have your passport and boarding pass ready. Then proceed through security screening. Finally, find your departure gate and wait for boarding.', 2, 3);

-- Speaking Prompts
INSERT INTO `speaking_prompts` (`topic_id`, `prompt_text`, `sample_answer`, `difficulty`) VALUES
(1, 'Introduce yourself. Tell me your name, where you are from, and what you do.', 'Hi, my name is John. I am from Vietnam. I am a student at the University of Technology. I enjoy learning English and playing sports in my free time.', 'easy'),
(1, 'Describe your daily routine from morning to evening.', 'I usually wake up at six thirty in the morning. After I brush my teeth and wash my face, I have breakfast with my family. Then I go to school by bus. My classes start at eight and finish at twelve. In the afternoon, I study at the library. In the evening, I have dinner with my family and then do my homework. I go to bed at about eleven.', 'medium'),
(2, 'Tell me about your favorite travel experience.', 'Last summer, I went to Da Nang with my family. It was an amazing trip. We stayed at a beautiful hotel near the beach. We visited the Marble Mountains and Ba Na Hills. The food was delicious, especially the seafood. We also went swimming in the ocean every morning. It was one of the best vacations I have ever had.', 'medium'),
(2, 'You are at a hotel. Check in and ask about the facilities.', 'Hello, I have a reservation under the name Nguyen. I booked a double room for three nights. Could you tell me what time breakfast is served? Is there a swimming pool in the hotel? Also, could you recommend some restaurants nearby? Thank you very much.', 'easy'),
(3, 'Describe your favorite food and how it is prepared.', 'My favorite food is pho, a traditional Vietnamese noodle soup. It is made with rice noodles, beef or chicken, and a flavorful broth. First, the broth is prepared by simmering bones with spices like star anise and cinnamon for several hours. Then the noodles are cooked separately. The meat is sliced thinly and placed on top. Fresh herbs, bean sprouts, and lime are served on the side.', 'hard'),
(1, 'What do you usually do on weekends?', 'On weekends, I like to relax and spend time with my friends and family. On Saturday morning, I usually go to the gym to exercise. In the afternoon, I often meet my friends at a coffee shop. On Sunday, I stay at home and help my mother cook lunch. Sometimes we go to the cinema or shopping mall together.', 'easy');

SET FOREIGN_KEY_CHECKS = 1;
