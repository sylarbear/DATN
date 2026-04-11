-- =============================================
-- Migration V3: Comprehensive Content Data
-- Bổ sung đầy đủ nội dung học tập cho 6 chủ đề
-- =============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =============================================
-- VOCAB: Food & Cooking (topic_id=3) - bổ sung thêm
-- =============================================
INSERT INTO vocabularies (topic_id, word, pronunciation, meaning_vi, example_sentence) VALUES
(3, 'grill', '/ɡrɪl/', 'nướng', 'We grilled some burgers for dinner.'),
(3, 'stir-fry', '/stɜːr fraɪ/', 'xào', 'I love to stir-fry vegetables with garlic.'),
(3, 'boil', '/bɔɪl/', 'luộc, đun sôi', 'Boil the water before adding the pasta.'),
(3, 'delicious', '/dɪˈlɪʃəs/', 'ngon', 'This soup is absolutely delicious!'),
(3, 'spicy', '/ˈspaɪsi/', 'cay', 'Thai food is usually very spicy.'),
(3, 'raw', '/rɔː/', 'sống, chưa nấu', 'Sushi is made with raw fish.'),
(3, 'menu', '/ˈmenjuː/', 'thực đơn', 'Could I see the menu, please?'),
(3, 'reservation', '/ˌrezərˈveɪʃn/', 'đặt bàn', 'I would like to make a reservation for two.');

-- =============================================
-- VOCAB: Education (topic_id=4)
-- =============================================
INSERT INTO vocabularies (topic_id, word, pronunciation, meaning_vi, example_sentence) VALUES
(4, 'assignment', '/əˈsaɪnmənt/', 'bài tập', 'Please submit your assignment by Friday.'),
(4, 'lecture', '/ˈlektʃər/', 'bài giảng', 'The professor gave an interesting lecture.'),
(4, 'semester', '/sɪˈmestər/', 'học kỳ', 'There are two semesters in each academic year.'),
(4, 'scholarship', '/ˈskɒlərʃɪp/', 'học bổng', 'She received a full scholarship to study abroad.'),
(4, 'graduate', '/ˈɡrædʒuət/', 'tốt nghiệp', 'He will graduate from university next year.'),
(4, 'exam', '/ɪɡˈzæm/', 'kỳ thi', 'The final exam is next Monday.'),
(4, 'curriculum', '/kəˈrɪkjələm/', 'chương trình học', 'The school updated its curriculum this year.'),
(4, 'tutor', '/ˈtjuːtər/', 'gia sư', 'She hired a tutor for mathematics.'),
(4, 'dormitory', '/ˈdɔːrmɪtɔːri/', 'ký túc xá', 'Many students live in the dormitory.'),
(4, 'diploma', '/dɪˈploʊmə/', 'bằng cấp', 'He earned his diploma in engineering.'),
(4, 'research', '/rɪˈsɜːrtʃ/', 'nghiên cứu', 'She is doing research on climate change.'),
(4, 'enrollment', '/ɪnˈroʊlmənt/', 'đăng ký nhập học', 'Enrollment starts in August.');

-- =============================================
-- VOCAB: Technology (topic_id=5)
-- =============================================
INSERT INTO vocabularies (topic_id, word, pronunciation, meaning_vi, example_sentence) VALUES
(5, 'software', '/ˈsɒftwer/', 'phần mềm', 'This software helps you edit photos.'),
(5, 'hardware', '/ˈhɑːrdwer/', 'phần cứng', 'You need to upgrade your hardware.'),
(5, 'algorithm', '/ˈælɡərɪðəm/', 'thuật toán', 'Search engines use complex algorithms.'),
(5, 'database', '/ˈdeɪtəbeɪs/', 'cơ sở dữ liệu', 'All user information is stored in the database.'),
(5, 'cybersecurity', '/ˌsaɪbərsɪˈkjʊrəti/', 'an ninh mạng', 'Cybersecurity is essential for protecting data.'),
(5, 'artificial intelligence', '/ˌɑːrtɪˈfɪʃl ɪnˈtelɪdʒəns/', 'trí tuệ nhân tạo', 'AI is changing many industries.'),
(5, 'cloud computing', '/klaʊd kəmˈpjuːtɪŋ/', 'điện toán đám mây', 'Many companies use cloud computing services.'),
(5, 'debugging', '/diːˈbʌɡɪŋ/', 'gỡ lỗi', 'Debugging the code took several hours.'),
(5, 'bandwidth', '/ˈbændwɪdθ/', 'băng thông', 'You need more bandwidth for video streaming.'),
(5, 'encryption', '/ɪnˈkrɪpʃn/', 'mã hóa', 'Encryption protects your personal data.'),
(5, 'browser', '/ˈbraʊzər/', 'trình duyệt', 'Chrome is the most popular web browser.'),
(5, 'download', '/ˈdaʊnloʊd/', 'tải xuống', 'You can download the app for free.');

