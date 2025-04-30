<?php 
session_start();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chef's Corner - Découvrez des recettes délicieuses</title>
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
        }?>

    <main class="homepage">
        <div class="hero">
            <div class="search-container">
                <h2>Découvrez des recettes exceptionnelles</h2>
                <form id="search-form" method="GET" action="result.php">
                    <input type="text" id="search-input" placeholder="Rechercher une recette...">
                    <button type="submit"><i class="fas fa-search"></i></button>
                </form>
            </div>
        </div>

        <section class="featured-recipes">
            <h2>Recettes populaires</h2>
            <div class="recipes-grid" id="featured-recipes">
                <!-- Les recettes populaires seront chargées ici via JavaScript -->
            </div>
        </section>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2023 Chef's Corner. Tous droits réservés.</p>
        </div>
    </footer>

    <script src="script.js"></script>
</body>
</html>