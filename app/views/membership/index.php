<!-- Membership Pro Page -->
<section class="page-header">
    <div class="container">
        <h1><i class="fas fa-crown"></i> Nâng cấp Pro</h1>
        <p style="color:var(--text-secondary);">Mở khóa toàn bộ tính năng học tập nâng cao</p>
    </div>
</section>

<!-- Current Status -->
<?php if ($isPro): ?>
<section style="padding:1rem 0;">
    <div class="container">
        <div class="pro-status-banner">
            <div class="pro-badge-large">
                <i class="fas fa-crown"></i> PRO
            </div>
            <div>
                <h3>Bạn đang là hội viên Pro!</h3>
                <p>Hết hạn: <?= $user['membership_expired_at'] ? date('d/m/Y', strtotime($user['membership_expired_at'])) : 'Không giới hạn' ?></p>
            </div>
        </div>
    </div>
</section>
<?php endif; ?>

<!-- Features Comparison -->
<section style="padding:2rem 0;">
    <div class="container">
        <h2 style="text-align:center; margin-bottom:0.5rem;"><i class="fas fa-table"></i> So sánh gói</h2>
        <p style="text-align:center; color:var(--text-muted); margin-bottom:2rem;">Chọn gói phù hợp với nhu cầu học tập của bạn</p>

        <div class="comparison-table">
            <table>
                <thead>
                    <tr>
                        <th>Tính năng</th>
                        <th>Free</th>
                        <th class="pro-col"><i class="fas fa-crown"></i> Pro</th>
                    </tr>
                </thead>
                <tbody>
                    <tr><td>Xem chủ đề & từ vựng</td><td><i class="fas fa-check text-success"></i></td><td class="pro-col"><i class="fas fa-check text-success"></i></td></tr>
                    <tr><td>Học bài (3 topic đầu)</td><td><i class="fas fa-check text-success"></i></td><td class="pro-col"><i class="fas fa-check text-success"></i></td></tr>
                    <tr><td>Làm bài test Quiz</td><td><i class="fas fa-check text-success"></i></td><td class="pro-col"><i class="fas fa-check text-success"></i></td></tr>
                    <tr><td>Dashboard tiến độ</td><td><i class="fas fa-check text-success"></i></td><td class="pro-col"><i class="fas fa-check text-success"></i></td></tr>
                    <tr><td>Mở khóa tất cả khóa học</td><td><i class="fas fa-times text-danger"></i></td><td class="pro-col"><i class="fas fa-check text-success"></i></td></tr>
                    <tr><td>Bài test Listening</td><td><i class="fas fa-times text-danger"></i></td><td class="pro-col"><i class="fas fa-check text-success"></i></td></tr>
                    <tr><td>Bài test Reading</td><td><i class="fas fa-times text-danger"></i></td><td class="pro-col"><i class="fas fa-check text-success"></i></td></tr>
                    <tr><td>Luyện nói (Speaking)</td><td><i class="fas fa-times text-danger"></i></td><td class="pro-col"><i class="fas fa-check text-success"></i></td></tr>
                    <tr><td>Hỗ trợ ưu tiên</td><td><i class="fas fa-times text-danger"></i></td><td class="pro-col"><i class="fas fa-check text-success"></i></td></tr>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Pricing Cards -->
<section style="padding:2rem 0;">
    <div class="container">
        <h2 style="text-align:center; margin-bottom:2rem;"><i class="fas fa-tags"></i> Bảng giá</h2>
        <div class="pricing-grid">
            <?php foreach ($plans as $plan): ?>
            <div class="pricing-card <?= !empty($plan['is_popular']) ? 'popular' : '' ?>">
                <?php if (!empty($plan['is_popular'])): ?>
                    <div class="popular-badge">PHỔ BIẾN NHẤT</div>
                <?php endif; ?>
                <div class="pricing-header">
                    <h3><?= htmlspecialchars($plan['name']) ?></h3>
                    <div class="pricing-price">
                        <span class="price-amount"><?= number_format($plan['price']) ?></span>
                        <span class="price-currency">VNĐ</span>
                    </div>
                    <p class="pricing-desc"><?= htmlspecialchars($plan['description'] ?? '') ?></p>
                </div>
                <div class="pricing-features">
                    <?php foreach (explode('|', $plan['features'] ?? '') as $feature): ?>
                        <?php if (trim($feature) !== ''): ?>
                        <div class="feature-item">
                            <i class="fas fa-check-circle"></i>
                            <span><?= htmlspecialchars($feature) ?></span>
                        </div>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </div>
                <div class="pricing-footer">
                    <button class="btn btn-primary btn-block" onclick="showPayment(<?= $plan['id'] ?>, '<?= htmlspecialchars($plan['name']) ?>', <?= $plan['price'] ?>)">
                        <i class="fas fa-shopping-cart"></i> Chọn gói này
                    </button>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>

