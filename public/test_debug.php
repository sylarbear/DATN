<?php
/**
 * Test script to debug the test submission endpoint
 * Run: Open http://localhost/DATN/public/test/submit in browser after login
 */

// Simulate the same environment as index.php
define('BASE_PATH', dirname(__DIR__));
define('APP_PATH', BASE_PATH . '/app');

// Load config
require_once APP_PATH . '/config/app.php';
require_once APP_PATH . '/config/database.php';

// Test 1: Check if database connection works
echo "<h2>Test 1: Database Connection</h2>";
try {
    $db = getDB();
    echo "<p style='color:green'>✅ Database connected OK</p>";
} catch (Exception $e) {
    echo "<p style='color:red'>❌ Database error: " . $e->getMessage() . "</p>";
}

// Test 2: Check if test exists
echo "<h2>Test 2: Check Test ID=1</h2>";
$stmt = $db->prepare("SELECT * FROM tests WHERE id = 1");
$stmt->execute();
$test = $stmt->fetch(PDO::FETCH_ASSOC);
echo $test ? "<p style='color:green'>✅ Test found: " . $test['title'] . "</p>" : "<p style='color:red'>❌ Test not found</p>";

// Test 3: Check questions
echo "<h2>Test 3: Check Questions for Test 1</h2>";
$stmt = $db->prepare("SELECT id, question_text, correct_answer FROM questions WHERE test_id = 1");
$stmt->execute();
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo "<p>Found " . count($questions) . " questions</p>";
foreach ($questions as $q) {
    echo "<p>Q{$q['id']}: {$q['question_text']} → Answer: {$q['correct_answer']}</p>";
}

// Test 4: Simulate submitTest
echo "<h2>Test 4: Simulate Submit</h2>";
echo "<p>Simulating submit with answers...</p>";

$answers = [];
foreach ($questions as $q) {
    $answers[$q['id']] = $q['correct_answer']; // Answer correctly
}

// Check if UserAnswer model works
require_once APP_PATH . '/core/Model.php';
require_once APP_PATH . '/models/UserAnswer.php';

$userAnswerModel = new UserAnswer();

// Check users
$stmt = $db->prepare("SELECT id, username FROM users LIMIT 5");
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo "<p>Users: </p><pre>" . print_r($users, true) . "</pre>";

$userId = $users[0]['id'] ?? 1;
echo "<p>Using user_id = $userId</p>";

try {
    $result = $userAnswerModel->submitTest($userId, 1, $answers, 60);
    echo "<p style='color:green'>✅ Submit OK!</p>";
    echo "<pre>" . print_r($result, true) . "</pre>";
} catch (Exception $e) {
    echo "<p style='color:red'>❌ Submit error: " . $e->getMessage() . "</p>";
    echo "<pre>" . $e->getTraceAsString() . "</pre>";
}

// Test 5: Check routing
echo "<h2>Test 5: URL Routing Check</h2>";
echo "<p>BASE_URL = " . BASE_URL . "</p>";
echo "<p>Submit endpoint = " . BASE_URL . "/test/submit</p>";
echo "<p>The JS fetch should POST JSON to this URL</p>";

echo "<h2>Test 6: JS Test</h2>";
echo "<p>Open browser console on the test page and run:</p>";
echo "<pre>fetch('" . BASE_URL . "/test/submit', {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify({test_id: 1, answers: {}, time_spent: 10})
}).then(r => r.text()).then(t => console.log('Response:', t)).catch(e => console.error('Error:', e))</pre>";
