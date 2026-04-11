-- =============================================
-- FIX ENCODING: Delete corrupted V3 data and re-insert with UTF-8
-- =============================================

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =============================================
-- 1. DELETE all corrupted V3 vocabulary data (topic 3-6 extras)
-- Keep original schema.sql data (IDs will be lower)
-- =============================================

-- Delete vocabularies added by migration_v3 (topic 3 extras + topics 4,5,6)
DELETE FROM vocabularies WHERE topic_id = 3 AND word IN ('grill','stir-fry','boil','delicious','spicy','raw','menu','reservation');
DELETE FROM vocabularies WHERE topic_id IN (4, 5, 6);

-- =============================================
-- 2. RE-INSERT vocabularies with correct UTF-8
-- =============================================

-- Food & Cooking extras (topic_id=3)
INSERT INTO vocabularies (topic_id, word, pronunciation, meaning_vi, example_sentence) VALUES
(3, 'grill', '/ɡrɪl/', 'nướng', 'We grilled some burgers for dinner.'),
(3, 'stir-fry', '/stɜːr fraɪ/', 'xào', 'I love to stir-fry vegetables with garlic.'),
(3, 'boil', '/bɔɪl/', 'luộc, đun sôi', 'Boil the water before adding the pasta.'),
(3, 'delicious', '/dɪˈlɪʃəs/', 'ngon', 'This soup is absolutely delicious!'),
(3, 'spicy', '/ˈspaɪsi/', 'cay', 'Thai food is usually very spicy.'),
(3, 'raw', '/rɔː/', 'sống, chưa nấu', 'Sushi is made with raw fish.'),
(3, 'menu', '/ˈmenjuː/', 'thực đơn', 'Could I see the menu, please?'),
(3, 'reservation', '/ˌrezərˈveɪʃn/', 'đặt bàn', 'I would like to make a reservation for two.');

-- Education (topic_id=4)
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

-- Technology (topic_id=5)
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

-- Health & Fitness (topic_id=6)
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
-- 3. FIX lesson contents (already deleted, re-insert)
-- =============================================