<!-- Activation Code Section -->
<section style="padding:2rem 0 3rem;">
    <div class="container">
        <div class="activation-card">
            <h3><i class="fas fa-key"></i> Kích hoạt bằng mã</h3>
            <p>Bạn đã có mã kích hoạt? Nhập vào đây để nâng cấp ngay.</p>
            <div class="activation-form">
                <input type="text" id="activationCode" placeholder="Nhập mã kích hoạt (VD: PRO1-FREE-TRIAL)" class="input-lg" autocomplete="off">
                <button class="btn btn-primary btn-lg" id="activateBtn" onclick="activateCode()">
                    <i class="fas fa-bolt"></i> Kích hoạt
                </button>
            </div>
            <div id="activationResult" style="margin-top:1rem;"></div>
        </div>
    </div>
</section>

<!-- Order History -->
<?php if (!empty($orders)): ?>
<section style="padding:0 0 3rem;">
    <div class="container">
        <div class="section-card">
            <h3><i class="fas fa-history"></i> Lịch sử nâng cấp</h3>
            <div class="progress-table">
                <table>
                    <thead><tr>
                        <th>Gói</th>
                        <th>Mã</th>
                        <th>Ngày kích hoạt</th>
                        <th>Hết hạn</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr></thead>
                    <tbody>
                    <?php foreach ($orders as $order): ?>
                        <?php
                            $statusLabels = ['pending'=>'Đang chờ','completed'=>'Hoàn tất','cancelled'=>'Đã hủy'];
                            $statusColors = ['pending'=>'#f59e0b','completed'=>'#10b981','cancelled'=>'#ef4444'];
                            $status = $order['status'] ?? 'completed';
                        ?>
                        <tr>
                            <td><?= htmlspecialchars($order['plan_name'] ?? '') ?></td>
                            <td><?= htmlspecialchars($order['activation_code'] ?? '–') ?></td>
                            <td><?= date('d/m/Y H:i', strtotime($order['activated_at'])) ?></td>
                            <td><?= date('d/m/Y', strtotime($order['expired_at'])) ?></td>
                            <td><span style="background:<?= $statusColors[$status] ?? '#999' ?>20; color:<?= $statusColors[$status] ?? '#999' ?>; padding:3px 10px; border-radius:20px; font-size:0.75rem; font-weight:600;"><?= $statusLabels[$status] ?? $status ?></span></td>
                            <td>
                            <?php if ($status === 'pending'):
                                // Check cancel eligibility
                                require_once APP_PATH . '/controllers/SupportController.php';
                                $eligibility = SupportController::checkCancelEligibility($order, $order);
                                if ($eligibility['can_cancel']): ?>
                                    <a href="<?= BASE_URL ?>/support/create?type=cancel_order&order_id=<?= $order['id'] ?>"
                                       class="btn" style="padding:3px 10px; font-size:0.75rem; background:#ef4444; color:white;"
                                       title="<?= htmlspecialchars($eligibility['policy_note']) ?>">
                                        <i class="fas fa-times-circle"></i> Hủy đơn (<?= $eligibility['refund_percent'] ?>%)
                                    </a>
                                <?php else: ?>
                                    <span style="color:var(--text-muted); font-size:0.75rem;" title="<?= htmlspecialchars($eligibility['policy_note']) ?>">
                                        <i class="fas fa-lock"></i> Hết hạn hủy
                                    </span>
                                <?php endif;
                            else: ?>
                                –
                            <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<?php endif; ?>

<!-- Payment Modal (Wallet-based) -->
<div class="modal" id="paymentModal">
    <div class="modal-overlay" onclick="closePayment()"></div>
    <div class="modal-content" style="max-width:520px;">
        <div class="modal-header" style="display:flex; justify-content:space-between; align-items:center;">
            <h2 id="paymentTitle"><i class="fas fa-wallet"></i> Thanh toán</h2>
            <button onclick="closePayment()" style="background:none; border:none; font-size:1.5rem; cursor:pointer; color:var(--text-muted);">&times;</button>
        </div>
        <div class="payment-body" style="padding:1.5rem;">
            <!-- Plan info -->
            <div style="text-align:center; padding:1.25rem; background:linear-gradient(135deg, rgba(99,102,241,0.05), rgba(139,92,246,0.08)); border-radius:var(--radius-sm); margin-bottom:1.5rem;">
                <h3 style="margin:0 0 0.25rem;" id="paymentPlanName"></h3>
                <div style="font-size:1.8rem; font-weight:800; color:var(--primary);" id="paymentAmount"></div>
            </div>

            <!-- Wallet Balance -->
            <div style="display:flex; justify-content:space-between; align-items:center; padding:1rem; background:var(--card-bg); border:1px solid var(--border-color); border-radius:var(--radius-sm); margin-bottom:1rem;">
                <div>
                    <span style="color:var(--text-muted); font-size:0.85rem;"><i class="fas fa-wallet"></i> Số dư ví</span>
                    <div style="font-size:1.2rem; font-weight:700;" id="walletBalanceDisplay"><?= number_format($user['balance'] ?? 0) ?>đ</div>
                </div>
                <div id="balanceStatus"></div>
            </div>

            <!-- Action area -->
            <div id="paymentAction"></div>

            <!-- Divider -->
            <div style="margin:1.5rem 0; padding-top:1.25rem; border-top:1px solid var(--border-color);">
                <h4 style="margin-bottom:0.75rem;"><i class="fas fa-key"></i> Có mã kích hoạt?</h4>
                <div class="activation-form">
                    <input type="text" id="modalActivationCode" placeholder="Nhập mã kích hoạt" class="input-lg" autocomplete="off">
                    <button class="btn btn-primary btn-lg" onclick="activateFromModal()">
                        <i class="fas fa-bolt"></i> Kích hoạt
                    </button>
                </div>
                <div id="modalResult" style="margin-top:0.5rem;"></div>
            </div>
        </div>
    </div>
