<?php

require "connectBD.php";

$id = $_GET['id'];
$req = mysqli_query($con,"DELETE FROM `recette` WHERE id_recette = '$id' ");

if($req){
    echo "<script>alert('recette supprimé')</script>";
    echo "<script> window.location = 'http://localhost/greenproject/backend/admin.php' </script>'";

}else{
    echo "<script>alert('une erreur est survenue')</script>";
}

?>