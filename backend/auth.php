<?php
session_start();
require_once 'db.php'; // db.php contient : $con = mysqli_connect(...)

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $action = $_POST['action'];

    if ($action === 'register') {
        $email = trim($_POST['email']);
        $password = $_POST['password'];
        $confirmPassword = $_POST['confirmPassword'];

        if ($password !== $confirmPassword) {
            die("Les mots de passe ne correspondent pas.");
        }

        // Vérifier si l'email existe déjà
        $query = "SELECT id_user FROM utilisateur WHERE email = ?";
        $stmt = mysqli_prepare($con, $query);
        mysqli_stmt_bind_param($stmt, "s", $email);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);

        if (mysqli_stmt_num_rows($stmt) > 0) {
            die("Un compte avec cet email existe déjà.");
        }

        // Hacher le mot de passe
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Insérer le nouvel utilisateur
        $query = "INSERT INTO utilisateur (email, password, role) VALUES (?, ?, 'user')";
        $stmt = mysqli_prepare($con, $query);
        mysqli_stmt_bind_param($stmt, "ss", $email, $hashedPassword);

        if (mysqli_stmt_execute($stmt)) {
            echo "Inscription réussie. Vous pouvez maintenant vous connecter.";
        } else {
            echo "Erreur lors de l'inscription.";
        }

    } elseif ($action === 'login') {
        $email = trim($_POST['email']);
        $password = $_POST['password'];

        // Chercher l'utilisateur
        $query = "SELECT id_user, password, role FROM utilisateur WHERE email = ?";
        $stmt = mysqli_prepare($con, $query);
        mysqli_stmt_bind_param($stmt, "s", $email);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);

        if (mysqli_stmt_num_rows($stmt) === 1) {
            mysqli_stmt_bind_result($stmt, $id_user, $hashedPassword, $role);
            mysqli_stmt_fetch($stmt);

            if (password_verify($password, $hashedPassword)) {
                $_SESSION['user_id'] = $id_user;
                $_SESSION['email'] = $email;
                $_SESSION['role'] = $role;

                if ($role == 'admin') {
                    echo "success:admin";
                } else {
                    echo "success:user";
                }                
                
            } else {
                echo "Mot de passe incorrect.";
            }
        } else {
            echo "Aucun compte trouvé avec cet email.";
        }
    } else {
        echo "Action non valide.";
    }
} else {
    echo "Méthode non autorisée.";
}
?>
