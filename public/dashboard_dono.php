<?php
session_start();
if (!isset($_SESSION['usuario_id']))
    {
    header("Location: /login"); 
    exit;
    }
elseif ($_SESSION['usuario_cargo'] !== 'dono')
    {
    header("Location: /login");
    exit;
    }
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/style.css">  
<title>Document</title>
</head>
<body>
<div class="page">
<h1>Seja Bem-vindo! Dono</h1>
<a href="/logout">Sair</a>
</div>
</body>
</html>