-- =============================================
-- VOCAB: Health & Fitness (topic_id=6)
-- =============================================
INSERT INTO vocabularies (topic_id, word, pronunciation, meaning_vi, example_sentence) VALUES
(6, 'symptom', '/ˈsɪmptəm/', 'triệu chứng', 'What are your symptoms?'),
(6, 'prescription', '/prɪˈskrɪpʃn/', 'đơn thuốc', 'The doctor gave me a prescription.'),
(6, 'allergy', '/ˈælərdʒi/', 'dị ứng', 'She has an allergy to peanuts.'),
(6, 'nutrition', '/njuːˈtrɪʃn/', 'dinh dưỡng', 'Good nutrition is important for health.'),
(6, 'exercise', '/ˈeksərsaɪz/', 'tập thể dục', 'Regular exercise keeps you fit.'),
(6, 'diagnosis', '/ˌdaɪəɡˈnoʊsɪs/', 'chẩn đoán', 'The doctor made an accurate diagnosis.'),
(6, 'treatment', '/ˈtriːtmənt/', 'điều trị', 'Effective treatment can cure the disease.'),
(6, 'vaccine', '/vækˈsiːn/', 'vắc xin', 'Everyone should get the flu vaccine.'),
(6, 'calories', '/ˈkæləriːz/', 'calo', 'How many calories are in this meal?'),
(6, 'meditation', '/ˌmedɪˈteɪʃn/', 'thiền', 'Meditation helps reduce stress.'),
(6, 'protein', '/ˈproʊtiːn/', 'chất đạm', 'Chicken is a good source of protein.'),
(6, 'wellness', '/ˈwelnəs/', 'sức khỏe toàn diện', 'The company has a wellness program for employees.');

-- =============================================
-- LESSONS: Food & Cooking (topic_id=3)
-- =============================================
INSERT INTO lessons (topic_id, title, description, sort_order) VALUES
(3, 'Ordering at a Restaurant', 'Hội thoại gọi món tại nhà hàng bằng tiếng Anh', 1),
(3, 'Cooking Vocabulary', 'Từ vựng về nấu ăn và phương pháp chế biến', 2);

-- =============================================
-- LESSONS: Education (topic_id=4)
-- =============================================
INSERT INTO lessons (topic_id, title, description, sort_order) VALUES
(4, 'University Life', 'Từ vựng và hội thoại về cuộc sống đại học', 1),
(4, 'Classroom English', 'Các câu tiếng Anh phổ biến trong lớp học', 2),
(4, 'Study Abroad', 'Từ vựng về du học và đăng ký trường quốc tế', 3);

-- =============================================
-- LESSONS: Technology (topic_id=5)
-- =============================================
INSERT INTO lessons (topic_id, title, description, sort_order) VALUES
(5, 'Computer Basics', 'Từ vựng cơ bản về máy tính và phần mềm', 1),
(5, 'Internet & Social Media', 'Tiếng Anh về internet, mạng xã hội và ứng dụng', 2),
(5, 'AI & Future Tech', 'Từ vựng về trí tuệ nhân tạo và công nghệ tương lai', 3);

-- =============================================
-- LESSONS: Health & Fitness (topic_id=6)
-- =============================================
INSERT INTO lessons (topic_id, title, description, sort_order) VALUES
(6, 'At the Doctor', 'Hội thoại tại phòng khám bằng tiếng Anh', 1),
(6, 'Gym & Exercise', 'Từ vựng về tập gym và các bài tập thể dục', 2),
(6, 'Healthy Eating', 'Tiếng Anh về dinh dưỡng và ăn uống lành mạnh', 3);

-- =============================================
-- LESSON CONTENTS (use dynamic lesson IDs)
-- =============================================

-- Find last existing lesson_id from schema.sql seeds (should be 6 = Travel/Asking Directions)
-- New lessons start from ID 7 onward (auto-increment)

