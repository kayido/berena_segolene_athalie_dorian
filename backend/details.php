<?php
session_start();
if($_SESSION["role"] == "admin"){
    require "header_admin.php"; 
}else{
    if(isset($_SESSION["user_id"])){
        require "header_login.php";
    }else{
        require "header_logout.php";
    }
}


$id = $_GET["id"];


$req = "SELECT * FROM recette WHERE id_recette = ?";
$stmt = mysqli_prepare($con, $req);
mysqli_stmt_bind_param($stmt, "i", $id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$recette = mysqli_fetch_assoc($result);


// Prepare the SQL query
$query = "SELECT r.*, e.description AS etape_desc, i.nom AS ingredient_nom, u.nom AS ustensil_nom 
          FROM recette r 
          JOIN etape e ON e.id_recette = r.id_recette 
          JOIN ingredient_recette ir ON r.id_recette = ir.id_recette  
          JOIN ingredient i ON ir.id_ingredient = i.id_ingredient
          JOIN ustensil_recette ru ON ru.id_recette = r.id_recette 
          JOIN ustensil u ON u.id_ustensil = ru.id_ustensil 
          WHERE r.id_recette = ?";

$stmt = mysqli_prepare($con, $query);
mysqli_stmt_bind_param($stmt, "i", $id);

// Execute the statement
mysqli_stmt_execute($stmt);

// Get the result
$result = mysqli_stmt_get_result($stmt);

if ($result) {
    // Fetch the recipe data
    // Fetch steps
    $steps = [];
    while ($recipe = mysqli_fetch_assoc($result)){
        if(!in_array($recipe["etape_desc"],$steps)){
            $steps[] = $recipe['etape_desc'];
        }
    }
    
    // Reset the result pointer
    mysqli_data_seek($result, 0);
    
    // Fetch ingredients
    $ingredients = [];
    while ($ingredient = mysqli_fetch_assoc($result)) {
        if(!in_array($ingredient['ingredient_nom'],$ingredients)){
             $ingredients[] = $ingredient['ingredient_nom'];
        }
       
    }

    // Reset for utensils
    mysqli_data_seek($result, 0);
    
    // Fetch utensils
    $utensils = [];
    while ($utensil = mysqli_fetch_assoc($result)) {
        if(!in_array($utensil['ustensil_nom'],$utensils)){
            $utensils[] = $utensil['ustensil_nom'];
        } 
    }
} else {
    echo "<p>Aucune recette trouvée.</p>";
}
// Close the statement
mysqli_stmt_close($stmt);


if (isset($_POST["commenter"])){

    if(isset($_SESSION["user_id"])){
        // Sanitize and validate input
    
        $note = (int)$_POST["note"];
        $commentaire = trim($_POST["commentaire"]);
    
        // Basic validation
        if(empty(empty($note) || empty($commentaire))) {
            echo "<script>alert('Tous les champs sont requis.')</script>";
            exit;
        }
    
        // Prepare the SQL query
        $query = "INSERT INTO `rating`(`note`, `commentaire`, `id_user`, `id_recette`) VALUES (?,?,?,?)";
        $stmt = mysqli_prepare($con, $query);
        
        // Bind parameters
        $user = $_SESSION["user_id"];
    
        mysqli_stmt_bind_param($stmt, "isii", $note, $commentaire, $user, $id);
    
        // Execute the statement
        if (mysqli_stmt_execute($stmt)) {
            echo "<script>alert('Avis soumis avec succès!')</script>";
            // Optionally redirect or clear the form here
        } else {
            echo "<script>alert('Erreur lors de la soumission de l'avis.')</script>";
        }
    
        // Close the statement
        mysqli_stmt_close($stmt);
    }else{
        echo "<script>alert('Vous devez vous authentifier pour commenter.')</script>";
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
    <main class="admin-page">
        
        <!-- Modal pour ajouter/modifier une recette -->
        <main class="recipe-detail">
            <div class="recipe-header">
                <div class="recipe-image">
                    <img id="recipe-image" src="<?= $recette["image"]?> " alt="Image de la recette">
                </div>
                <div class="recipe-info">
                    <h1 id="recipe-title">Nom de la recette</h1>
                    <div class="meta">
                        <span id="recipe-time"><i class="far fa-clock"></i><?= $recette["tmp_preparation"] ?> Temps de préparation</span>
                        <span id="recipe-servings"><i class="fas fa-users"></i><?= $recette["nbr_personne"] ?> Nombre de personnes</span>
                        <span id="recipe-country"><i class="fas fa-globe"></i> Pays : <?= $recette["origine"] ?></span>
                        <!-- <span id="recipe-category"><i class="fas fa-tag"></i> Catégorie</span> -->
                    </div>
                </div>
            </div>
    
            <div class="recipe-content">
                <div class="ingredients">
                    <h2>Ingrédients</h2>
                    <ul id="ingredients-list-admin">
                        
                        <?php foreach ($ingredients as $ingredient) {
                            ?>
                            <li>
                                <div><?=htmlspecialchars($ingredient)?></div>
                            </li>
                        <?php } ?>
                    </ul>
                </div>
    
                <div class="utensils">
                    <h2>Ustensiles</h2>
                    <ul id="utensils-list-admin">
                        <?php foreach ($utensils as $utensil) {
                            ?>
                            <li>
                                <div><?=htmlspecialchars($utensil)?></div>
                            </li>
                        <?php } ?>
                    </ul>
                </div>
    
                <div class="steps">
                    <h2>Étapes de préparation</h2>
                    <ol id="steps-list-admin">                
                    <?php foreach ($steps as $step) {
                        ?>
                        <li>
                            <div><?=$step?></div> 
                        </li>
                    <?php } ?>
                    </ol>
                </div>
            </div>
            <div class="reviews">
                <h2>Avis des utilisateurs</h2>
                <div class="reviews-list" id="reviews-list">
                    <div class="review-card">aaaaaaaaaaaaaa</div>
                </div>

                <div class="add-review">
                    <h3>Donnez votre avis</h3>
                    <form id="review-form" method="post">
                        <div class="form-group">
                            <label for="review-name">Nom:</label>
                            <input type="text" id="review-name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="review-rating">Note:</label>
                            <select id="review-rating" name="note" required>
                                <option value="">Sélectionnez une note</option>
                                <option value="5">5 - Excellent</option>
                                <option value="4">4 - Très bon</option>
                                <option value="3">3 - Bon</option>
                                <option value="2">2 - Médiocre</option>
                                <option value="1">1 - Mauvais</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="review-comment">Commentaire:</label>
                            <textarea id="review-comment" rows="4" name="commentaire" required></textarea>
                        </div>
                        <button type="submit" class="btn" name="commenter">Soumettre</button>
                    </form>
                </div>
            </div>
        </main>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2023 Chef's Corner. Tous droits réservés.</p>
        </div>
    </footer>

    <script src="script.js"></script>
</body>
</html>

<?php

// Close the database connection
mysqli_close($con);

