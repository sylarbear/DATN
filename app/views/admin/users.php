<!-- Admin Users Management -->
<section class="page-header">
    <div class="container">
        <h1><i class="fas fa-users"></i> Quản lý Users</h1>
    </div>
</section>

<section style="padding:1rem 0; border-bottom:1px solid var(--border-color); background:white;">
    <div class="container">
        <div class="admin-nav">
            <a href="<?= BASE_URL ?>/admin" class="admin-nav-item"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="<?= BASE_URL ?>/admin/users" class="admin-nav-item active"><i class="fas fa-users"></i> Users</a>
            <a href="<?= BASE_URL ?>/admin/topics" class="admin-nav-item"><i class="fas fa-book"></i> Chủ đề</a>
            <a href="<?= BASE_URL ?>/admin/questions" class="admin-nav-item"><i class="fas fa-question-circle"></i> Câu hỏi</a>
            <a href="<?= BASE_URL ?>/admin/codes" class="admin-nav-item"><i class="fas fa-key"></i> Mã kích hoạt</a>
        </div>
    </div>
</section>

<section class="dashboard-section">
    <div class="container">
        <!-- Search -->
        <div class="section-card" style="margin-bottom:1rem;">
            <form method="GET" action="<?= BASE_URL ?>/admin/users" style="display:flex; gap:0.8rem;">
                <input type="text" name="search" value="<?= htmlspecialchars($search) ?>" placeholder="Tìm theo username, tên, email..." class="form-input" style="flex:1;">
                <button class="btn btn-primary"><i class="fas fa-search"></i> Tìm kiếm</button>
                <?php if ($search): ?><a href="<?= BASE_URL ?>/admin/users" class="btn btn-outline"><i class="fas fa-times"></i> Xóa lọc</a><?php endif; ?>
            </form>
        </div>

        <div class="section-card">
            <h3><i class="fas fa-list"></i> Danh sách (<?= count($users) ?> users)</h3>
            <div class="progress-table">
                <table>
                    <thead>
                        <tr><th>ID</th><th>Username</th><th>Họ tên</th><th>Email</th><th>Role</th><th>Membership</th><th>Ngày ĐK</th><th>Thao tác</th></tr>
                    </thead>
                    <tbody>
                    <?php foreach ($users as $u): ?>
                        <tr id="user-row-<?= $u['id'] ?>">
                            <td><?= $u['id'] ?></td>
                            <td><strong><?= htmlspecialchars($u['username']) ?></strong></td>
                            <td class="editable" data-field="full_name"><?= htmlspecialchars($u['full_name'] ?? '-') ?></td>
                            <td class="editable" data-field="email"><?= htmlspecialchars($u['email']) ?></td>
                            <td>
                                <select class="form-input mini-select" data-field="role" data-id="<?= $u['id'] ?>" onchange="updateUserField(this)" <?= $u['role']==='admin' ? 'disabled' : '' ?>>
                                    <option value="student" <?= $u['role']==='student'?'selected':'' ?>>Student</option>
                                    <option value="admin" <?= $u['role']==='admin'?'selected':'' ?>>Admin</option>
                                </select>
                            </td>
                            <td>
                                <select class="form-input mini-select" data-field="membership" data-id="<?= $u['id'] ?>" onchange="updateUserField(this)">
                                    <option value="free" <?= $u['membership']==='free'?'selected':'' ?>>Free</option>
                                    <option value="pro" <?= $u['membership']==='pro'?'selected':'' ?>>Pro</option>
                                </select>
                            </td>
                            <td><?= date('d/m/Y', strtotime($u['created_at'])) ?></td>
                            <td>
                                <?php if ($u['role'] !== 'admin'): ?>
                                    <button class="btn btn-sm" style="background:var(--error); color:white;" onclick="deleteUser(<?= $u['id'] ?>, '<?= htmlspecialchars($u['username']) ?>')"><i class="fas fa-trash"></i></button>
                                <?php else: ?>
                                    <span class="text-muted">—</span>
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

<script>
function updateUserField(el) {
    const id = el.dataset.id;
    const row = document.getElementById('user-row-' + id);
    const data = {
        id: id,
        full_name: row.querySelector('[data-field="full_name"]')?.textContent || '',
        email: row.querySelector('[data-field="email"]')?.textContent || '',
        role: row.querySelector('[data-field="role"]').value,
        membership: row.querySelector('[data-field="membership"]').value
    };
    fetch('<?= BASE_URL ?>/admin/updateUser', {
        method:'POST', headers:{'Content-Type':'application/json'}, credentials:'same-origin',
        body: JSON.stringify(data)
    }).then(r=>r.json()).then(d => {
        if(d.success) showToast(d.message, 'success');
        else showToast(d.error, 'error');
    });
}

function deleteUser(id, name) {
    if(!confirm('Xóa user "'+name+'"? Tất cả dữ liệu sẽ bị xóa.')) return;
    fetch('<?= BASE_URL ?>/admin/deleteUser', {
        method:'POST', headers:{'Content-Type':'application/json'}, credentials:'same-origin',
        body: JSON.stringify({id: id})
    }).then(r=>r.json()).then(d => {
        if(d.success) { document.getElementById('user-row-'+id).remove(); showToast(d.message,'success'); }
        else showToast(d.error, 'error');
    });
}

function showToast(msg, type) {
    const t = document.createElement('div');
    t.className = 'flash-message flash-' + type;
    t.innerHTML = '<div class="flash-content"><i class="fas fa-'+(type==='success'?'check':'exclamation')+'-circle"></i><span>'+msg+'</span></div>';
    document.body.appendChild(t);
    setTimeout(() => t.remove(), 3000);
}
</script>
