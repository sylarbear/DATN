<!-- Login Page -->
<section class="auth-section">
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <i class="fas fa-graduation-cap auth-logo"></i>
                <h2>Đăng nhập</h2>
                <p>Chào mừng bạn trở lại <?= APP_NAME ?></p>
            </div>

            <?php if (!empty($error)): ?>
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-circle"></i> <?= $error ?>
                </div>
            <?php endif; ?>

            <form method="POST" action="<?= BASE_URL ?>/auth/login" class="auth-form" id="loginForm">
                <div class="form-group">
                    <label for="username"><i class="fas fa-user"></i> Tên đăng nhập hoặc Email</label>
                    <input type="text" id="username" name="username" 
                           value="<?= htmlspecialchars($old['username'] ?? '') ?>"
                           placeholder="Nhập username hoặc email" required autofocus>
                </div>

                <div class="form-group">
                    <label for="password"><i class="fas fa-lock"></i> Mật khẩu</label>
                    <div class="password-wrapper">
                        <input type="password" id="password" name="password" 
                               placeholder="Nhập mật khẩu" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('password')">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary btn-block" id="loginBtn">
                    <i class="fas fa-sign-in-alt"></i> Đăng nhập
                </button>
            </form>

            <div class="auth-footer">
                <p>Chưa có tài khoản? <a href="<?= BASE_URL ?>/auth/register">Đăng ký ngay</a></p>
            </div>

            <div class="auth-demo">
                <p><strong>Tài khoản demo:</strong></p>
                <small>Admin: admin / admin123</small><br>
                <small>Student: student1 / student123</small>
            </div>
        </div>
    </div>
</section>