-- ID:3 = At Home (Topic: Daily Life)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(3, 'text', '<h3>Rooms in a House</h3>
<ul>
<li><strong>Living room</strong> (phòng khách) - We usually watch TV in the living room.</li>
<li><strong>Bedroom</strong> (phòng ngủ) - I have my own bedroom upstairs.</li>
<li><strong>Kitchen</strong> (nhà bếp) - My mother cooks in the kitchen every day.</li>
<li><strong>Bathroom</strong> (phòng tắm) - The bathroom is next to my bedroom.</li>
<li><strong>Dining room</strong> (phòng ăn) - We have dinner together in the dining room.</li>
<li><strong>Balcony</strong> (ban công) - I like to sit on the balcony and read books.</li>
<li><strong>Garage</strong> (nhà để xe) - My father parks his car in the garage.</li>
</ul>', 1),
(3, 'text', '<h3>Household Chores</h3>
<ul>
<li><strong>Do the laundry</strong> - giặt quần áo</li>
<li><strong>Wash the dishes</strong> - rửa bát</li>
<li><strong>Sweep the floor</strong> - quét nhà</li>
<li><strong>Take out the trash</strong> - đổ rác</li>
<li><strong>Water the plants</strong> - tưới cây</li>
<li><strong>Make the bed</strong> - dọn giường</li>
</ul>
<h3>Dialogue</h3>
<div class="dialogue">
<p><strong>Mom:</strong> Can you help me with the housework today?</p>
<p><strong>You:</strong> Sure, Mom! What should I do?</p>
<p><strong>Mom:</strong> Please wash the dishes and sweep the floor.</p>
<p><strong>You:</strong> OK. Should I also take out the trash?</p>
<p><strong>Mom:</strong> Yes, please. Thank you for helping!</p>
</div>', 2);

-- ID:5 = Hotel Check-in (Topic: Travel)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(5, 'text', '<h3>Hotel Check-in Vocabulary</h3>
<ul>
<li><strong>Reservation</strong> - đặt phòng: <em>I have a reservation under the name Nguyen.</em></li>
<li><strong>Single room</strong> - phòng đơn</li>
<li><strong>Double room</strong> - phòng đôi</li>
<li><strong>Check-in / Check-out</strong> - nhận phòng / trả phòng</li>
<li><strong>Room key / Key card</strong> - chìa khóa phòng / thẻ từ</li>
<li><strong>Front desk / Reception</strong> - quầy lễ tân</li>
<li><strong>Bellboy</strong> - nhân viên khuân hành lý</li>
</ul>', 1),
(5, 'text', '<h3>Check-in Dialogue</h3>
<div class="dialogue">
<p><strong>Receptionist:</strong> Good evening! Welcome to Grand Hotel. How can I help you?</p>
<p><strong>Guest:</strong> Hello! I have a reservation for two nights. The name is Tran Van Minh.</p>
<p><strong>Receptionist:</strong> Let me check... Yes, I found it. A double room with breakfast included. May I see your ID or passport, please?</p>
<p><strong>Guest:</strong> Here you are.</p>
<p><strong>Receptionist:</strong> Thank you. Your room is 504 on the fifth floor. Here is your key card. Breakfast is served from 6:30 to 9:30 AM in the restaurant on the second floor.</p>
<p><strong>Guest:</strong> Is there Wi-Fi in the room?</p>
<p><strong>Receptionist:</strong> Yes, the password is on the card in your room. Enjoy your stay!</p>
</div>', 2);

-- ID:6 = Asking for Directions (Topic: Travel)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(6, 'text', '<h3>Asking for Directions</h3>
<ul>
<li><strong>Excuse me, how do I get to...?</strong> - Xin lỗi, tôi đi đến... bằng cách nào?</li>
<li><strong>Is it far from here?</strong> - Có xa đây không?</li>
<li><strong>Turn left / Turn right</strong> - Rẽ trái / Rẽ phải</li>
<li><strong>Go straight</strong> - Đi thẳng</li>
<li><strong>It''s on the corner</strong> - Nó ở góc đường</li>
<li><strong>It''s next to / opposite / between</strong> - Nó ở bên cạnh / đối diện / giữa</li>
<li><strong>Take the first/second left</strong> - Rẽ trái ở ngã rẽ đầu tiên/thứ hai</li>
</ul>', 1),
(6, 'text', '<h3>Dialogue</h3>
<div class="dialogue">
<p><strong>Tourist:</strong> Excuse me, could you tell me how to get to the nearest bank?</p>
<p><strong>Local:</strong> Sure! Go straight for about 200 meters, then turn right at the traffic light.</p>
<p><strong>Tourist:</strong> Turn right at the traffic light. Got it.</p>
<p><strong>Local:</strong> Then walk past the post office. The bank is on your left, next to a coffee shop.</p>
<p><strong>Tourist:</strong> How long does it take to walk there?</p>
<p><strong>Local:</strong> About 5 minutes. You can''t miss it!</p>
<p><strong>Tourist:</strong> Thank you so much!</p>
</div>', 2);

-- ID:11 = University Experience (Topic: Education)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(11, 'text', '<h3>University Life in English-speaking Countries</h3>
<p>University life in English-speaking countries has some differences compared to Vietnam:</p>
<ul>
<li><strong>Credit system:</strong> Students choose their own courses each semester to earn enough credits for graduation.</li>
<li><strong>Office hours:</strong> Professors set specific times when students can visit for help. <em>"I''ll go to the professor''s office hours to ask about the assignment."</em></li>
<li><strong>Group projects:</strong> Many courses require collaborative work with other students.</li>
<li><strong>Midterm / Final exams:</strong> Most courses have a midterm exam (giữa kỳ) and a final exam (cuối kỳ).</li>
<li><strong>GPA:</strong> Grade Point Average on a 4.0 scale. 3.5+ is considered excellent.</li>
</ul>', 1),
(11, 'text', '<h3>Useful Phrases for University</h3>
<ul>
<li><strong>I''m majoring in...</strong> - Tôi chuyên ngành...</li>
<li><strong>What year are you?</strong> - Bạn năm mấy? → <em>I''m a sophomore (năm 2).</em></li>
<li><strong>When is the deadline?</strong> - Khi nào hạn nộp?</li>
<li><strong>Could I get an extension?</strong> - Có thể gia hạn được không?</li>
<li><strong>I need to drop this class.</strong> - Tôi cần rút khỏi lớp này.</li>
<li><strong>Let''s form a study group.</strong> - Hãy lập nhóm học tập.</li>
</ul>
<p><strong>Year names:</strong> Freshman (năm 1), Sophomore (năm 2), Junior (năm 3), Senior (năm 4)</p>', 2);

-- ID:14 = Internet & Social Media (Topic: Technology)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(14, 'text', '<h3>Internet & Social Media Vocabulary</h3>
<ul>
<li><strong>Post</strong> - đăng bài: <em>She posted a photo on Instagram.</em></li>
<li><strong>Share</strong> - chia sẻ: <em>Can you share this link?</em></li>
<li><strong>Follow / Unfollow</strong> - theo dõi / bỏ theo dõi</li>
<li><strong>Like</strong> - thích: <em>The post got 1000 likes.</em></li>
<li><strong>Comment</strong> - bình luận: <em>Please leave a comment below.</em></li>
<li><strong>Notification</strong> - thông báo: <em>I turned off notifications.</em></li>
<li><strong>Stream / Livestream</strong> - phát trực tiếp</li>
<li><strong>Hashtag (#)</strong> - thẻ tag: <em>Use the hashtag #LearnEnglish.</em></li>
<li><strong>Influencer</strong> - người có ảnh hưởng trên MXH</li>
<li><strong>Go viral</strong> - lan truyền rộng rãi: <em>The video went viral overnight.</em></li>
</ul>', 1),
(14, 'text', '<h3>Online Safety Tips</h3>
<ul>
<li><strong>Don''t share personal information</strong> like your address or phone number online.</li>
<li><strong>Use strong passwords</strong> and change them regularly.</li>
<li><strong>Enable two-factor authentication (2FA)</strong> for important accounts.</li>
<li><strong>Be careful with links</strong> from unknown sources - they might be phishing scams.</li>
<li><strong>Think before you post</strong> - once something is online, it''s hard to delete.</li>
</ul>
<p><strong>Key terms:</strong> phishing (lừa đảo), scam (trò lừa), privacy (quyền riêng tư), hacker (tin tặc)</p>', 2);

-- ID:17 = Healthy Lifestyle (Topic: Health)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(17, 'text', '<h3>Tips for a Healthy Lifestyle</h3>
<ul>
<li><strong>Eat a balanced diet</strong> - Ăn uống cân bằng: Include fruits, vegetables, protein, and whole grains.</li>
<li><strong>Drink plenty of water</strong> - Uống đủ nước: At least 2 liters per day.</li>
<li><strong>Get enough sleep</strong> - Ngủ đủ giấc: Adults need 7-9 hours per night.</li>
<li><strong>Exercise regularly</strong> - Tập thể dục đều đặn: At least 30 minutes, 3 times per week.</li>
<li><strong>Manage stress</strong> - Kiểm soát căng thẳng: Try meditation or deep breathing.</li>
<li><strong>Avoid junk food</strong> - Tránh đồ ăn vặt: Limit sugar, salt, and processed foods.</li>
</ul>', 1),
(17, 'text', '<h3>Dialogue: Giving Health Advice</h3>
<div class="dialogue">
<p><strong>A:</strong> I''ve been feeling really tired lately.</p>
<p><strong>B:</strong> Are you getting enough sleep?</p>
<p><strong>A:</strong> Not really. I usually go to bed after midnight.</p>
<p><strong>B:</strong> That''s probably the problem. You should try to sleep before 11 PM.</p>
<p><strong>A:</strong> You''re right. I also skip breakfast a lot.</p>
<p><strong>B:</strong> That''s not good. Breakfast gives you energy for the whole morning. You should eat something healthy like oatmeal or fruit.</p>
<p><strong>A:</strong> Thanks for the advice. I''ll try to change my habits.</p>
</div>', 2);

-- ID:18 = Sports & Exercise (Topic: Health)
INSERT INTO lesson_contents (lesson_id, content_type, content, sort_order) VALUES
(18, 'text', '<h3>Popular Sports & Exercises</h3>
<ul>
<li><strong>Running / Jogging</strong> - chạy bộ: <em>I go jogging in the park every morning.</em></li>
<li><strong>Swimming</strong> - bơi lội: <em>Swimming is a full-body workout.</em></li>
<li><strong>Cycling</strong> - đạp xe: <em>I cycle to work instead of driving.</em></li>
<li><strong>Yoga</strong> - yoga: <em>Yoga helps with flexibility and relaxation.</em></li>
<li><strong>Weight training</strong> - tập tạ: <em>He does weight training three times a week.</em></li>
<li><strong>Basketball</strong> - bóng rổ</li>
<li><strong>Football (Soccer)</strong> - bóng đá</li>
<li><strong>Badminton</strong> - cầu lông</li>
</ul>', 1),
(18, 'text', '<h3>At the Gym - Useful Phrases</h3>
<ul>
<li><strong>How much does a membership cost?</strong> - Phí thành viên bao nhiêu?</li>
<li><strong>Where is the changing room?</strong> - Phòng thay đồ ở đâu?</li>
<li><strong>Can you show me how to use this machine?</strong> - Bạn chỉ tôi cách dùng máy này được không?</li>
<li><strong>How many reps should I do?</strong> - Tôi nên tập bao nhiêu lần?</li>
<li><strong>I need a spotter.</strong> - Tôi cần người hỗ trợ.</li>
</ul>
<p><strong>Gym vocabulary:</strong> reps (số lần lặp), sets (hiệp), warm up (khởi động), cool down (thả lỏng), personal trainer (huấn luyện viên cá nhân)</p>', 2);

-- =============================================
-- 4. FIX grammar explanations (Vietnamese text)
-- =============================================
UPDATE grammar_questions SET explanation = 'Chủ ngữ "She" (ngôi 3 số ít) → V thêm s/es' WHERE grammar_lesson_id = 1 AND correct_answer = 'B' AND question_text LIKE 'She ___ to school%';
UPDATE grammar_questions SET explanation = '"You" dùng trợ động từ "Do"' WHERE grammar_lesson_id = 1 AND correct_answer = 'B' AND question_text LIKE '%you like coffee%';
UPDATE grammar_questions SET explanation = '"Look!" → hành động đang xảy ra → Present Continuous' WHERE grammar_lesson_id = 2 AND question_text LIKE 'Look%';
UPDATE grammar_questions SET explanation = '"right now" → Present Continuous' WHERE grammar_lesson_id = 2 AND question_text LIKE 'She ___ a letter%';
UPDATE grammar_questions SET explanation = 'Kinh nghiệm → Present Perfect' WHERE grammar_lesson_id = 3 AND question_text LIKE '%Paris%';
UPDATE grammar_questions SET explanation = '"since 2015" → Present Perfect' WHERE grammar_lesson_id = 3 AND question_text LIKE '%since 2015%';
UPDATE grammar_questions SET explanation = '"yesterday" → Past Simple' WHERE grammar_lesson_id = 4 AND question_text LIKE '%yesterday%';
UPDATE grammar_questions SET explanation = 'Giờ cụ thể → at' WHERE grammar_lesson_id = 5 AND question_text LIKE '%8 AM%';
UPDATE grammar_questions SET explanation = 'Mùa → in' WHERE grammar_lesson_id = 5 AND question_text LIKE '%summer%';
UPDATE grammar_questions SET explanation = 'Lời khuyên → should' WHERE grammar_lesson_id = 6 AND question_text LIKE '%helmet%';

-- Fix new grammar questions (lesson 7-10)
UPDATE grammar_questions SET explanation = '"I think" + tương lai → will + V' WHERE grammar_lesson_id = 7 AND question_text LIKE '%rain tomorrow%';
UPDATE grammar_questions SET explanation = 'Quyết định tức thì → will + V' WHERE grammar_lesson_id = 7 AND question_text LIKE '%homework tonight%';
UPDATE grammar_questions SET explanation = 'Điều kiện loại 1: If + present, will + V' WHERE grammar_lesson_id = 8 AND question_text LIKE '%studies hard%';
UPDATE grammar_questions SET explanation = 'Điều kiện loại 2: If + were/V2, would + V' WHERE grammar_lesson_id = 8 AND question_text LIKE '%rich%';
UPDATE grammar_questions SET explanation = 'Trước nguyên âm → "an"' WHERE grammar_lesson_id = 9 AND question_text LIKE '%engineer%';
UPDATE grammar_questions SET explanation = 'Lần đầu → a, lần sau → the' WHERE grammar_lesson_id = 9 AND question_text LIKE '%cat in the garden%';
UPDATE grammar_questions SET explanation = 'Bị động present: is/are + V3' WHERE grammar_lesson_id = 10 AND question_text LIKE '%English%';
UPDATE grammar_questions SET explanation = 'Bị động past: was/were + V3' WHERE grammar_lesson_id = 10 AND question_text LIKE '%letter%';

-- =============================================
-- 5. FIX speaking prompt Vietnamese parts 
-- =============================================
-- Update speaking prompts that have Vietnamese in sample_answer
-- These prompts from migration_v3 have sample_answer in English so they should be OK
-- But let's fix any topic_id=4,5,6 prompts that might have corrupted sample answers

-- Education prompts
UPDATE speaking_prompts SET sample_answer = 'I am studying at the University of Technology. My major is Information Technology. The campus is quite large and has many modern buildings. My favorite place on campus is the library because it is quiet and has many useful books. I have classes from Monday to Friday. I usually study with my friends after class. I really enjoy university life.' WHERE topic_id = 4 AND difficulty = 'easy' AND prompt_text LIKE '%school or university%';

UPDATE speaking_prompts SET sample_answer = 'Online learning has both advantages and disadvantages. The main advantage is flexibility. Students can study at their own pace and from anywhere with an internet connection. It also saves time and money on commuting. However, there are some disadvantages. Students may feel isolated because they cannot interact with classmates face to face. It requires strong self-discipline. Also, some subjects like science labs are difficult to teach online. Overall, I think online learning is a good option but should be combined with some in-person classes.' WHERE topic_id = 4 AND difficulty = 'medium' AND prompt_text LIKE '%online learning%';

UPDATE speaking_prompts SET sample_answer = 'The teacher who influenced me the most is my high school English teacher, Mrs. Nguyen. She was very patient and always encouraged students to speak English without fear of making mistakes. She used many creative teaching methods like games, role-plays, and group discussions. She often told us that the key to learning a language is practice and confidence. Thanks to her inspiration, I developed a strong passion for English. She taught me that learning should be enjoyable, not stressful. I am very grateful for her guidance.' WHERE topic_id = 4 AND difficulty = 'hard' AND prompt_text LIKE '%teacher who%';

-- =============================================
-- 6. FIX grammar lesson content_html (Vietnamese)
-- =============================================
UPDATE grammar_lessons SET content_html = '<h3>Cấu trúc</h3><p><strong>S + V(s/es)</strong> (khẳng định)</p><p><strong>S + do/does + not + V</strong> (phủ định)</p><p><strong>Do/Does + S + V?</strong> (nghi vấn)</p><h3>Cách dùng</h3><ul><li>Thói quen hàng ngày: <em>I go to school every day.</em></li><li>Sự thật hiển nhiên: <em>The sun rises in the east.</em></li><li>Lịch trình cố định: <em>The train leaves at 9 AM.</em></li></ul><h3>Dấu hiệu</h3><p>always, usually, often, sometimes, rarely, never, every day/week/month</p>' WHERE slug = 'present-simple';

UPDATE grammar_lessons SET content_html = '<h3>Cấu trúc</h3><p><strong>S + am/is/are + V-ing</strong></p><h3>Cách dùng</h3><ul><li>Hành động đang xảy ra: <em>I am studying now.</em></li><li>Kế hoạch tương lai gần: <em>We are meeting tomorrow.</em></li><li>Thay đổi, xu hướng: <em>The weather is getting colder.</em></li></ul><h3>Dấu hiệu</h3><p>now, right now, at the moment, currently, Look! Listen!</p>' WHERE slug = 'present-continuous';

UPDATE grammar_lessons SET content_html = '<h3>Cấu trúc</h3><p><strong>S + have/has + V3 (past participle)</strong></p><h3>Cách dùng</h3><ul><li>Kinh nghiệm: <em>I have visited Paris twice.</em></li><li>Hành động vừa hoàn thành: <em>She has just finished her homework.</em></li><li>Hành động bắt đầu trong quá khứ, kéo dài đến hiện tại: <em>We have lived here since 2010.</em></li></ul><h3>Dấu hiệu</h3><p>since, for, already, yet, just, ever, never, recently</p>' WHERE slug = 'present-perfect';

UPDATE grammar_lessons SET content_html = '<h3>Cấu trúc</h3><p><strong>S + V2 (past tense)</strong> (khẳng định)</p><p><strong>S + did + not + V</strong> (phủ định)</p><h3>Cách dùng</h3><ul><li>Hành động đã hoàn thành: <em>I went to school yesterday.</em></li><li>Thói quen trong quá khứ: <em>She always walked to work.</em></li></ul><h3>Dấu hiệu</h3><p>yesterday, last week/month/year, ago, in 2020</p>' WHERE slug = 'past-simple';

UPDATE grammar_lessons SET content_html = '<h3>IN / ON / AT</h3><ul><li><strong>IN</strong>: tháng, năm, mùa, buổi → <em>in January, in 2024, in summer, in the morning</em></li><li><strong>ON</strong>: ngày, thứ → <em>on Monday, on July 4th, on my birthday</em></li><li><strong>AT</strong>: giờ, thời điểm cụ thể → <em>at 9 AM, at noon, at night, at the weekend</em></li></ul>' WHERE slug = 'prepositions-time';

UPDATE grammar_lessons SET content_html = '<h3>Can / Could / Should / Must / May / Might</h3><ul><li><strong>Can</strong>: khả năng → <em>I can swim.</em></li><li><strong>Could</strong>: khả năng (quá khứ/lịch sự) → <em>Could you help me?</em></li><li><strong>Should</strong>: lời khuyên → <em>You should study harder.</em></li><li><strong>Must</strong>: bắt buộc → <em>You must wear a seatbelt.</em></li><li><strong>May/Might</strong>: khả năng xảy ra → <em>It might rain tomorrow.</em></li></ul>' WHERE slug = 'modal-verbs';

UPDATE grammar_lessons SET content_html = '<h3>Cấu trúc</h3><p><strong>S + will + V</strong> (khẳng định)</p><p><strong>S + will not (won''t) + V</strong> (phủ định)</p><p><strong>Will + S + V?</strong> (nghi vấn)</p><h3>Cách dùng</h3><ul><li>Dự đoán tương lai: <em>It will rain tomorrow.</em></li><li>Quyết định tức thì: <em>I''ll help you with that.</em></li><li>Lời hứa: <em>I will always love you.</em></li><li>Đề nghị: <em>Will you have some tea?</em></li></ul><h3>Dấu hiệu</h3><p>tomorrow, next week/month/year, in the future, I think, probably</p>' WHERE slug = 'future-simple';

UPDATE grammar_lessons SET content_html = '<h3>Câu điều kiện loại 0 (Zero)</h3><p><strong>If + S + V (present), S + V (present)</strong></p><p>Sự thật hiển nhiên: <em>If you heat water to 100°C, it boils.</em></p><h3>Câu điều kiện loại 1 (First)</h3><p><strong>If + S + V (present), S + will + V</strong></p><p>Có thể xảy ra: <em>If it rains, I will stay home.</em></p><h3>Câu điều kiện loại 2 (Second)</h3><p><strong>If + S + V (past), S + would + V</strong></p><p>Giả định không thật: <em>If I were rich, I would travel the world.</em></p>' WHERE slug = 'conditional-sentences';

UPDATE grammar_lessons SET content_html = '<h3>A / An (Mạo từ không xác định)</h3><ul><li><strong>A</strong>: trước phụ âm → <em>a book, a cat, a university</em></li><li><strong>An</strong>: trước nguyên âm → <em>an apple, an hour, an umbrella</em></li><li>Dùng khi nói về thứ chung chung, lần đầu đề cập</li></ul><h3>The (Mạo từ xác định)</h3><ul><li>Dùng khi cả người nói và người nghe đều biết đang nói về gì</li><li>Dùng cho thứ duy nhất: <em>the sun, the moon</em></li><li>Dùng khi đã đề cập trước đó: <em>I saw a dog. The dog was big.</em></li></ul><h3>Không dùng mạo từ (Zero article)</h3><ul><li>Danh từ không đếm được dùng chung: <em>Love is beautiful. Water is important.</em></li><li>Tên riêng, tên nước: <em>Vietnam, John</em></li></ul>' WHERE slug = 'articles';

UPDATE grammar_lessons SET content_html = '<h3>Cấu trúc</h3><p><strong>S + be + V3 (past participle) + (by + agent)</strong></p><h3>Chuyển đổi qua các thì</h3><ul><li>Present Simple: <em>is/are + V3</em> → Rice <strong>is grown</strong> in Vietnam.</li><li>Past Simple: <em>was/were + V3</em> → The book <strong>was written</strong> by J.K. Rowling.</li><li>Present Perfect: <em>has/have been + V3</em> → The project <strong>has been completed</strong>.</li><li>Future: <em>will be + V3</em> → The meeting <strong>will be held</strong> tomorrow.</li></ul><h3>Khi nào dùng?</h3><ul><li>Khi không biết ai thực hiện hành động</li><li>Khi kết quả quan trọng hơn người thực hiện</li></ul>' WHERE slug = 'passive-voice';

SET FOREIGN_KEY_CHECKS = 1;
