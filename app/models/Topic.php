<?php
/**
 * Topic Model
 * Quản lý chủ đề học tập
 */
class Topic extends Model {
    protected $table = 'topics';

    /**
     * Lấy tất cả topics đang active
     * @return array
     */
    public function getActive() {
        return $this->where('is_active', 1, 'sort_order ASC');
    }

    /**
     * Tìm topic theo slug
     * @param string $slug
     * @return array|false
     */
    public function findBySlug($slug) {
        return $this->findBy('slug', $slug);
    }

    /**
     * Lấy topics theo level
     * @param string $level beginner|intermediate|advanced
     * @return array
     */
    public function getByLevel($level) {
        $stmt = $this->db->prepare(
            "SELECT * FROM {$this->table} WHERE level = :level AND is_active = 1 ORDER BY sort_order ASC"
        );
        $stmt->execute(['level' => $level]);
        return $stmt->fetchAll();
    }

    /**
     * Lấy topic kèm thống kê số lượng
     * @param int $id
     * @return array|false
     */
    public function getWithStats($id) {
        $stmt = $this->db->prepare("
            SELECT t.*,
                (SELECT COUNT(*) FROM vocabularies WHERE topic_id = t.id) as vocab_count,
                (SELECT COUNT(*) FROM lessons WHERE topic_id = t.id AND is_active = 1) as lesson_count,
                (SELECT COUNT(*) FROM tests WHERE topic_id = t.id AND is_active = 1) as test_count,
                (SELECT COUNT(*) FROM speaking_prompts WHERE topic_id = t.id) as speaking_count
            FROM {$this->table} t
            WHERE t.id = :id
        ");
        $stmt->execute(['id' => $id]);
        return $stmt->fetch();
    }

    /**
     * Lấy tất cả topics kèm thống kê
     * @return array
     */
    public function getAllWithStats() {
        $stmt = $this->db->query("
            SELECT t.*,
                (SELECT COUNT(*) FROM vocabularies WHERE topic_id = t.id) as vocab_count,
                (SELECT COUNT(*) FROM lessons WHERE topic_id = t.id AND is_active = 1) as lesson_count,
                (SELECT COUNT(*) FROM tests WHERE topic_id = t.id AND is_active = 1) as test_count,
                (SELECT COUNT(*) FROM speaking_prompts WHERE topic_id = t.id) as speaking_count
            FROM {$this->table} t
            WHERE t.is_active = 1
            ORDER BY t.sort_order ASC
        ");
        return $stmt->fetchAll();
    }
}
