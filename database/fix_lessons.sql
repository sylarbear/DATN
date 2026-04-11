-- =============================================
-- Fix: Remove duplicate lessons + Add missing contents
-- =============================================

SET NAMES utf8mb4;

-- 1. Delete duplicate lessons (IDs 19-29 are duplicates with 0 content)
DELETE FROM lessons WHERE id IN (19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);

-- 2. Add missing lesson contents for lessons that have 0
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
