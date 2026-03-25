<?php
/**
 * App - Router & Dispatcher
 * Phân tích URL và gọi Controller/Method tương ứng
 * 
 * URL format: /controller/method/param1/param2
 */
class App {
    protected $controller = DEFAULT_CONTROLLER . 'Controller';
    protected $method = DEFAULT_METHOD;
    protected $params = [];

    public function __construct() {
        $url = $this->parseUrl();

        // Xác định Controller
        $controllerName = !empty($url[0]) ? ucfirst(strtolower($url[0])) : DEFAULT_CONTROLLER;
        $controllerFile = APP_PATH . "/controllers/{$controllerName}Controller.php";

        if (file_exists($controllerFile)) {
            $this->controller = $controllerName . 'Controller';
            unset($url[0]);
        } else {
            // Controller không tồn tại → 404
            $this->controller = DEFAULT_CONTROLLER . 'Controller';
        }

        // Load controller
        require_once APP_PATH . "/controllers/{$this->controller}.php";
        $this->controller = new $this->controller;

        // Xác định Method
        if (isset($url[1]) && method_exists($this->controller, $url[1])) {
            $this->method = $url[1];
            unset($url[1]);
        }

        // Lấy params còn lại
        $this->params = $url ? array_values($url) : [];

        // Gọi controller->method(params)
        call_user_func_array([$this->controller, $this->method], $this->params);
    }

    /**
     * Phân tích URL thành mảng
     * @return array
     */
    protected function parseUrl() {
        if (isset($_GET['url'])) {
            return explode('/', filter_var(rtrim($_GET['url'], '/'), FILTER_SANITIZE_URL));
        }
        return [];
    }
}