-- Food: Ordering at Restaurant (lesson 7)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(7, 'text', '<h3>Useful Phrases at a Restaurant</h3>
<ul>
<li><strong>Can I see the menu, please?</strong> - Cho tôi xem thực đơn được không?</li>
<li><strong>I would like to order...</strong> - Tôi muốn gọi...</li>
<li><strong>What do you recommend?</strong> - Bạn gợi ý món gì?</li>
<li><strong>Is this dish spicy?</strong> - Món này có cay không?</li>
<li><strong>Could I have the bill, please?</strong> - Cho tôi tính tiền được không?</li>
<li><strong>I''m allergic to...</strong> - Tôi bị dị ứng với...</li>
</ul>', 1),
(7, 'text', '<h3>Sample Dialogue</h3>
<div class="dialogue">
<p><strong>Waiter:</strong> Good evening! Welcome to our restaurant. A table for two?</p>
<p><strong>You:</strong> Yes, please. Could I see the menu?</p>
<p><strong>Waiter:</strong> Of course. Here you go. Would you like something to drink?</p>
<p><strong>You:</strong> I''ll have an orange juice, please.</p>
<p><strong>Waiter:</strong> Are you ready to order?</p>
<p><strong>You:</strong> Yes, I''d like the grilled chicken with salad, please.</p>
<p><strong>Waiter:</strong> Excellent choice! Anything else?</p>
<p><strong>You:</strong> No, that''s all. Thank you!</p>
</div>', 2);

-- Food: Cooking Vocabulary (lesson 8)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(8, 'text', '<h3>Phương pháp nấu ăn (Cooking Methods)</h3>
<ul>
<li><strong>Boil</strong> (luộc): Cook food in boiling water - <em>Boil the eggs for 10 minutes.</em></li>
<li><strong>Fry</strong> (chiên): Cook in oil - <em>Fry the fish until golden brown.</em></li>
<li><strong>Grill</strong> (nướng): Cook over direct heat - <em>Grill the steak for 5 minutes each side.</em></li>
<li><strong>Steam</strong> (hấp): Cook with steam - <em>Steam the vegetables for 8 minutes.</em></li>
<li><strong>Bake</strong> (nướng lò): Cook in an oven - <em>Bake the cake at 180°C for 30 minutes.</em></li>
<li><strong>Stir-fry</strong> (xào): Cook quickly in a wok - <em>Stir-fry the noodles with soy sauce.</em></li>
<li><strong>Roast</strong> (quay): Cook in oven with oil - <em>Roast the chicken with herbs.</em></li>
</ul>', 1),
(8, 'text', '<h3>Các dụng cụ nhà bếp (Kitchen Utensils)</h3>
<ul>
<li><strong>Knife</strong> /naɪf/ - dao</li>
<li><strong>Cutting board</strong> - thớt</li>
<li><strong>Frying pan</strong> - chảo</li>
<li><strong>Pot</strong> - nồi</li>
<li><strong>Oven</strong> - lò nướng</li>
<li><strong>Spatula</strong> - thìa xúc</li>
<li><strong>Whisk</strong> - phới đánh trứng</li>
<li><strong>Ladle</strong> - muôi múc canh</li>
</ul>', 2);

-- Education: University Life (lesson 9)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(9, 'text', '<h3>University Vocabulary</h3>
<ul>
<li><strong>Major</strong> - chuyên ngành: <em>My major is Computer Science.</em></li>
<li><strong>GPA (Grade Point Average)</strong> - điểm trung bình: <em>She has a GPA of 3.8.</em></li>
<li><strong>Deadline</strong> - hạn nộp: <em>The deadline for the paper is next Friday.</em></li>
<li><strong>Thesis</strong> - luận văn: <em>He is writing his graduation thesis.</em></li>
<li><strong>Campus</strong> - khuôn viên trường: <em>The campus has a beautiful library.</em></li>
<li><strong>Semester</strong> - học kỳ: <em>This semester I am taking 5 courses.</em></li>
</ul>', 1),
(9, 'text', '<h3>Dialogue: Registering for Classes</h3>
<div class="dialogue">
<p><strong>Student:</strong> Excuse me, I''d like to register for the English Communication class.</p>
<p><strong>Advisor:</strong> Sure. That class meets on Mondays and Wednesdays. Is that okay with your schedule?</p>
<p><strong>Student:</strong> Yes, that works. How many credits is it?</p>
<p><strong>Advisor:</strong> It''s 3 credits. You also need to complete a prerequisite first.</p>
<p><strong>Student:</strong> What prerequisite is required?</p>
<p><strong>Advisor:</strong> English Fundamentals. Have you completed that?</p>
<p><strong>Student:</strong> Yes, I finished it last semester.</p>
<p><strong>Advisor:</strong> Great! You''re all set then.</p>
</div>', 2);

-- Education: Classroom English (lesson 10)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(10, 'text', '<h3>Useful Classroom Phrases</h3>
<h4>Asking Questions</h4>
<ul>
<li><strong>Could you repeat that, please?</strong> - Bạn có thể nhắc lại được không?</li>
<li><strong>What does this word mean?</strong> - Từ này nghĩa là gì?</li>
<li><strong>How do you spell that?</strong> - Từ đó viết thế nào?</li>
<li><strong>Can you explain it in a simpler way?</strong> - Giải thích đơn giản hơn được không?</li>
</ul>
<h4>Participating in Class</h4>
<ul>
<li><strong>I agree with...</strong> - Tôi đồng ý với...</li>
<li><strong>In my opinion...</strong> - Theo ý kiến tôi...</li>
<li><strong>Could I add something?</strong> - Tôi có thể bổ sung được không?</li>
<li><strong>I''m not sure I understand.</strong> - Tôi không chắc là tôi hiểu.</li>
</ul>', 1);

-- Technology: Computer Basics (lesson 12)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(12, 'text', '<h3>Essential Computer Terms</h3>
<ul>
<li><strong>Operating System (OS)</strong> - hệ điều hành: Windows, macOS, Linux</li>
<li><strong>RAM (Random Access Memory)</strong> - bộ nhớ tạm thời</li>
<li><strong>Hard Drive / SSD</strong> - ổ cứng / ổ thể rắn</li>
<li><strong>Processor (CPU)</strong> - bộ xử lý</li>
<li><strong>Monitor</strong> - màn hình</li>
<li><strong>Keyboard</strong> - bàn phím</li>
<li><strong>Mouse</strong> - chuột</li>
<li><strong>USB Port</strong> - cổng USB</li>
</ul>
<h3>Common Actions</h3>
<ul>
<li><strong>Install</strong> - cài đặt: <em>Install the latest version of the software.</em></li>
<li><strong>Update</strong> - cập nhật: <em>Please update your browser.</em></li>
<li><strong>Restart</strong> - khởi động lại: <em>Try restarting your computer.</em></li>
<li><strong>Back up</strong> - sao lưu: <em>Always back up your files.</em></li>
</ul>', 1);

-- Health: At the Doctor (lesson 15)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(15, 'text', '<h3>At the Doctor''s Office</h3>
<h4>Describing Symptoms</h4>
<ul>
<li><strong>I have a headache.</strong> - Tôi bị đau đầu.</li>
<li><strong>I have a sore throat.</strong> - Tôi bị đau họng.</li>
<li><strong>I feel dizzy.</strong> - Tôi cảm thấy chóng mặt.</li>
<li><strong>I have a fever.</strong> - Tôi bị sốt.</li>
<li><strong>My stomach hurts.</strong> - Tôi bị đau bụng.</li>
<li><strong>I''ve been coughing a lot.</strong> - Tôi bị ho nhiều.</li>
</ul>
<h4>Dialogue</h4>
<div class="dialogue">
<p><strong>Doctor:</strong> What seems to be the problem?</p>
<p><strong>Patient:</strong> I''ve had a bad cough and a sore throat for three days.</p>
<p><strong>Doctor:</strong> Do you have a fever?</p>
<p><strong>Patient:</strong> Yes, my temperature was 38 degrees last night.</p>
<p><strong>Doctor:</strong> Let me examine you. Open your mouth, please. I see your throat is red and swollen. I will prescribe some medicine for you.</p>
<p><strong>Patient:</strong> How often should I take the medicine?</p>
<p><strong>Doctor:</strong> Take it three times a day after meals. You should also rest and drink plenty of water.</p>
</div>', 1);

-- Health: Gym & Exercise (lesson 16)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(16, 'text', '<h3>Exercise Vocabulary</h3>
<ul>
<li><strong>Warm up</strong> - khởi động: <em>Always warm up before exercising.</em></li>
<li><strong>Cool down</strong> - thả lỏng: <em>Cool down with some stretches after your workout.</em></li>
<li><strong>Push-up</strong> - hít đất</li>
<li><strong>Sit-up</strong> - gập bụng</li>
<li><strong>Squat</strong> - squat, ngồi xổm</li>
<li><strong>Plank</strong> - tư thế plank</li>
<li><strong>Treadmill</strong> - máy chạy bộ</li>
<li><strong>Dumbbell</strong> - tạ tay</li>
<li><strong>Cardio</strong> - bài tập tim mạch</li>
<li><strong>Yoga</strong> - yoga</li>
</ul>', 1);

-- =============================================
-- TESTS: Education Quiz (topic_id=4)
-- =============================================
INSERT INTO tests (topic_id, title, test_type, duration_minutes, pass_score) VALUES
(4, 'Education - Vocabulary Quiz', 'quiz', 15, 60);

INSERT INTO questions (test_id, question_text, question_type, options_json, correct_answer, points, sort_order) VALUES
-- test_id=6 (next after existing 5)
(6, 'What does "assignment" mean?', 'multiple_choice', '["A type of test", "Homework or task given by a teacher", "A school building", "A textbook"]', 'Homework or task given by a teacher', 1, 1),
(6, '"Scholarship" refers to:', 'multiple_choice', '["A type of school", "Financial aid for students", "A school uniform", "A sports team"]', 'Financial aid for students', 1, 2),
(6, 'What is a "semester"?', 'multiple_choice', '["A school subject", "Half of an academic year", "A graduation ceremony", "A type of exam"]', 'Half of an academic year', 1, 3),
(6, 'What does "graduate" mean?', 'multiple_choice', '["To start school", "To fail an exam", "To complete a degree program", "To skip a class"]', 'To complete a degree program', 1, 4),
(6, '"Curriculum" is:', 'multiple_choice', '["A school building", "The subjects in a course of study", "A type of student", "A teacher''s name"]', 'The subjects in a course of study', 1, 5),
(6, 'What is a "tutor"?', 'multiple_choice', '["A school bus driver", "A private teacher", "A school principal", "A janitor"]', 'A private teacher', 1, 6),
(6, '"Enrollment" means:', 'multiple_choice', '["Graduation ceremony", "Dropping out of school", "Registering for school or classes", "A school holiday"]', 'Registering for school or classes', 1, 7),
(6, 'A "dormitory" is:', 'multiple_choice', '["A classroom", "A library", "A student residence building", "A cafeteria"]', 'A student residence building', 1, 8),
(6, 'True or False: "GPA" stands for "Grade Point Average".', 'true_false', '["True", "False"]', 'True', 1, 9),
(6, 'Fill in the blank: The final _____ is next Monday.', 'fill_blank', NULL, 'exam', 1, 10);

-- =============================================
-- TESTS: Technology Quiz (topic_id=5)
-- =============================================
INSERT INTO tests (topic_id, title, test_type, duration_minutes, pass_score) VALUES
(5, 'Technology - Vocabulary Quiz', 'quiz', 15, 60);

INSERT INTO questions (test_id, question_text, question_type, options_json, correct_answer, points, sort_order) VALUES
(7, 'What is "software"?', 'multiple_choice', '["Physical parts of a computer", "Programs and applications", "A type of keyboard", "An internet cable"]', 'Programs and applications', 1, 1),
(7, '"Hardware" refers to:', 'multiple_choice', '["Computer programs", "Physical components of a computer", "The internet", "A website"]', 'Physical components of a computer', 1, 2),
(7, 'What is an "algorithm"?', 'multiple_choice', '["A type of computer virus", "A step-by-step procedure for solving a problem", "A programming language", "A social media platform"]', 'A step-by-step procedure for solving a problem', 1, 3),
(7, '"Cybersecurity" is about:', 'multiple_choice', '["Building robots", "Protecting computer systems from attacks", "Creating websites", "Selling computers"]', 'Protecting computer systems from attacks', 1, 4),
(7, 'What does "debugging" mean?', 'multiple_choice', '["Installing new software", "Finding and fixing errors in code", "Deleting files", "Downloading music"]', 'Finding and fixing errors in code', 1, 5),
(7, '"Cloud computing" means:', 'multiple_choice', '["Computing during cloudy weather", "Using remote servers over the internet", "A type of laptop", "Using only offline software"]', 'Using remote servers over the internet', 1, 6),
(7, 'What is "encryption"?', 'multiple_choice', '["Making data faster", "Converting data into a coded form", "Deleting old files", "Printing documents"]', 'Converting data into a coded form', 1, 7),
(7, '"Bandwidth" refers to:', 'multiple_choice', '["Screen size", "The speed and capacity of data transfer", "Computer weight", "Battery life"]', 'The speed and capacity of data transfer', 1, 8),
(7, 'True or False: AI stands for "Artificial Intelligence".', 'true_false', '["True", "False"]', 'True', 1, 9),
(7, 'Fill in the blank: Chrome is the most popular web _____.', 'fill_blank', NULL, 'browser', 1, 10);

-- =============================================
-- TESTS: Health Quiz (topic_id=6)
-- =============================================
INSERT INTO tests (topic_id, title, test_type, duration_minutes, pass_score) VALUES
(6, 'Health & Fitness - Vocabulary Quiz', 'quiz', 15, 60);

INSERT INTO questions (test_id, question_text, question_type, options_json, correct_answer, points, sort_order) VALUES
(8, 'What is a "symptom"?', 'multiple_choice', '["A type of medicine", "A sign of illness", "A doctor''s name", "A hospital room"]', 'A sign of illness', 1, 1),
(8, '"Prescription" means:', 'multiple_choice', '["A type of exercise", "A written order for medicine", "A healthy food", "A gym membership"]', 'A written order for medicine', 1, 2),
(8, 'What does "allergy" mean?', 'multiple_choice', '["A type of exercise", "A bad reaction to certain substances", "A vitamin supplement", "A meditation technique"]', 'A bad reaction to certain substances', 1, 3),
(8, '"Nutrition" refers to:', 'multiple_choice', '["Physical exercise", "The process of getting proper food", "A type of sport", "A sleeping pattern"]', 'The process of getting proper food', 1, 4),
(8, 'What is a "vaccine"?', 'multiple_choice', '["A type of vitamin", "A substance to prevent diseases", "An exercise machine", "A medical tool"]', 'A substance to prevent diseases', 1, 5),
(8, '"Calories" are:', 'multiple_choice', '["Types of vitamins", "Units of energy in food", "Types of exercise", "Medical instruments"]', 'Units of energy in food', 1, 6),
(8, '"Meditation" helps with:', 'multiple_choice', '["Building muscle", "Reducing stress and relaxation", "Running faster", "Cooking better"]', 'Reducing stress and relaxation', 1, 7),
(8, 'What does "diagnosis" mean?', 'multiple_choice', '["A type of treatment", "Identifying a disease or condition", "A prescription", "A medical bill"]', 'Identifying a disease or condition', 1, 8),
(8, 'True or False: "Protein" is a nutrient that helps build muscle.', 'true_false', '["True", "False"]', 'True', 1, 9),
(8, 'Fill in the blank: Regular _____ keeps you fit and healthy.', 'fill_blank', NULL, 'exercise', 1, 10);

-- =============================================
-- TESTS: Listening & Reading (Pro content)
-- =============================================

-- Food: Listening Test
INSERT INTO tests (topic_id, title, test_type, duration_minutes, pass_score) VALUES
(3, 'Food - Listening Test', 'listening', 20, 60);

INSERT INTO questions (test_id, question_text, question_type, options_json, correct_answer, points, sort_order) VALUES
(9, 'What did the customer order for the main course?', 'multiple_choice', '["Grilled salmon", "Roast chicken", "Pasta with mushroom sauce", "Vegetable stir-fry"]', 'Grilled salmon', 1, 1),
(9, 'How did the customer describe the dessert?', 'multiple_choice', '["Too sweet", "Absolutely delicious", "Too cold", "Very spicy"]', 'Absolutely delicious', 1, 2),
(9, 'What drink did the customer choose?', 'multiple_choice', '["Coffee", "Orange juice", "Sparkling water", "Green tea"]', 'Sparkling water', 1, 3),
(9, 'What was the customer allergic to?', 'multiple_choice', '["Milk", "Nuts", "Shellfish", "Eggs"]', 'Nuts', 1, 4),
(9, 'True or False: The customer asked for the bill at the end.', 'true_false', '["True", "False"]', 'True', 1, 5);

-- Technology: Reading Comprehension
INSERT INTO tests (topic_id, title, test_type, duration_minutes, pass_score) VALUES
(5, 'Technology - Reading Comprehension', 'reading', 25, 60);

INSERT INTO questions (test_id, question_text, question_type, options_json, correct_answer, passage, points, sort_order) VALUES
(10, 'What is the main advantage of cloud computing mentioned in the passage?', 'multiple_choice',
'["It is free", "Users can access data from anywhere", "It makes computers faster", "It replaces all other technology"]',
'Users can access data from anywhere',
'Cloud computing has revolutionized the way businesses and individuals store and access data. Instead of relying on local servers and personal hard drives, cloud computing allows users to store data on remote servers accessed via the internet. This means that files, applications, and services can be accessed from anywhere with an internet connection. Major providers like Amazon Web Services, Microsoft Azure, and Google Cloud offer scalable solutions that can grow with a company''s needs. One of the biggest advantages is cost savings, as companies no longer need to invest heavily in physical infrastructure. However, concerns about data security and privacy remain important considerations for any organization considering cloud adoption.',
2, 1),
(10, 'Which companies are mentioned as major cloud providers?', 'multiple_choice',
'["Apple, Samsung, and Sony", "Amazon, Microsoft, and Google", "Facebook, Twitter, and Instagram", "Intel, AMD, and NVIDIA"]',
'Amazon, Microsoft, and Google',
'Cloud computing has revolutionized the way businesses and individuals store and access data. Instead of relying on local servers and personal hard drives, cloud computing allows users to store data on remote servers accessed via the internet. This means that files, applications, and services can be accessed from anywhere with an internet connection. Major providers like Amazon Web Services, Microsoft Azure, and Google Cloud offer scalable solutions that can grow with a company''s needs. One of the biggest advantages is cost savings, as companies no longer need to invest heavily in physical infrastructure. However, concerns about data security and privacy remain important considerations for any organization considering cloud adoption.',
2, 2),
(10, 'What concern is mentioned about cloud computing?', 'multiple_choice',
'["It is too expensive", "Data security and privacy", "It is too slow", "It uses too much electricity"]',
'Data security and privacy',
'Cloud computing has revolutionized the way businesses and individuals store and access data. Instead of relying on local servers and personal hard drives, cloud computing allows users to store data on remote servers accessed via the internet. This means that files, applications, and services can be accessed from anywhere with an internet connection. Major providers like Amazon Web Services, Microsoft Azure, and Google Cloud offer scalable solutions that can grow with a company''s needs. One of the biggest advantages is cost savings, as companies no longer need to invest heavily in physical infrastructure. However, concerns about data security and privacy remain important considerations for any organization considering cloud adoption.',
2, 3),
(10, 'Fill in the blank: Cloud computing allows users to store data on _____ servers.', 'fill_blank', NULL, 'remote',
'Cloud computing has revolutionized the way businesses and individuals store and access data. Instead of relying on local servers and personal hard drives, cloud computing allows users to store data on remote servers accessed via the internet.',
2, 4);

-- Health: Reading Comprehension
INSERT INTO tests (topic_id, title, test_type, duration_minutes, pass_score) VALUES
(6, 'Health - Reading Comprehension', 'reading', 25, 60);

INSERT INTO questions (test_id, question_text, question_type, options_json, correct_answer, passage, points, sort_order) VALUES
(11, 'How many hours of sleep do adults need according to the passage?', 'multiple_choice',
'["5-6 hours", "6-7 hours", "7-9 hours", "10-12 hours"]',
'7-9 hours',
'Getting enough sleep is crucial for maintaining good health. Most adults need between 7 to 9 hours of sleep per night. During sleep, your body repairs tissues, produces important hormones, and strengthens the immune system. Lack of sleep can lead to serious health problems including obesity, heart disease, and depression. To improve your sleep quality, experts recommend maintaining a consistent sleep schedule, creating a comfortable sleep environment, avoiding caffeine and screens before bedtime, and getting regular exercise during the day. Remember, good sleep is not a luxury—it is a necessity for both physical and mental well-being.',
2, 1),
(11, 'Which of the following is NOT mentioned as a result of poor sleep?', 'multiple_choice',
'["Obesity", "Heart disease", "Better memory", "Depression"]',
'Better memory',
'Getting enough sleep is crucial for maintaining good health. Most adults need between 7 to 9 hours of sleep per night. During sleep, your body repairs tissues, produces important hormones, and strengthens the immune system. Lack of sleep can lead to serious health problems including obesity, heart disease, and depression. To improve your sleep quality, experts recommend maintaining a consistent sleep schedule, creating a comfortable sleep environment, avoiding caffeine and screens before bedtime, and getting regular exercise during the day. Remember, good sleep is not a luxury—it is a necessity for both physical and mental well-being.',
2, 2),
(11, 'What should you avoid before bedtime?', 'multiple_choice',
'["Water and fruit", "Caffeine and screens", "Reading books", "Listening to music"]',
'Caffeine and screens',
'Getting enough sleep is crucial for maintaining good health. Most adults need between 7 to 9 hours of sleep per night. During sleep, your body repairs tissues, produces important hormones, and strengthens the immune system. Lack of sleep can lead to serious health problems including obesity, heart disease, and depression. To improve your sleep quality, experts recommend maintaining a consistent sleep schedule, creating a comfortable sleep environment, avoiding caffeine and screens before bedtime, and getting regular exercise during the day. Remember, good sleep is not a luxury—it is a necessity for both physical and mental well-being.',
2, 3),
(11, 'True or False: The passage says good sleep is a necessity, not a luxury.', 'true_false', '["True", "False"]', 'True',
'Getting enough sleep is crucial for maintaining good health. Remember, good sleep is not a luxury—it is a necessity for both physical and mental well-being.',
2, 4);

-- =============================================
-- SPEAKING PROMPTS: Bổ sung thêm cho tất cả topics
-- =============================================

-- Education (topic_id=4)
INSERT INTO speaking_prompts (topic_id, prompt_text, sample_answer, difficulty) VALUES
(4, 'Tell me about your school or university.', 'I am studying at the University of Technology. My major is Information Technology. The campus is quite large and has many modern buildings. My favorite place on campus is the library because it is quiet and has many useful books. I have classes from Monday to Friday. I usually study with my friends after class. I really enjoy university life.', 'easy'),
(4, 'What are the advantages and disadvantages of online learning?', 'Online learning has both advantages and disadvantages. The main advantage is flexibility. Students can study at their own pace and from anywhere with an internet connection. It also saves time and money on commuting. However, there are some disadvantages. Students may feel isolated because they cannot interact with classmates face to face. It requires strong self-discipline. Also, some subjects like science labs are difficult to teach online. Overall, I think online learning is a good option but should be combined with some in-person classes.', 'medium'),
(4, 'Describe a teacher who has influenced you the most.', 'The teacher who influenced me the most is my high school English teacher, Mrs. Nguyen. She was very patient and always encouraged students to speak English without fear of making mistakes. She used many creative teaching methods like games, role-plays, and group discussions. She often told us that the key to learning a language is practice and confidence. Thanks to her inspiration, I developed a strong passion for English. She taught me that learning should be enjoyable, not stressful. I am very grateful for her guidance.', 'hard');

-- Technology (topic_id=5)
INSERT INTO speaking_prompts (topic_id, prompt_text, sample_answer, difficulty) VALUES
(5, 'Do you use social media? Tell me about it.', 'Yes, I use social media every day. My favorite platform is Instagram because I like sharing photos and watching short videos. I also use Facebook to stay connected with my friends and family. I think social media is useful for communication and entertainment. However, I try not to spend too much time on it because it can be addictive.', 'easy'),
(5, 'How has technology changed education?', 'Technology has completely transformed education. In the past, students could only learn from textbooks and lectures. Now, they can access online courses, educational videos, and interactive apps. Tools like Google Classroom and Zoom make distance learning possible. Students can also use AI-powered tools to practice languages or solve math problems. However, technology also creates challenges such as digital distraction and the digital divide between rich and poor students. Despite these challenges, I believe technology has made education more accessible and engaging for everyone.', 'hard'),
(5, 'What is your favorite app or website? Why?', 'My favorite app is Duolingo because it helps me learn English in a fun way. The app uses gamification with streaks, points, and levels to keep me motivated. I spend about fifteen minutes a day on it. The lessons are short and cover vocabulary, grammar, and listening. I also like that it sends me daily reminders to practice. It has helped me improve my vocabulary and confidence in English.', 'easy');

-- Health & Fitness (topic_id=6)
INSERT INTO speaking_prompts (topic_id, prompt_text, sample_answer, difficulty) VALUES
(6, 'What do you do to stay healthy?', 'To stay healthy, I try to follow a balanced lifestyle. I exercise at least three times a week, usually jogging in the park or going to the gym. I eat healthy food including vegetables, fruits, and lean protein. I avoid junk food and sugary drinks. I also make sure to get enough sleep, about seven to eight hours every night. I drink at least two liters of water every day. I think staying healthy is about making good habits part of your daily routine.', 'easy'),
(6, 'Describe a time when you were sick. What happened?', 'Last winter, I caught a bad cold. It started with a sore throat and then I developed a fever and a runny nose. I felt very tired and weak. I went to see a doctor and he told me I had the flu. He prescribed some medicine and told me to rest at home for a few days. My mother made hot chicken soup for me, which made me feel better. After about a week of rest and taking medicine, I fully recovered. Since then, I have been more careful about washing my hands and wearing warm clothes in winter.', 'medium'),
(6, 'Talk about the importance of mental health.', 'Mental health is just as important as physical health, but many people ignore it. Good mental health means being able to manage stress, maintain positive relationships, and make good decisions. Unfortunately, many young people today suffer from anxiety and depression due to academic pressure and social media. I think it is important to talk about your feelings with someone you trust. Activities like meditation, exercise, and spending time in nature can also help improve mental health. Schools and workplaces should provide mental health support and create a positive environment for everyone.', 'hard');

-- Daily Life - Advanced (topic_id=1)
INSERT INTO speaking_prompts (topic_id, prompt_text, sample_answer, difficulty) VALUES
(1, 'Describe your best friend and why they are important to you.', 'My best friend is Minh. We have been friends since elementary school. He is a kind and funny person who always makes me laugh. We share many common interests such as playing video games, watching movies, and playing basketball. What I admire most about him is his positive attitude. Whenever I have problems, he always listens and gives me good advice. He has supported me through many difficult times. I believe a true friend is someone who accepts you for who you are, and Minh is exactly that kind of person.', 'medium');

-- Travel - Hard (topic_id=2)
INSERT INTO speaking_prompts (topic_id, prompt_text, sample_answer, difficulty) VALUES
(2, 'Compare traveling by plane and by train. Which do you prefer?', 'Both planes and trains have their advantages. Flying is much faster, especially for long distances. You can travel across countries in just a few hours. However, airports can be crowded and there are many security procedures. Trains are slower but more comfortable and relaxing. You can enjoy the scenery through the window and move around freely. Train stations are usually in the city center, which is convenient. Personally, I prefer traveling by train for short trips because I enjoy the journey itself. For longer distances, I choose flying to save time. I think both modes of transportation have their place depending on the situation.', 'hard'),
(2, 'Give directions from your home to the nearest supermarket.', 'To get to the nearest supermarket from my home, first go straight on Nguyen Hue street for about two hundred meters. Then turn right at the traffic light onto Le Loi street. Walk past the post office and the coffee shop on your left. The supermarket is on the right side of the street, next to the pharmacy. It takes about ten minutes to walk there. You can also take the bus number five, which stops right in front of the supermarket.', 'easy');

-- Food - speaking (topic_id=3)  
INSERT INTO speaking_prompts (topic_id, prompt_text, sample_answer, difficulty) VALUES
(3, 'Describe the last meal you cooked.', 'Last weekend, I cooked fried rice for my family. First, I cooked the rice the night before so it would be dry and firm. Then I heated some vegetable oil in a large pan. I added chopped garlic and some diced onions and stir-fried them until golden. Next, I added the rice and mixed everything together. I seasoned it with soy sauce, salt, and pepper. I also added some sliced carrots, peas, and scrambled eggs. The whole process took about twenty minutes. My family really enjoyed it and said it was delicious.', 'medium'),
(3, 'Order a meal at a restaurant. Include a starter, main course, and dessert.', 'Good evening! I would like to start with the tomato soup as an appetizer, please. For the main course, I will have the grilled chicken breast with mashed potatoes and a side salad. Could you make it without too much salt, please? For dessert, I would like the chocolate cake with vanilla ice cream. Oh, and can I also have a glass of sparkling water? Thank you very much. Also, I am just wondering, do you have any special offers today?', 'easy');

-- =============================================
-- GRAMMAR: Additional grammar lessons
-- =============================================
INSERT INTO grammar_lessons (title, slug, category, level, content_html, examples, sort_order) VALUES
('Future Simple (Will)', 'future-simple', 'tense', 'beginner',
'<h3>Cấu trúc</h3><p><strong>S + will + V</strong> (khẳng định)</p><p><strong>S + will not (won''t) + V</strong> (phủ định)</p><p><strong>Will + S + V?</strong> (nghi vấn)</p><h3>Cách dùng</h3><ul><li>Dự đoán tương lai: <em>It will rain tomorrow.</em></li><li>Quyết định tức thì: <em>I''ll help you with that.</em></li><li>Lời hứa: <em>I will always love you.</em></li><li>Đề nghị: <em>Will you have some tea?</em></li></ul><h3>Dấu hiệu</h3><p>tomorrow, next week/month/year, in the future, I think, probably</p>',
'I will call you later.\nShe won''t come to the party.\nWill they finish on time?', 7),

('Conditional Sentences', 'conditional-sentences', 'clause', 'intermediate',
'<h3>Câu điều kiện loại 0 (Zero)</h3><p><strong>If + S + V (present), S + V (present)</strong></p><p>Sự thật hiển nhiên: <em>If you heat water to 100°C, it boils.</em></p><h3>Câu điều kiện loại 1 (First)</h3><p><strong>If + S + V (present), S + will + V</strong></p><p>Có thể xảy ra: <em>If it rains, I will stay home.</em></p><h3>Câu điều kiện loại 2 (Second)</h3><p><strong>If + S + V (past), S + would + V</strong></p><p>Giả định không thật: <em>If I were rich, I would travel the world.</em></p>',
'If you study hard, you will pass the exam.\nIf I had a car, I would drive to work.\nIf water reaches 0°C, it freezes.', 8),

('Articles (A, An, The)', 'articles', 'article', 'beginner',
'<h3>A / An (Mạo từ không xác định)</h3><ul><li><strong>A</strong>: trước phụ âm → <em>a book, a cat, a university</em></li><li><strong>An</strong>: trước nguyên âm → <em>an apple, an hour, an umbrella</em></li><li>Dùng khi nói về thứ chung chung, lần đầu đề cập</li></ul><h3>The (Mạo từ xác định)</h3><ul><li>Dùng khi cả người nói và người nghe đều biết đang nói về gì</li><li>Dùng cho thứ duy nhất: <em>the sun, the moon</em></li><li>Dùng khi đã đề cập trước đó: <em>I saw a dog. The dog was big.</em></li></ul><h3>Không dùng mạo từ (Zero article)</h3><ul><li>Danh từ không đếm được dùng chung: <em>Love is beautiful. Water is important.</em></li><li>Tên riêng, tên nước: <em>Vietnam, John</em></li></ul>',
'I read a book yesterday. The book was very interesting.\nShe is an engineer.\nThe Earth goes around the Sun.', 9),

('Passive Voice', 'passive-voice', 'other', 'intermediate',
'<h3>Cấu trúc</h3><p><strong>S + be + V3 (past participle) + (by + agent)</strong></p><h3>Chuyển đổi qua các thì</h3><ul><li>Present Simple: <em>is/are + V3</em> → Rice <strong>is grown</strong> in Vietnam.</li><li>Past Simple: <em>was/were + V3</em> → The book <strong>was written</strong> by J.K. Rowling.</li><li>Present Perfect: <em>has/have been + V3</em> → The project <strong>has been completed</strong>.</li><li>Future: <em>will be + V3</em> → The meeting <strong>will be held</strong> tomorrow.</li></ul><h3>Khi nào dùng?</h3><ul><li>Khi không biết ai thực hiện hành động</li><li>Khi kết quả quan trọng hơn người thực hiện</li></ul>',
'English is spoken worldwide.\nThe cake was made by my mother.\nThe homework has been submitted.', 10);

-- Grammar Questions for new lessons
INSERT INTO grammar_questions (grammar_lesson_id, question_text, options, correct_answer, explanation) VALUES
(7, 'I think it ___ rain tomorrow.', '{"A":"rains","B":"will rain","C":"is raining","D":"rained"}', 'B', '"I think" + tương lai → will + V'),
(7, 'I ___ you with your homework tonight.', '{"A":"help","B":"helped","C":"will help","D":"helping"}', 'C', 'Quyết định tức thì → will + V'),
(8, 'If she studies hard, she ___ the exam.', '{"A":"passes","B":"will pass","C":"passed","D":"would pass"}', 'B', 'Điều kiện loại 1: If + present, will + V'),
(8, 'If I ___ rich, I would buy a house.', '{"A":"am","B":"was","C":"were","D":"will be"}', 'C', 'Điều kiện loại 2: If + were/V2, would + V'),
(9, 'She is ___ engineer.', '{"A":"a","B":"an","C":"the","D":"(nothing)"}', 'B', 'Trước nguyên âm → "an"'),
(9, 'I saw ___ cat in the garden. ___ cat was black.', '{"A":"a / The","B":"the / A","C":"a / A","D":"the / The"}', 'A', 'Lần đầu → a, lần sau → the'),
(10, 'English ___ all over the world.', '{"A":"speaks","B":"is spoken","C":"is speaking","D":"spoke"}', 'B', 'Bị động present: is/are + V3'),
(10, 'The letter ___ by Tom yesterday.', '{"A":"writes","B":"written","C":"was written","D":"is written"}', 'C', 'Bị động past: was/were + V3');

SET FOREIGN_KEY_CHECKS = 1;
