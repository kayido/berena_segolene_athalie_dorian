<?php
$Con = mysqli_connect("localhost", "root", "", "recettes_db");

if (!$Con) {
    die("Erreur de connexion à la base de données");
}

$search = $_GET['search'];

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
        require 'header_logout.php';
    ?>
    </header>

    <main class="catalogue">
        <div class="recipes-container">
                <?php
                foreach( $data as $recipe){ ?>
                <a href="details.php?id=<?=$recipe["id_recette"]?>"><div class="recipe-card">
                    <img src="<?= $recipe["image"] ?>" loading="lazy" alt="">
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