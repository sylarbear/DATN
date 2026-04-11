-- =============================================
-- FIX ENCODING: Re-import Topic 1,2,3 vocabularies with correct UTF-8
-- =============================================
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- Topic 1: Daily Life
UPDATE vocabularies SET meaning_vi = 'lời chào' WHERE word = 'greeting' AND topic_id = 1;
UPDATE vocabularies SET meaning_vi = 'giới thiệu' WHERE word = 'introduce' AND topic_id = 1;
UPDATE vocabularies SET meaning_vi = 'thói quen' WHERE word = 'routine' AND topic_id = 1;
UPDATE vocabularies SET meaning_vi = 'bữa sáng' WHERE word = 'breakfast' AND topic_id = 1;
UPDATE vocabularies SET meaning_vi = 'đi làm hàng ngày' WHERE word = 'commute' AND topic_id = 1;
UPDATE vocabularies SET meaning_vi = 'lịch trình' WHERE word = 'schedule' AND topic_id = 1;
UPDATE vocabularies SET meaning_vi = 'hàng xóm' WHERE word = 'neighbor' AND topic_id = 1;
UPDATE vocabularies SET meaning_vi = 'hộ gia đình' WHERE word = 'household' AND topic_id = 1;
UPDATE vocabularies SET meaning_vi = 'cuộc hẹn' WHERE word = 'appointment' AND topic_id = 1;
UPDATE vocabularies SET meaning_vi = 'giải trí' WHERE word = 'leisure' AND topic_id = 1;

-- Topic 2: Travel & Tourism
UPDATE vocabularies SET meaning_vi = 'khởi hành' WHERE word = 'departure' AND topic_id = 2;
UPDATE vocabularies SET meaning_vi = 'điểm đến' WHERE word = 'destination' AND topic_id = 2;
UPDATE vocabularies SET meaning_vi = 'hành lý' WHERE word = 'luggage' AND topic_id = 2;
UPDATE vocabularies SET meaning_vi = 'đặt trước' WHERE word = 'reservation' AND topic_id = 2;
UPDATE vocabularies SET meaning_vi = 'hộ chiếu' WHERE word = 'passport' AND topic_id = 2;
UPDATE vocabularies SET meaning_vi = 'lịch trình' WHERE word = 'itinerary' AND topic_id = 2;
UPDATE vocabularies SET meaning_vi = 'tiền tệ' WHERE word = 'currency' AND topic_id = 2;
UPDATE vocabularies SET meaning_vi = 'quà lưu niệm' WHERE word = 'souvenir' AND topic_id = 2;
UPDATE vocabularies SET meaning_vi = 'chỗ ở' WHERE word = 'accommodation' AND topic_id = 2;
UPDATE vocabularies SET meaning_vi = 'chuyến tham quan' WHERE word = 'excursion' AND topic_id = 2;

-- Topic 3: Food & Cooking (base items from schema.sql)
UPDATE vocabularies SET meaning_vi = 'nguyên liệu' WHERE word = 'ingredient' AND topic_id = 3;
UPDATE vocabularies SET meaning_vi = 'công thức' WHERE word = 'recipe' AND topic_id = 3;
UPDATE vocabularies SET meaning_vi = 'món khai vị' WHERE word = 'appetizer' AND topic_id = 3;
UPDATE vocabularies SET meaning_vi = 'món tráng miệng' WHERE word = 'dessert' AND topic_id = 3;
UPDATE vocabularies SET meaning_vi = 'gia vị' WHERE word = 'seasoning' AND topic_id = 3;
UPDATE vocabularies SET meaning_vi = 'phần ăn' WHERE word = 'portion' AND topic_id = 3;
UPDATE vocabularies SET meaning_vi = 'ẩm thực' WHERE word = 'cuisine' AND topic_id = 3;
UPDATE vocabularies SET meaning_vi = 'đồ uống' WHERE word = 'beverage' AND topic_id = 3;

-- Fix topics table descriptions
UPDATE topics SET description = 'Từ vựng và hội thoại về cuộc sống hàng ngày: chào hỏi, giới thiệu bản thân, thói quen hàng ngày.' WHERE slug = 'daily-life';
UPDATE topics SET description = 'Học tiếng Anh giao tiếp khi đi du lịch: đặt vé, khách sạn, hỏi đường, mua sắm.' WHERE slug = 'travel-tourism';
UPDATE topics SET description = 'Từ vựng về đồ ăn, nấu ăn, gọi món tại nhà hàng và công thức nấu ăn.' WHERE slug = 'food-cooking';
UPDATE topics SET description = 'Tiếng Anh trong môi trường học tập: lớp học, trường đại học, học online.' WHERE slug = 'education';
UPDATE topics SET description = 'Từ vựng về công nghệ, máy tính, internet và các thuật ngữ IT phổ biến.' WHERE slug = 'technology';
UPDATE topics SET description = 'Tiếng Anh về sức khỏe, bệnh viện, tập gym và dinh dưỡng.' WHERE slug = 'health-fitness';

-- Fix question correct_answer Vietnamese
UPDATE questions SET correct_answer = 'Lời chào' WHERE correct_answer = 'Loi chao' OR correct_answer = 'loi chao';

-- Fix lesson titles
UPDATE lessons SET title = 'Chào hỏi & Giới thiệu' WHERE id = 1 AND title LIKE '%Greetings%';
UPDATE lessons SET title = 'Thói quen hàng ngày' WHERE id = 2 AND title LIKE '%Daily Routine%';
