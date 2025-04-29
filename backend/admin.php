<?php

require "connectBD.php";
$query = "select * from recette";
$req = mysqli_query($con,$query);
$data = [];
while ($row = mysqli_fetch_assoc($req)){
    $data[] = $row;
}

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administration - Chef's Corner</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <?php

        require 'header_admin.php';
    ?>

    <main class="admin-page">
        <div class="admin-actions">
            <button id="add-recipe-btn" class="btn btn-primary"><i class="fas fa-plus"></i><a href="add_recipes.html">Ajouter une recette</a> </button>
        </div>

        <div class="admin-recipes">
            <h2>Gestion des recettes</h2>
            <div class="recipes-list" id="admin-recipes-list">
                
            <?php
                foreach($data as $recette){
            ?>
                <div class = 'admin-recipe-card'>
                    <div class="admin-recipe-info">
                        <h3><?= $recette["nom"] ?></h3>
                        <p>'Entrée'</p>
                    </div>
                    <div class="admin-recipe-actions">
                        <button class="btn btn-small edit-btn" data-id="${recipe.id}"><a href="edit_recipes?id=<?=$recette["id_recette"]?>"><i class="fas fa-edit"></i></a></button>
                        <button class="btn btn-small delete-btn" data-id="${recipe.id}"><i class="fas fa-trash"></i></button>
                    </div>
                </div>

                <?php
                }
                ?>
            
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

