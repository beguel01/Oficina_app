<?php
$host = getenv('DB_HOST') ?: 'localhost';
$db = getenv('DB_NAME') ?: 'oficina_app';
$user = getenv('DB_USER') ?: 'root';
$senha_bd = getenv('DB_PASSWORD') ?: '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $senha_bd);
    $pdo->setAttribute(PDO::ATTR_CASE, PDO::CASE_LOWER);
} catch (PDOException $e) {
    die("Erro na conexão: " . $e->getMessage());
}