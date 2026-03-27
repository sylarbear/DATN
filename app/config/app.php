<?php
/**
 * App Configuration
 * Cấu hình chung cho ứng dụng
 */

// Thông tin ứng dụng
define('APP_NAME', 'English Learning');
define('APP_VERSION', '1.0.0');

// URL gốc - thay đổi theo môi trường
define('BASE_URL', 'http://localhost/DATN/public');

// Controller và method mặc định
define('DEFAULT_CONTROLLER', 'Home');
define('DEFAULT_METHOD', 'index');

// Cấu hình upload
define('MAX_FILE_SIZE', 5 * 1024 * 1024); // 5MB
define('ALLOWED_IMAGE_TYPES', ['image/jpeg', 'image/png', 'image/gif', 'image/webp']);
define('ALLOWED_AUDIO_TYPES', ['audio/mpeg', 'audio/wav', 'audio/ogg']);

// Cấu hình session
define('SESSION_LIFETIME', 3600); // 1 giờ

// Cấu hình Speaking Score
define('ACCURACY_WEIGHT', 0.4);
define('FLUENCY_WEIGHT', 0.3);
define('PRONUNCIATION_WEIGHT', 0.3);

// Google OAuth 2.0 Configuration
// Lấy tại: https://console.cloud.google.com/apis/credentials
define('GOOGLE_CLIENT_ID', '');      // ← Dán Google Client ID vào đây
define('GOOGLE_CLIENT_SECRET', '');   // ← Dán Google Client Secret vào đây
define('GOOGLE_REDIRECT_URI', BASE_URL . '/auth/googleCallback');
