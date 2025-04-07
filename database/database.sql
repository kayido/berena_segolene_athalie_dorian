CREATE TABLE utilisateur (
   id_user SMALLINT AUTO_INCREMENT,
   email VARCHAR(50) NOT NULL UNIQUE,
   role ENUM('user', 'admin') NOT NULL,
   password CHAR(60) NOT NULL, -- Pour un hash bcrypt
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
   FOREIGN KEY(id_recette) REFERENCES recette(id_recette)
);

CREATE TABLE user_recette (
   id_user SMALLINT,
   id_recette SMALLINT,
   PRIMARY KEY(id_user, id_recette),
   FOREIGN KEY(id_user) REFERENCES utilisateur(id_user),
   FOREIGN KEY(id_recette) REFERENCES recette(id_recette)
);

CREATE TABLE ingredient_recette (
   id_ingredient SMALLINT,
   id_recette SMALLINT,
   quantite DECIMAL(5,2),  -- Pour stocker la quantité
   PRIMARY KEY(id_ingredient, id_recette),
   FOREIGN KEY(id_ingredient) REFERENCES ingredient(id_ingredient),
   FOREIGN KEY(id_recette) REFERENCES recette(id_recette)
);

CREATE TABLE ustensil_recette (
   id_recette SMALLINT,
   id_ustensil TINYINT,
   PRIMARY KEY(id_recette, id_ustensil),
   FOREIGN KEY(id_recette) REFERENCES recette(id_recette),
   FOREIGN KEY(id_ustensil) REFERENCES ustensil(id_ustensil)
);
