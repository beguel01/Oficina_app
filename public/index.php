<?php

$uri = $_SERVER['REQUEST_URI'];
$path = parse_url($uri, PHP_URL_PATH);

$rotas = [
    '/login' => 'login.php',
    '/cadastro' => 'cadastro.php',
    '/logout' => 'logout.php',
    '/dashboard/dono' => 'dashboard_dono.php',
    '/dashboard/gerente' => 'dashboard_gerente.php',
    '/dashboard/funcionario' => 'dashboard_funcionario.php',
];

if (isset($rotas[$path])) {
    require __DIR__ . '/' . $rotas[$path];
} else {
    http_response_code(404);
    echo "Página não encontrada";
}