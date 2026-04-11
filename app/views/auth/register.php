<!-- Register Page -->
<section class="auth-section">
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <i class="fas fa-graduation-cap auth-logo"></i>
                <h2>Đăng ký tài khoản</h2>
                <p>Tạo tài khoản để bắt đầu học tiếng Anh</p>
            </div>

            <?php if (!empty($errors)): ?>
                <div class="alert alert-error">
                    <ul>
                        <?php foreach ($errors as $err): ?>
                            <li><i class="fas fa-exclamation-circle"></i> <?= htmlspecialchars($err) ?></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            <?php endif; ?>

            <form method="POST" action="<?= BASE_URL ?>/auth/register" class="auth-form" id="registerForm">
                <div class="form-group">
                    <label for="full_name"><i class="fas fa-id-card"></i> Họ và tên</label>
                    <input type="text" id="full_name" name="full_name" 
                           value="<?= htmlspecialchars($old['full_name'] ?? '') ?>"
                           placeholder="Nhập họ tên đầy đủ" required>
                </div>

                <div class="form-group">
                    <label for="username"><i class="fas fa-user"></i> Tên đăng nhập</label>
                    <input type="text" id="username" name="username" 
                           value="<?= htmlspecialchars($old['username'] ?? '') ?>"
                           placeholder="Nhập tên đăng nhập (ít nhất 3 ký tự)" required minlength="3">
                </div>

                <div class="form-group">
                    <label for="email"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" id="email" name="email" 
                           value="<?= htmlspecialchars($old['email'] ?? '') ?>"
                           placeholder="Nhập địa chỉ email" required>
                </div>

                <div class="form-group">
                    <label for="password"><i class="fas fa-lock"></i> Mật khẩu</label>
                    <div class="password-wrapper">
                        <input type="password" id="password" name="password" 
                               placeholder="Ít nhất 6 ký tự" required minlength="6">
                        <button type="button" class="password-toggle" onclick="togglePassword('password')">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password_confirm"><i class="fas fa-lock"></i> Xác nhận mật khẩu</label>
                    <div class="password-wrapper">
                        <input type="password" id="password_confirm" name="password_confirm" 
                               placeholder="Nhập lại mật khẩu" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('password_confirm')">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary btn-block" id="registerBtn">
                    <i class="fas fa-user-plus"></i> Đăng ký
                </button>
            </form>

            <div class="auth-footer">
                <p>Đã có tài khoản? <a href="<?= BASE_URL ?>/auth/login">Đăng nhập</a></p>
            </div>
        </div>
    </div>
</section>
