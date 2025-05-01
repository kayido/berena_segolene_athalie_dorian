<?php
session_start();
require "connectBD.php";

$id = $_GET["id"];

$req = "SELECT * FROM recette WHERE id_recette = ?";
$stmt = mysqli_prepare($con, $req);
mysqli_stmt_bind_param($stmt, "i", $id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$recette = mysqli_fetch_assoc($result);


// Prepare the SQL query
$query = "SELECT r.*,e.numero, e.id_etape, e.description AS etape_desc, i.id_ingredient as ig , i.nom AS ingredient_nom, u.nom AS ustensil_nom, u.id_ustensil AS iu 
          FROM recette r 
          JOIN etape e ON e.id_recette = r.id_recette 
          JOIN ingredient_recette ir ON r.id_recette = ir.id_recette  
          JOIN ingredient i ON ir.id_ingredient = i.id_ingredient
          JOIN ustensil_recette ru ON ru.id_recette = r.id_recette 
          JOIN ustensil u ON u.id_ustensil = ru.id_ustensil 
          WHERE r.id_recette = ?";

$stmt = mysqli_prepare($con, $query);
mysqli_stmt_bind_param($stmt, "i", $id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

if ($result) {
   
    $steps = [];
    $numbers = [];
    
    while ($recipe = mysqli_fetch_assoc($result)){        
        if(!in_array($recipe['numero'],$numbers)){
            $steps[] = $recipe['id_etape']."--".$recipe['etape_desc'];
            $numbers[] = $recipe['numero'];
        }

    }
    
    
    mysqli_data_seek($result, 0);
    
    // Fetch ingredients
    $ingredients = [];
    $utensils = [];
    $igs = [];

    while ($ingredient = mysqli_fetch_assoc($result)) {
       
        if(!in_array($ingredient['ig'],$igs)){
            $ingredients[] =  $ingredient['ig'].'--'.$ingredient['ingredient_nom'];
            $igs[] = $ingredient['ig'];
        }
    }

    $ius = [];
    mysqli_data_seek($result, 0);

    while ($utensil = mysqli_fetch_assoc($result)) {
        if(!in_array($utensil['iu'],$ius)){
            $utensils[] =  $utensil["iu"]."--".$utensil['ustensil_nom'];
            $ius[] = $utensil['iu'];
        }
    }

}

if(isset($_POST["publier"])){
    $sql = "UPDATE recette SET publier = 'yes' WHERE id_recette = '$id'";
    // Exécution de la requête
    if (mysqli_query($con, $sql)) {
        echo "<script>
            alert('Recette publiée');
            window.location.url = 'admin.php'
        </script>";
    } else {
        echo "Erreur de mise à jour : " . mysqli_error($con);
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
} else {
    if(isset($_SESSION["user_id"])){
        require "header_login.php";
    }else{
        require "header_logout.php";
    }
}?>

    <main class="admin-page">
        <nav>
            <ul>
                <li><a href="edit_recipes.php?id=<?=$id?>">aperçu</a></li>
                <li><a href="ustensiles.php?id=<?=$id?>">Ustensile</a></li>
                <li><a href="ingredients.php?id=<?=$id?>">Ingredient</a></li>
                <li><a href="etapes.php?id=<?=$id?>" class="active">Etape</a></li>
            </ul>
        </nav>
        <form class="recipe-detail" method="post" action="">
            <div class="recipe-header">
                <div class="recipe-image">
                    <img id="recipe-image" src="<?= $recette["image"] ?>" alt="Image de la recette" loading="lazy">
                </div>
                <div class="recipe-info">
                    <h1 id="recipe-title">Nom de la recette</h1>
                    <div class="meta">
                        <span id="recipe-time"><i class="far fa-clock"></i><?= $recette["tmp_preparation"] ?> Temps de préparation</span>
                        <span id="recipe-servings"><i class="fas fa-users"></i><?= $recette["nbr_personne"] ?> Nombre de personnes</span>
                        <span id="recipe-country"><i class="fas fa-globe"></i> Pays : <?= $recette["origine"] ?></span>
                    </div>
                </div>
            </div>
    
            <div class="recipe-content">
                <div class="ingredients">
                    <h2>Ingrédients</h2>
                    <ul id="ingredients-list-admin">
                        
                        <?php foreach ($ingredients as $ingredient) {
                            $array = explode("--", $ingredient);
                            $ig = $array[0];
                            ?>
                            <li>
                                <div><?=htmlspecialchars($array[1])?></div>
                                <div><a href="deleteingredient.php?id=<?=$id?>&ig=<?=$ig?>">❌</a></div> 
                            </li>
                        <?php } ?>
                    </ul>
                </div>
    
                <div class="utensils">
                    <h2>Ustensiles</h2>
                    <ul id="utensils-list-admin">
                        <?php foreach ($utensils as $utensil) {
                            $array = explode("--", $utensil);
                            $iu = $array[0];
                            ?>
                            <li>
                                <div><?=htmlspecialchars($array[1])?></div>
                                <div><a href="deleteustensil?id=<?=$id?>&ig=<?=$iu?>">❌</a></div> 
                            </li>
                        <?php } ?>
                    </ul>
                </div>
    
                <div class="steps">
                    <h2>Étapes de préparation</h2>
                    <ol id="steps-list-admin">                
                    <?php foreach ($steps as $step) {
                        $array = explode("--", $step);
                        $is = $array[0];
                        ?>
                        <li>
                            <div><?=htmlspecialchars($array[1])?></div>
                            <div><a href="deletestep?id=<?=$id?>&ig=<?=$is?>">❌</a></div> 
                        </li>
                    <?php } ?>
                    </ol>
                </div>
            </div>
            <?php
            if($recette["publier"] == "no"):
            ?>
            <button class="publisher" type="submit" name="publier">Publier</button>
            <?php endif; ?>
            </form>
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

<?php
mysqli_stmt_close($stmt);

mysqli_close($con);

