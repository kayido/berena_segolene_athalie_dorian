-- 1. Créer la base de données
CREATE DATABASE IF NOT EXISTS recettes_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE recettes_db;

-- 2. Création des tables

CREATE TABLE utilisateur ( 
   id_user SMALLINT AUTO_INCREMENT, 
   email VARCHAR(50) NOT NULL UNIQUE, 
   role ENUM('user', 'admin') NOT NULL, 
   password CHAR(60) NOT NULL,  
   PRIMARY KEY(id_user) 
); 

CREATE TABLE ingredient ( 
   id_ingredient SMALLINT AUTO_INCREMENT, 
   nom VARCHAR(40) NOT NULL, 
   mesure VARCHAR(20) NOT NULL,    
   PRIMARY KEY(id_ingredient) 
); 

CREATE TABLE recette ( 
   id_recette SMALLINT AUTO_INCREMENT, 
   nom VARCHAR(60) NOT NULL, 
   tmp_preparation TINYINT UNSIGNED NOT NULL,  -- en minutes 
   tmp_cuisson TINYINT UNSIGNED,               -- aussi en minutes 
   nbr_personne TINYINT UNSIGNED NOT NULL, 
   origine VARCHAR(40), 
   image VARCHAR(255), 
   PRIMARY KEY(id_recette) 
); 

CREATE TABLE ustensil ( 
   id_ustensil TINYINT AUTO_INCREMENT, 
   nom VARCHAR(40) NOT NULL, 
   PRIMARY KEY(id_ustensil) 
); 

CREATE TABLE etape ( 
   id_etape MEDIUMINT AUTO_INCREMENT, 
   numero TINYINT UNSIGNED NOT NULL, 
   description VARCHAR(255) NOT NULL, 
   id_recette SMALLINT NOT NULL, 
   PRIMARY KEY(id_etape), 
   FOREIGN KEY(id_recette) REFERENCES recette(id_recette) ON DELETE CASCADE
); 

CREATE TABLE rating ( 
   id_rating INT AUTO_INCREMENT, 
   note DECIMAL(3,2) NOT NULL CHECK (note BETWEEN 0 AND 5), 
   commentaire VARCHAR(255), 
   id_user SMALLINT NOT NULL, 
   id_recette SMALLINT NOT NULL, 
   PRIMARY KEY(id_rating), 
   FOREIGN KEY(id_user) REFERENCES utilisateur(id_user) ON DELETE CASCADE, 
   FOREIGN KEY(id_recette) REFERENCES recette(id_recette) ON DELETE CASCADE
); 

CREATE TABLE user_recette ( 
   id_user SMALLINT, 
   id_recette SMALLINT, 
   PRIMARY KEY(id_user, id_recette), 
   FOREIGN KEY(id_user) REFERENCES utilisateur(id_user) ON DELETE CASCADE, 
   FOREIGN KEY(id_recette) REFERENCES recette(id_recette) ON DELETE CASCADE
); 

CREATE TABLE ingredient_recette ( 
   id_ingredient SMALLINT, 
   id_recette SMALLINT, 
   quantite DECIMAL(5,2),  -- Pour stocker la quantité 
   PRIMARY KEY(id_ingredient, id_recette), 
   FOREIGN KEY(id_ingredient) REFERENCES ingredient(id_ingredient) ON DELETE CASCADE, 
   FOREIGN KEY(id_recette) REFERENCES recette(id_recette) ON DELETE CASCADE
); 

CREATE TABLE ustensil_recette ( 
   id_recette SMALLINT, 
   id_ustensil TINYINT, 
   PRIMARY KEY(id_recette, id_ustensil), 
   FOREIGN KEY(id_recette) REFERENCES recette(id_recette) ON DELETE CASCADE, 
   FOREIGN KEY(id_ustensil) REFERENCES ustensil(id_ustensil) ON DELETE CASCADE
);
