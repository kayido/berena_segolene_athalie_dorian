<?php
session_start();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Chef's Corner</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<?php if(isset($_SESSION["role"])){
            if($_SESSION["role"] == "admin"){
                require "header_admin.php"; 
            }else{
                if(isset($_SESSION["user_id"])){
                    require "header_login.php";
                }else{
                    require "header_logout.php";
                }
            }    
        }else{
            if(isset($_SESSION["user_id"])){
                require "header_login.php";
            }else{
                require "header_logout.php";
            }
        } ?>

    <main class="auth-page">
        <div class="auth-container">
            <div class="auth-tabs">
                <button class="tab-btn active" data-tab="login">Connexion</button>
                <button class="tab-btn" data-tab="register">Inscription</button>
            </div>

            <div class="auth-content">
                <form id="login-form" class="auth-form active">
                    <h2>Connectez-vous</h2>
                    <input type="hidden" name="action" value="login">
                    <div class="form-group">
                        <label for="login-email">Email:</label>
                        <input type="email" id="login-email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="login-password">Mot de passe:</label>
                        <input type="password" id="login-password" name="password" required>
                    </div>
                    <button type="submit" class="btn">Se connecter</button>
                </form>
                
                <form id="register-form" class="auth-form" action="">
                    <h2>Créez un compte</h2>
                    <input type="hidden" name="action" value="register">
                    <div class="form-group">
                        <label for="register-email">Email:</label>
                        <input type="email" id="register-email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="register-password">Mot de passe:</label>
                        <input type="password" id="register-password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="register-confirm-password">Confirmez le mot de passe:</label>
                        <input type="password" id="register-confirm-password" name="confirmPassword" required>
                    </div>
                    <button type="submit" class="btn">S'inscrire</button>
                </form>

                
                <div id="message" class="form-message" style="display:none; margin-top:15px; font-weight:bold;"></div>

            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2023 Chef's Corner. Tous droits réservés.</p>
        </div>
    </footer>

    <script src="script.js"></script>
</body>
</html>
