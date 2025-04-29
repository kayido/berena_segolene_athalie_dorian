<?php

session_start();

$Con = mysqli_connect("localhost", "root", "", "recettes_db");

if (!$Con) {
    die("Erreur de connexion à la base de données");
}

$search = $_GET['query'] ?? '';

$Query = "SELECT * FROM recette WHERE nom LIKE '%$search%'";
$req = mysqli_query($Con, $Query);
$data  = array();
while ($row = mysqli_fetch_assoc($req)) {
    $data[]  = $row;
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogue de recettes - Chef's Corner</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <?php 
        if($_SESSION["role"] == "admin"){
            require "header_admin.php"; 
        }else{
            if(isset($_SESSION["user_id"])){
                require "header_login.php";
            }else{
                require "header_logout.php";
            }
        }     
    ?>

    <main class="catalogue">
        <div class="filters">
            <h2>Filtrer les recettes</h2>
            <form id="filter-form">
                <div class="form-group">
                    <label for="country">Pays:</label>
                    <select id="country" name="country">
                        <option value="">Tous les pays</option>
                        <option value="france">France</option>
                        <option value="italie">Italie</option>
                        <option value="asie">Asie</option>
                        <option value="mexique">Mexique</option>
                        <option value="usa">États-Unis</option>
                    </select>
                </div>
                <button type="submit" class="btn">Filtrer</button>
            </form>
        </div>

        <div class="recipes-container">
            <div class="recipes-grid" id="all-recipes">
            <?php
                foreach( $data as $recipe){ ?>
                <a href="details.php?id=<?=$recipe["id_recette"]?>"><div class="recipe-card">
                    <img src="<?= $recipe["image"] ?>" alt="">
                    <div class="recipe-card-info">
                        <h3><?= $recipe["nom"] ?></h3>
                        <p>Plat Amer</p>
                        <div class="recipe-meta">
                            <span><i class="far fa-clock"></i><?= $recipe["tmp_preparation"] ?> min</span>
                            <span><i class="fas fa-users"></i> <?= $recipe["nbr_personne"] ?> pers.</span>
                        </div>
                    </div>
                </div></a>
                <?php } ?>
            </div>
            <div class="pagination" id="pagination">
                <!-- La pagination sera générée ici via JavaScript -->
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