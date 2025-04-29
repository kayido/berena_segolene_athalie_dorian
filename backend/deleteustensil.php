<?php

require "connectBD.php";
$id = $_GET['id'];
$ig = $_GET['ig'];

$req = mysqli_query($con,"DELETE FROM `ustensil_recette` WHERE id_ustensil = $ig AND id_recette = $id");

if($req){
    echo "<script>alert('ustensil supprimé avec succès')</script>";
    echo "<script> window.location = 'http://localhost/greenproject/backend/edit_recipes.php?id=$id' </script>'";

}else{
    echo "<script>alert('une erreur est survenue')</script>";
}


