<?php

require "connectBD.php";

$id = $_GET["id"] ? $_GET["id"] : 0 ;

if($id==0){
    header("location: admin.php");
}

$query = "SELECT * FROM ustensil";

$req = mysqli_query($con,$query);
$data = array();
while($row = mysqli_fetch_assoc($req)){
    $data[] = $row;
}


if(isset($_POST["submit"])){
    $components = $_POST["components"];

    foreach($components as $component){

        $query = "INSERT INTO `ustensil_recette`(`id_recette`, `id_ustensil`) VALUES (?,?)";
        $stmt = mysqli_prepare($con,$query);

        mysqli_stmt_bind_param($stmt, "ii", $component, $id );

        if (mysqli_stmt_execute($stmt)) {
            echo "<script>alert('Ustensil rajouter')</script>";
            exit;
        } else {
            echo "<script>alert('Un problème est survenu')</script>";
        }
    }
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
    <header>
        <div class="container">
            <h1>Chef's Corner - Administration</h1>
            <nav>
                <ul>
                    <li><a href="index.html">Accueil</a></li>
                    <li><a href="catalogue.html">Catalogue</a></li>
                    <li><a href="admin.html" class="active">Admin</a></li>
                    <li><a href="#" id="logout-btn">Déconnexion</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main class="admin-page">
        <nav>
            <ul>
                <li><a href="edit_recipes.php?id=<?=$id?>">aperçu</a></li>
                <li><a href="ustensiles.php?id=<?=$id?>">Ustensile</a></li>
                <li><a href="ingredients.php?id=<?=$id?>">Ingredient</a></li>
                <li><a href="etapes.php?id=<?=$id?>" class="active">Etape</a></li>
            </ul>
        </nav>
        <!-- Modal pour ajouter/modifier une recette -->
        <div id="recipe-modal" class="modal">
            <form class="modal-content" method="post">
                <div class="filter-component">
                    <input type="text" id="completion">
                </div>
                <div class="list-component">
                <?php
                foreach($data as $component){
                ?>
                <div class="component-card">
                    <p><?=$component["nom"]?></p>
                    <input type="checkbox" name="components[]" value="<?=$component["id_ustensil"]?>"> 
                </div>
                <?php } ?>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary" name="submit">Enregistrer</button>
                    <button type="button" class="btn btn-secondary close-btn">Annuler</button>
                </div>
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


