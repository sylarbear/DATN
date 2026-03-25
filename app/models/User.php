<?php
/**
 * User Model
 * Quản lý người dùng
 */
class User extends Model {
    protected $table = 'users';

    /**
     * Đăng ký user mới
     * @param array $data
     * @return int User ID
     */
    public function register($data) {
        return $this->create([
            'username'      => $data['username'],
            'email'         => $data['email'],
            'password_hash' => password_hash($data['password'], PASSWORD_DEFAULT),
            'full_name'     => $data['full_name'] ?? null
        ]);
    }

    /**
     * Xác thực đăng nhập
     * @param string $username
     * @param string $password
     * @return array|false User data hoặc false
     */
    public function authenticate($username, $password) {
        $user = $this->findBy('username', $username);
        
        if ($user && password_verify($password, $user['password_hash'])) {
            return $user;
        }
        
        // Thử tìm bằng email
        $user = $this->findBy('email', $username);
        if ($user && password_verify($password, $user['password_hash'])) {
            return $user;
        }
        
        return false;
    }

    /**
     * Kiểm tra username đã tồn tại
     * @param string $username
     * @return bool
     */
    public function usernameExists($username) {
        return $this->findBy('username', $username) !== false;
    }

    /**
     * Kiểm tra email đã tồn tại
     * @param string $email
     * @return bool
     */
    public function emailExists($email) {
        return $this->findBy('email', $email) !== false;
    }

    /**
     * Cập nhật profile
     * @param int $id
     * @param array $data
     * @return bool
     */
    public function updateProfile($id, $data) {
        $updateData = [];
        if (isset($data['full_name'])) $updateData['full_name'] = $data['full_name'];
        if (isset($data['email'])) $updateData['email'] = $data['email'];
        if (isset($data['avatar'])) $updateData['avatar'] = $data['avatar'];
        
        return $this->update($id, $updateData);
    }

    /**
     * Đổi mật khẩu
     * @param int $id
     * @param string $newPassword
     * @return bool
     */
    public function changePassword($id, $newPassword) {
        return $this->update($id, [
            'password_hash' => password_hash($newPassword, PASSWORD_DEFAULT)
        ]);
    }
}