</div>

<script>
let selectedPlanId = null;
let selectedPlanPrice = 0;
const userBalance = <?= intval($user['balance'] ?? 0) ?>;

function escapeHtml(str) {
    const div = document.createElement('div');
    div.textContent = str;
    return div.innerHTML;
}

function showPayment(planId, planName, price) {
    selectedPlanId = planId;
    selectedPlanPrice = price;
    document.getElementById('paymentPlanName').textContent = planName;
    document.getElementById('paymentAmount').textContent = new Intl.NumberFormat('vi-VN').format(price) + ' VNĐ';
    
    const actionEl = document.getElementById('paymentAction');
    const statusEl = document.getElementById('balanceStatus');
    
    if (userBalance >= price) {
        statusEl.innerHTML = '<span style="background:#dcfce7; color:#16a34a; padding:4px 12px; border-radius:20px; font-size:0.8rem; font-weight:600;"><i class="fas fa-check-circle"></i> Đủ tiền</span>';
        const remaining = userBalance - price;
        actionEl.innerHTML = `
            <div style="text-align:center; margin-bottom:0.75rem; font-size:0.85rem; color:var(--text-muted);">
                Sau khi mua, số dư còn lại: <strong>${new Intl.NumberFormat('vi-VN').format(remaining)}đ</strong>
            </div>
            <button class="btn btn-primary btn-lg" style="width:100%; padding:14px; font-size:1rem;" id="buyBtn" onclick="buyWithWallet()">
                <i class="fas fa-shopping-cart"></i> Thanh toán bằng ví
            </button>
            <div id="buyResult" style="margin-top:0.75rem;"></div>
        `;
    } else {
        const shortage = price - userBalance;
        statusEl.innerHTML = '<span style="background:#fef2f2; color:#ef4444; padding:4px 12px; border-radius:20px; font-size:0.8rem; font-weight:600;"><i class="fas fa-times-circle"></i> Thiếu tiền</span>';
        actionEl.innerHTML = `
            <div style="text-align:center; padding:1rem; background:#fef3c7; border-radius:var(--radius-sm); margin-bottom:0.75rem;">
                <p style="margin:0; color:#92400e; font-size:0.9rem;">
                    <i class="fas fa-exclamation-triangle"></i> Ví không đủ. Cần nạp thêm <strong>${new Intl.NumberFormat('vi-VN').format(shortage)}đ</strong>
                </p>
            </div>
            <a href="<?= BASE_URL ?>/wallet/deposit" class="btn btn-primary btn-lg" style="width:100%; padding:14px; font-size:1rem; text-decoration:none; display:block; text-align:center;">
                <i class="fas fa-plus-circle"></i> Nạp tiền vào ví
            </a>
        `;
    }
    
    document.getElementById('paymentModal').classList.add('active');
}

function closePayment() {
    document.getElementById('paymentModal').classList.remove('active');
}

