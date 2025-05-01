<?php
session_start();
require "connectBD.php";

$id = $_GET["id"];

if (isset($_POST["submit"])) {
    // Sanitize and validate input
    $numero = trim($_POST["number"]);
    $description = trim($_POST["etape"]);
    
    $stmt = mysqli_prepare($con, "INSERT INTO `etape`(`numero`, `description`, `id_recette`) VALUES (?,?,?)");
    mysqli_stmt_bind_param($stmt, "isi", $numero, $description, $id);
    
    if (mysqli_stmt_execute($stmt)) {
        echo "<script>alert('Etape rajoutée avec succès')</script>";
        header("Location: admin.php");
        exit;
    } else {
        echo "<script>alert('Un problème est survenu')</script>";
    }
}

?>

<?php
if(isset($_SESSION["role"]) && $_SESSION["role"] =="admin"){
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
if(isset($_SESSION["role"])){
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
}
?>

<main class="admin-page">
    <nav>
        <ul>
            <li><a href="edit_recipes.php?id=<?=$id?>">aperçu</a></li>
            <li><a href="ustensiles.php?id=<?=$id?>">Ustensile</a></li>
            <li><a href="ingredients.php?id=<?=$id?>">Ingredient</a></li>
            <li><a href="etapes.php?id=<?=$id?>" class="active">Etape</a></li>
        </ul>
    </nav>
    <div id="recipe-modal" class="modal">
        <div class="modal-content">
            <form class="add-etapes" method="post">
                <div>
                    <label>Numero de l'étape</label>
                    <input type="number" name="number">
                </div>
                <div>
                    <label>Description de l'étape</label>
                    <textarea name="etape"></textarea>
                </div>
                <div class="form-actions">
                <button type="submit" class="btn btn-primary" name="submit">Enregistrer</button>
                <button type="reset" class="btn btn-secondary close-btn">Annuler</button>
            </div>
            </form>
            
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

<?php
}else{
    header("location: index.php");
}
?>

