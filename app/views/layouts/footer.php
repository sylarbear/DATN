    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <h3><i class="fas fa-graduation-cap"></i> <?= APP_NAME ?></h3>
                    <p>Hệ thống học tiếng Anh trực tuyến theo chủ đề, tích hợp đánh giá kỹ năng nói bằng AI.</p>
                </div>
                <div class="footer-links">
                    <h4>Liên kết</h4>
                    <ul>
                        <li><a href="<?= BASE_URL ?>/topic">Chủ đề học</a></li>
                        <li><a href="<?= BASE_URL ?>/test">Bài kiểm tra</a></li>
                        <li><a href="<?= BASE_URL ?>/speaking">Luyện nói</a></li>
                    </ul>
                </div>
                <div class="footer-links">
                    <h4>Hỗ trợ</h4>
                    <ul>
                        <li><a href="#">Hướng dẫn sử dụng</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Liên hệ</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; <?= date('Y') ?> <?= APP_NAME ?>. Đồ án tốt nghiệp.</p>
            </div>
        </div>
    </footer>

    <!-- Global JS -->
    <script src="<?= BASE_URL ?>/js/app.js"></script>
</body>
</html>
