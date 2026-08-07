<?php
session_start();

$mensagem = '';
$tipo_mensagem = '';
$email = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //conexao com banco de dados --inicio
    $host = 'localhost';
    $db = 'oficina_app';
    $user = 'root';
    $senha_bd = 'root';

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $senha_bd);
        $pdo->setAttribute(PDO::ATTR_CASE, PDO::CASE_LOWER);
    } catch (PDOException $e) {
        die("Erro na conexão: " . $e->getMessage());
    }
    //conexao com banco de dados --final


    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';



    if (empty($email) && empty($password)) {
        $tipo_mensagem = "erro";
        $mensagem = "Preencha os campos obrigatórios!";
    } elseif (empty($email)) {
        $tipo_mensagem = "erro";
        $mensagem = "Preencha o campo de email!";
    } elseif (empty($password)) {
        $tipo_mensagem = "erro";
        $mensagem = "Preencha o campo de senha";
    } else {
        $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE email = :email");
        $stmt->execute(['email' => $email]);
        $usuario = $stmt->fetch();

        if (!$usuario) {
            $tipo_mensagem = "erro";
            $mensagem = "Email ou senha incorretos!";
        } else {
            if (password_verify($password, $usuario['senha'])) {
                $tipo_mensagem = "sucesso";
                $mensagem = "Login bem-sucedido!";
                $_SESSION['usuario_id'] = $usuario['id'];
                $_SESSION['usuario_cargo'] = $usuario['cargo'];

                $destino = match ($usuario['cargo']) {
                    'funcionario' => 'dashboard_funcionario.php',
                    'gerente' => 'dashboard_gerente.php',
                    'dono' => 'dashboard_dono.php',
                };

                header("Location: $destino");
                exit;
            } else {
                $tipo_mensagem = "erro";
                $mensagem = "Email ou senha incorretos!";
            }
        }
    }
}

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="page">
        <form class="form" action="login.php" method="POST">
            <h1>Login</h1>

            <?php if (!empty($mensagem)): ?>
                <p class="mensagem mensagem-<?= $tipo_mensagem ?>"><?= $mensagem ?></p>
            <?php endif; ?>

            <label for="email">E-mail</label>
            <input type="email" name="email" placeholder="exemplo123@email.com" value="<?= htmlspecialchars($email) ?>">
            <label for="password">Senha</label>
            <input type="password" name="password" placeholder="********">
            <label class="checkbox-wrap">
                <input type="checkbox" class="checkbox-input">
                <span class="checkbox-box"></span>
                <span class="checkbox-text">Lembrar de mim</span>
            </label>
            <a href="cadastro.php">Criar Conta</a>
            <button type="submit">Entrar</button>
        </form>
    </div>
</body>

</html>