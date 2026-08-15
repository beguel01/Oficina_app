<?php
session_start();

if (!isset($_SESSION['usuario_id']) || !in_array($_SESSION['usuario_cargo'], ['dono', 'gerente'])) {
    header("Location: /login");
    exit;
}

$mensagem = '';
$tipo_mensagem = '';
$email = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    require __DIR__ . '/../config/database.php';

    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';
    $check_password = $_POST['check_password'] ?? '';

    if (empty($email) && empty($password) && empty($check_password)) {
        $tipo_mensagem = "erro";
        $mensagem = "Preencha todos os campos obrigatórios!";
    } elseif (empty($email)) {
        $tipo_mensagem = "erro";
        $mensagem = "Preencha o campo de email!";
    } elseif (empty($password)) {
        $tipo_mensagem = "erro";
        $mensagem = "Preencha o campo de senha";
    } elseif (empty($check_password)) {
        $tipo_mensagem = "erro";
        $mensagem = " Preencha o campo de confirmação de senha!";
    } elseif ($check_password != $password) {
        $tipo_mensagem = "erro";
        $mensagem = "As senhas não coincidem!";
    } else {
        $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE email = :email");
        $stmt->execute(['email' => $email]);
        $usuario_existente = $stmt->fetch();

        if ($usuario_existente) {
            $tipo_mensagem = "erro";
            $mensagem = "Este email já existe!";
        } else {
            $password_hash = password_hash($password, PASSWORD_DEFAULT);

            if ($_SESSION['usuario_cargo'] === 'dono') {
                $cargo_novo_usuario = $_POST['cargo'] ?? 'funcionario';
            } else {
                $cargo_novo_usuario = 'funcionario';
            }

            $stmt = $pdo->prepare("INSERT INTO usuarios (email, senha, cargo) VALUES (:email, :senha, :cargo)");
            $stmt->execute(['email' => $email, 'senha' => $password_hash, 'cargo' => $cargo_novo_usuario]);
            header("Location: /login");
            exit;
        }
    }
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
        <form class="form" action="/cadastro" method="POST">
            <h1>Sign In</h1>

            <?php if (!empty($mensagem)): ?>
                <p class="mensagem mensagem-<?= $tipo_mensagem ?>"><?= $mensagem ?></p>
            <?php endif; ?>

            <label for="email">E-mail</label>
            <input type="email" name="email" placeholder="exemplo123@email.com" value="<?= htmlspecialchars($email) ?>">
            <label for="password">Senha</label>
            <input type="password" name="password" placeholder="********">
            <label for="password">Confirmar Senha</label>
            <input type="password" name="check_password" placeholder="********">

            <?php
            if ($_SESSION['usuario_cargo'] === 'dono') :
            ?>
                <label for="cargo">Cargo</label>
                <select name="cargo">
                    <option value="funcionario">Funcionario</option>
                    <option value="gerente">Gerente</option>
                </select>
            <?php endif; ?>

            <a href="/login">Já tenho uma conta</a>
            <button type="submit">Entrar</button>
        </form>
    </div>
</body>

</html>