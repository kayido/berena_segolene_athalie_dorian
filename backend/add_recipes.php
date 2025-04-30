<?php
session_start();
require "connectBD.php";

if (isset($_POST["submit"])) {
    // Sanitize and validate input
    $nom = trim($_POST["nom"]);
    $tmp_preparation = (int)$_POST["tmp_preparation"];
    $nbr_personne = (int)$_POST["nbr_personne"];
    $origine = trim($_POST["origine"]);
    $url = filter_var(trim($_POST["url"]), FILTER_SANITIZE_URL);
    
    // Check for valid URL
    if (!filter_var($url, FILTER_VALIDATE_URL)) {
        echo "<script>alert('URL invalide')</script>";
        exit;
    }

    $stmt = mysqli_prepare($con, "INSERT INTO `recette` (`nom`, `tmp_preparation`, `nbr_personne`, `origine`, `image`) VALUES (?, ?, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt, "siiss", $nom, $tmp_preparation, $nbr_personne, $origine, $url);
    
    if (mysqli_stmt_execute($stmt)) {
        echo "<script>alert('Recette rajoutée avec succès')</script>";
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

    <main class="admin-page">
        <!-- Modal pour ajouter/modifier une recette -->
        <div id="recipe-modal" class="modal">
            <div class="modal-content">
                <h2 id="modal-title">Ajouter une recette</h2>
                <form id="recipe-form" method="post">
                    <input type="hidden" id="recipe-id">
                    <div class="form-group">
                        <label for="recipe-name">Nom de la recette:</label>
                        <input type="text" id="recipe-name"  name="nom" required>
                    </div>
                    <div class="form-group">
                        <label for="recipe-time">Temps de préparation (minutes):</label>
                        <input type="number" name ="tmp_preparation" id="recipe-time" required>
                    </div>
                    <div class="form-group">
                        <label for="recipe-servings">Nombre de personnes:</label>
                        <input type="number" id="recipe-servings" name="nbr_personne" required>
                    </div>
                    <div class="form-group">
                        <label for="recipe-category">Catégorie:</label>
                        <select id="recipe-category" required>
                            <option value="">Sélectionnez une catégorie</option>
                            <option value="entree">Entrée</option>
                            <option value="plat">Plat principal</option>
                            <option value="dessert">Dessert</option>
                            <option value="boisson">Boisson</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="recipe-country">Pays:</label>
                        <select id="recipe-country" name="origine" required>
                            <option value="">Sélectionnez un pays</option>
                            <option value="france">Cameroun</option>
                            <option value="italie">Cote ivoire</option>
                            <option value="asie">Congo brazaville</option>
                            <option value="mexique">RCA</option>
                            <option value="usa">Mali</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="recipe-image-url">URL de l'image:</label>
                        <input type="text" id="recipe-image-url" name="url" required>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary" name="submit">Enregistrer</button>
                        <button type="button" class="btn btn-secondary close-btn">Annuler</button>
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


