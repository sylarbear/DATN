-- =============================================
-- Migration V4: Bug Fixes
-- Fix password hashes + add missing columns/tables
-- =============================================

-- 1. FIX: Add missing membership columns to users table
ALTER TABLE users ADD COLUMN IF NOT EXISTS membership ENUM('free','pro') DEFAULT 'free';
ALTER TABLE users ADD COLUMN IF NOT EXISTS membership_expired_at DATETIME DEFAULT NULL;

-- 2. FIX: Update password hashes to correct values
-- admin: admin123 | student1: student123
UPDATE users SET password_hash = '$2y$10$2e0fVI3pswsouUSIserZ7e.9R12E4hFWRVsvSGGlur.k5MnY.oF9i' WHERE username = 'admin';
UPDATE users SET password_hash = '$2y$10$2e0fVI3pswsouUSIserZ7e.9R12E4hFWRVsvSGGlur.k5MnY.oF9i' WHERE username = 'student1';

-- 3. FIX: Create membership_plans table if not exists
CREATE TABLE IF NOT EXISTS membership_plans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration_months INT NOT NULL DEFAULT 1,
    price INT NOT NULL DEFAULT 0,
    description TEXT,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Seed default plans (ignore if already exist)
INSERT IGNORE INTO membership_plans (id, name, duration_months, price, description) VALUES
(1, 'Pro 1 tháng', 1, 50000, 'Gói Pro 1 tháng - Mở khóa toàn bộ tính năng'),
(2, 'Pro 3 tháng', 3, 120000, 'Gói Pro 3 tháng - Tiết kiệm 20%'),
(3, 'Pro 6 tháng', 6, 200000, 'Gói Pro 6 tháng - Tiết kiệm 33%'),
(4, 'Pro 12 tháng', 12, 350000, 'Gói Pro 12 tháng - Tiết kiệm 42%');

-- 4. FIX: Create membership_orders table if not exists
CREATE TABLE IF NOT EXISTS membership_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    activation_code VARCHAR(50) DEFAULT NULL,
    transfer_note VARCHAR(500) DEFAULT NULL,
    amount INT NOT NULL DEFAULT 0,
    payment_method ENUM('activation_code','qr_transfer','casso_auto') DEFAULT 'qr_transfer',
    status ENUM('pending','completed','cancelled') DEFAULT 'pending',
    expired_at DATETIME DEFAULT NULL,
    activated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (plan_id) REFERENCES membership_plans(id),
    INDEX idx_user (user_id),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. FIX: Create activation_codes table if not exists
CREATE TABLE IF NOT EXISTS activation_codes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    plan_id INT NOT NULL,
    is_used TINYINT(1) DEFAULT 0,
    used_by INT DEFAULT NULL,
    used_at DATETIME DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES membership_plans(id),
    FOREIGN KEY (used_by) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_code (code),
    INDEX idx_used (is_used)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. FIX: Seed some test activation codes
INSERT IGNORE INTO activation_codes (code, plan_id) VALUES
('TESTPRO1', 1),
('TESTPRO3', 2),
('FREE2024', 1);