function buyWithWallet() {
    const btn = document.getElementById('buyBtn');
    const resultEl = document.getElementById('buyResult');
    
    if (!confirm('Xác nhận thanh toán ' + new Intl.NumberFormat('vi-VN').format(selectedPlanPrice) + 'đ từ ví?')) return;
    
    btn.disabled = true;
    btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
    
    fetch('<?= BASE_URL ?>/membership/createOrder', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'same-origin',
        body: JSON.stringify({ plan_id: selectedPlanId })
    })
    .then(r => r.json())
    .then(data => {
        if (data.success) {
            resultEl.innerHTML = `
                <div style="background:rgba(67,233,123,0.1); border:1px solid var(--success); border-radius:var(--radius-sm); padding:1.5rem; text-align:center;">
                    <i class="fas fa-crown fa-3x" style="color:#f59e0b; margin-bottom:0.75rem;"></i>
                    <h3 style="margin:0 0 0.5rem; color:var(--success);">${escapeHtml(data.message)}</h3>
                    <p style="color:var(--text-muted);">Hết hạn: ${escapeHtml(data.expired_at)}</p>
                    <p style="color:var(--text-muted); font-size:0.85rem;">Số dư ví còn: ${new Intl.NumberFormat('vi-VN').format(data.new_balance)}đ</p>
                    <button class="btn btn-primary" onclick="location.reload()" style="margin-top:0.75rem;">
                        <i class="fas fa-crown"></i> Bắt đầu dùng Pro
                    </button>
                </div>
            `;
            btn.style.display = 'none';
        } else {
            if (data.need_deposit) {
                resultEl.innerHTML = `
                    <div style="color:var(--error); margin-bottom:0.5rem;"><i class="fas fa-exclamation-circle"></i> <span>${escapeHtml(data.error)}</span></div>
                    <a href="<?= BASE_URL ?>/wallet/deposit" class="btn btn-outline" style="width:100%; text-decoration:none; display:block; text-align:center;">
                        <i class="fas fa-plus-circle"></i> Nạp tiền ngay
                    </a>
                `;
            } else {
                resultEl.innerHTML = '<div style="color:var(--error);"><i class="fas fa-exclamation-circle"></i> <span>' + escapeHtml(data.error) + '</span></div>';
            }
            btn.disabled = false;
            btn.innerHTML = '<i class="fas fa-shopping-cart"></i> Thanh toán bằng ví';
        }
    })
    .catch(err => {
        resultEl.innerHTML = '<div style="color:var(--error);"><i class="fas fa-exclamation-circle"></i> Lỗi kết nối.</div>';
        btn.disabled = false;
        btn.innerHTML = '<i class="fas fa-shopping-cart"></i> Thanh toán bằng ví';
    });
}

function showToast(msg) {
    const toast = document.createElement('div');
    toast.style.cssText = 'position:fixed; bottom:20px; left:50%; transform:translateX(-50%); background:#333; color:#fff; padding:10px 24px; border-radius:8px; z-index:99999; font-size:0.9rem;';
    toast.innerHTML = '<i class="fas fa-check-circle" style="color:#43e97b; margin-right:6px;"></i><span></span>';
    toast.querySelector('span').textContent = msg;
    document.body.appendChild(toast);
    setTimeout(() => { toast.style.opacity = '0'; toast.style.transition = 'opacity 0.3s'; }, 2000);
    setTimeout(() => toast.remove(), 2500);
}

function activateCode() {
    const code = document.getElementById('activationCode').value.trim();
    if (!code) { alert('Vui lòng nhập mã kích hoạt.'); return; }
    doActivate(code, 'activationResult', 'activateBtn');
}

function activateFromModal() {
    const code = document.getElementById('modalActivationCode').value.trim();
    if (!code) { alert('Vui lòng nhập mã kích hoạt.'); return; }
    doActivate(code, 'modalResult');
}

function doActivate(code, resultId, btnId) {
    const resultEl = document.getElementById(resultId);
    resultEl.innerHTML = '<div style="color:var(--text-muted);"><i class="fas fa-spinner fa-spin"></i> Đang xử lý...</div>';

    if (btnId) document.getElementById(btnId).disabled = true;

    fetch('<?= BASE_URL ?>/membership/activate', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'same-origin',
        body: JSON.stringify({ code: code })
    })
    .then(r => r.json())
    .then(data => {
        if (data.success) {
            resultEl.innerHTML = `
                <div style="background:rgba(67,233,123,0.1); border:1px solid var(--success); border-radius:var(--radius-sm); padding:1rem; text-align:center;">
                    <i class="fas fa-check-circle fa-2x" style="color:var(--success);"></i>
                    <h4 style="margin:0.5rem 0;">${escapeHtml(data.message)}</h4>
                    <p>Hết hạn: ${escapeHtml(data.expired_at)}</p>
                    <button class="btn btn-primary" onclick="location.reload()" style="margin-top:0.5rem;">
                        <i class="fas fa-sync"></i> Tải lại trang
                    </button>
                </div>
            `;
        } else {
            resultEl.innerHTML = '<div style="color:var(--error);"><i class="fas fa-exclamation-circle"></i> <span>' + escapeHtml(data.error) + '</span></div>';
        }
        if (btnId) document.getElementById(btnId).disabled = false;
    })
    .catch(err => {
        resultEl.innerHTML = '<div style="color:var(--error);"><i class="fas fa-exclamation-circle"></i> Lỗi kết nối.</div>';
        if (btnId) document.getElementById(btnId).disabled = false;
    });
}
</script>
