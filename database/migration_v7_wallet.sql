-- =============================================
-- Migration V7: Wallet System
-- English Master - Hệ thống ví điện tử
-- =============================================

-- 1. Thêm cột balance vào users
ALTER TABLE users ADD COLUMN IF NOT EXISTS balance DECIMAL(12,0) DEFAULT 0 AFTER membership_expired_at;

-- 2. Bảng giao dịch ví
CREATE TABLE IF NOT EXISTS wallet_transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    type ENUM('deposit','purchase','refund','withdraw') NOT NULL,
    amount DECIMAL(12,0) NOT NULL,
    balance_after DECIMAL(12,0) DEFAULT 0,
    status ENUM('pending','completed','rejected') DEFAULT 'pending',
    description VARCHAR(500) DEFAULT NULL,
    bank_name VARCHAR(100) DEFAULT NULL,
    bank_account VARCHAR(50) DEFAULT NULL,
    bank_holder VARCHAR(100) DEFAULT NULL,
    transfer_note VARCHAR(200) DEFAULT NULL,
    admin_note VARCHAR(500) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    processed_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user_status (user_id, status),
    INDEX idx_type_status (type, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
