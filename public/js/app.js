/**
 * app.js - Global JavaScript
 * Xử lý navigation, dropdown, flash messages
 */

document.addEventListener('DOMContentLoaded', function() {
    // === Mobile Navigation Toggle ===
    const navToggle = document.getElementById('navToggle');
    const navMenu = document.getElementById('navMenu');
    
    if (navToggle) {
        navToggle.addEventListener('click', function() {
            navMenu.classList.toggle('show');
        });
    }

    // === User Dropdown ===
    const userBtn = document.getElementById('userDropdownBtn');
    const userDropdown = document.getElementById('userDropdown');
    
    if (userBtn) {
        userBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            userDropdown.classList.toggle('show');
        });

        // Đóng dropdown khi click ra ngoài
        document.addEventListener('click', function() {
            if (userDropdown) userDropdown.classList.remove('show');
        });
    }

    // === Auto-hide Flash Messages ===
    const flash = document.getElementById('flashMessage');
    if (flash) {
        setTimeout(() => {
            flash.style.animation = 'slideIn 0.4s ease reverse';
            setTimeout(() => flash.remove(), 400);
        }, 4000);
    }

    // === Smooth Scroll for anchor links ===
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });
});

/**
 * Toggle password visibility
 * @param {string} inputId 
 */
function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    const icon = input.parentElement.querySelector('.password-toggle i');
    
    if (input.type === 'password') {
        input.type = 'text';
        icon.classList.replace('fa-eye', 'fa-eye-slash');
    } else {
        input.type = 'password';
        icon.classList.replace('fa-eye-slash', 'fa-eye');
    }
}
