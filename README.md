# EnglishMaster - Hệ thống học tiếng Anh trực tuyến

## Giới thiệu
EnglishMaster là hệ thống học tiếng Anh trực tuyến theo chủ đề, tích hợp đánh giá kỹ năng nói bằng AI.

## Tính năng chính
- 📚 Học từ vựng theo chủ đề (6 topics, 100+ từ)
- 🎯 Bài test: Quiz, Listening, Reading (30 câu/bài)
- 🗣️ Luyện nói (Speaking Practice) với AI chấm điểm
- 📊 Dashboard theo dõi tiến độ (biểu đồ radar + bar chart)
- 🏆 Bảng xếp hạng (Leaderboard)
- 🃏 Flashcard luyện từ vựng (3D flip)
- 🎖️ Hệ thống huy hiệu (8 badges)
- 👤 Hồ sơ cá nhân + đổi mật khẩu
- 💎 Hội viên Pro (nâng cấp, phân quyền tính năng)
- 🔧 Admin Panel (quản lý users, chủ đề, câu hỏi, mã kích hoạt)

## Công nghệ
- **Backend:** PHP 8 (MVC tự xây dựng)
- **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
- **Database:** MySQL
- **Charts:** Chart.js 4
- **Icons:** Font Awesome 6
- **Server:** XAMPP (Apache + MySQL)

## Cài đặt
1. Clone repo vào thư mục XAMPP `htdocs/DATN`
2. Import file `database/schema.sql` vào MySQL
3. Cấu hình DB trong `app/config/database.php`
4. Truy cập `http://localhost/DATN/public/`

## Tài khoản demo
| Username | Password | Role |
|----------|----------|------|
| admin | 123456 | Admin |
| student1 | 123456 | Student |

## Cấu trúc thư mục
```
DATN/
├── app/
│   ├── config/          # Cấu hình app + database
│   ├── controllers/     # Controllers (MVC)
│   ├── core/            # App, Controller, Middleware, Model
│   ├── models/          # Models (Database queries)
│   └── views/           # Views (PHP templates)
├── database/            # SQL schemas + seed data
└── public/              # Document root
    ├── css/             # Stylesheets
    ├── js/              # JavaScript
    └── index.php        # Front controller
```
