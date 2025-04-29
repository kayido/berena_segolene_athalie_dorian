<?php
$con = mysqli_connect("localhost","root","","recettes_db");

if(!$con){
    echo "erreur de connexion à la base de données";
}
