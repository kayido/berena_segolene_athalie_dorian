CREATE DATABASE  IF NOT EXISTS `recettes_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recettes_db`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: recettes_db
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `etape`
--

DROP TABLE IF EXISTS etape;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE etape (
  id_etape mediumint NOT NULL AUTO_INCREMENT,
  numero tinyint unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  id_recette smallint NOT NULL,
  PRIMARY KEY (id_etape),
  KEY id_recette (id_recette),
  CONSTRAINT etape_ibfk_1 FOREIGN KEY (id_recette) REFERENCES recette (id_recette) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etape`
--

LOCK TABLES etape WRITE;
/*!40000 ALTER TABLE etape DISABLE KEYS */;
INSERT INTO etape VALUES (1,1,'Faire bouillir les feuilles de ndolé dans de l’eau salée pendant 15 à 20 minutes. Égoutter et réserver.',1),(2,2,'Dans une casserole, faire revenir les oignons et l’ail dans de l’huile jusqu’à ce qu’ils deviennent translucides.',1),(3,3,'Ajouter la viande coupée en morceaux, saler et poivrer, puis faire revenir pendant environ 10 minutes.',1),(4,4,'Ajouter les tomates hachées et la pâte d’arachide à la viande. Laisser mijoter à feu doux pendant 10 minutes.',1),(5,5,'Incorporer les crevettes et les feuilles de ndolé dans la sauce. Mélanger bien et laisser mijoter pendant environ 15 minutes.',1),(6,1,'Éplucher et couper les bananes plantains en rondelles, les faire frire et réserver.',2),(7,2,'Assaisonner les morceaux de poulet avec sel, poivre, ail écrasé, puis faire frire jusqu\'à coloration dorée.',2),(8,3,'Dans une marmite, faire revenir les oignons émincés et les tomates coupées.',2),(9,4,'Ajouter les morceaux de poulet, les carottes coupées en rondelles et le poivron.',2),(10,5,'Ajouter les cubes de bouillon, un peu d\'eau, couvrir et laisser mijoter 30 minutes.',2),(11,6,'Ajouter les bananes plantains frites, mélanger délicatement et cuire encore 5-10 minutes.',2),(12,1,'Tremper les haricots koki dans de l\'eau pendant 12 heures puis retirer la peau.',3),(13,2,'Mixer les haricots en ajoutant un peu d\'eau jusqu\'à obtenir une pâte lisse.',3),(14,3,'Ajouter du sel et du piment écrasé à la pâte.',3),(15,4,'Chauffer légèrement l\'huile de palme et l\'ajouter à la pâte.',3),(16,5,'Tapisser un moule avec des feuilles de bananier ramollies à la vapeur.',3),(17,6,'Verser la pâte dans le moule, couvrir de feuilles et cuire à la vapeur pendant environ 1 heure.',3),(18,1,'Nettoyer et cuire la queue de bœuf et la viande fumée jusqu\'à tendreté.',4),(19,2,'Ajouter les feuilles d\'eru hachées à la viande cuite.',4),(20,3,'Ajouter les feuilles de waterleaf.',4),(21,4,'Incorporer les crevettes séchées et les crabes frais.',4),(22,5,'Ajouter de l\'huile de palme, les cubes de bouillon et du sel.',4),(23,6,'Laisser mijoter à feu doux en remuant régulièrement.',4),(24,1,'Laver soigneusement les feuilles de manioc.',5),(25,2,'Faire cuire les feuilles de manioc dans une marmite avec un peu d\'eau jusqu\'à attendrissement.',5),(26,3,'Ajouter les grains de maïs doux et continuer la cuisson 10 minutes.',5),(27,4,'Incorporer le lait de coco, le sel et le poivre.',5),(28,5,'Laisser mijoter doucement jusqu\'à ce que l\'ensemble soit bien lié.',5),(29,1,'Nettoyer et découper la viande de chèvre en morceaux.',6),(30,2,'Préparer une marinade avec ail, gingembre, poivre, sel et cubes de bouillon.',6),(31,3,'Faire revenir la viande marinée dans une marmite jusqu\'à coloration.',6),(32,4,'Ajouter les tomates concassées, les oignons émincés et les piments entiers.',6),(33,5,'Ajouter de l\'eau à hauteur et cuire la viande pendant environ 1 heure.',6),(34,6,'Ajouter les bananes plantains épluchées et coupées en gros morceaux, continuer la cuisson jusqu\'à tendreté.',6),(35,1,'Nettoyer et découper le poisson en morceaux.',7),(36,2,'Préparer la sauce en mixant tomates, oignons, ail, piment et gingembre.',7),(37,3,'Faire chauffer l\'huile dans une marmite, ajouter le mélange mixé.',7),(38,4,'Ajouter les épices Mbongo, les cubes de bouillon et du sel.',7),(39,5,'Laisser mijoter 15 minutes puis incorporer les morceaux de poisson.',7),(40,6,'Poursuivre la cuisson à feu doux jusqu\'à ce que le poisson soit bien tendre.',7),(41,1,'Cuire la viande de bœuf, la peau de vache et le poisson fumé dans une marmite jusqu\'à tendreté.',8),(42,2,'Éplucher et cuire le taro à la vapeur.',8),(43,3,'Piler le taro cuit pour obtenir une pâte homogène.',8),(44,4,'Dissoudre la pierre d\'achu dans un peu d\'eau.',8),(45,5,'Mélanger l\'huile de palme chaude avec l\'eau de la pierre pour obtenir une sauce jaune.',8),(46,6,'Ajouter la viande, la peau de vache, ajuster avec bouillon, piment et sel.',8),(47,1,'Griller le poulet entier sur feu de bois ou au four jusqu\'à coloration dorée.',9),(48,2,'Découper le poulet en morceaux.',9),(49,3,'Faire chauffer l\'huile de palme dans une marmite.',9),(50,4,'Ajouter les morceaux de poulet grillé dans l\'huile.',9),(51,5,'Ajouter les oignons émincés, sel, poivre et cubes de bouillon.',9),(52,6,'Laisser mijoter à feu doux en retournant les morceaux de poulet.',9),(53,1,'Laver soigneusement les feuilles de cocoyam et réserver.',10),(54,2,'Râper finement les taros et assaisonner avec sel et épices.',10),(55,3,'Envelopper de petites quantités de taro râpé dans les feuilles de cocoyam.',10),(56,4,'Disposer les paquets dans une marmite, ajouter oignons, ail, huile et cubes.',10),(57,5,'Couvrir d\'eau et cuire à feu moyen pendant environ 2 heures.',10),(58,1,'Découper la viande en petits morceaux.',11),(59,2,'Assaisonner avec sel, poivre, piment et poudre d\'arachide.',11),(60,3,'Embrocher la viande sur des pics.',11),(61,4,'Griller sur braise vive ou au barbecue jusqu\'à cuisson désirée.',11),(62,1,'Laver soigneusement les feuilles de cocoyam et réserver.',12),(63,2,'Râper finement les taros et assaisonner avec sel.',12),(64,3,'Envelopper des portions de taro râpé dans les feuilles de cocoyam.',12),(65,4,'Disposer les paquets dans une marmite avec le poisson fumé, l\'huile, l\'ail et les oignons.',12),(66,5,'Couvrir d\'eau et cuire lentement à feu moyen pendant environ 2 heures.',12),(67,1,'Tremper le maïs sec et les haricots rouges toute une nuit.',13),(68,2,'Cuire séparément le maïs et les haricots jusqu\'à tendreté.',13),(69,3,'Faire revenir oignons et ail dans de l\'huile.',13),(70,4,'Ajouter les haricots et le maïs cuits, les cubes et le sel.',13),(71,5,'Laisser mijoter ensemble pour bien mélanger les saveurs.',13),(72,1,'Laver soigneusement les feuilles de manioc.',14),(73,2,'Faire cuire les feuilles de manioc à feu doux.',14),(74,3,'Ajouter la pâte d’arachide en remuant régulièrement.',14),(75,4,'Incorporer le lait de coco, assaisonner avec sel et poivre.',14),(76,5,'Laisser mijoter doucement jusqu’à épaississement.',14),(77,1,'Découper le poulet en morceaux.',15),(78,2,'Assaisonner avec oignons, ail, tomates, cubes, sel, poivre et piment.',15),(79,3,'Envelopper la préparation dans de grandes feuilles de bananier ou de papier aluminium.',15),(80,4,'Cuire à la vapeur dans une marmite pendant environ 1 heure.',15),(81,1,'Griller les morceaux de viande de chèvre sur feu de bois ou au four.',16),(82,2,'Chauffer l\'huile dans une marmite.',16),(83,3,'Ajouter les morceaux de chèvre grillés, les oignons, le sel et le poivre.',16),(84,4,'Laisser mijoter doucement pour bien imbiber la viande.',16);
/*!40000 ALTER TABLE etape ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS ingredient;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE ingredient (
  id_ingredient smallint NOT NULL AUTO_INCREMENT,
  nom varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  mesure varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (id_ingredient)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES ingredient WRITE;
/*!40000 ALTER TABLE ingredient DISABLE KEYS */;
INSERT INTO ingredient VALUES (1,'Feuilles de ndolé','g'),(2,'Pâte d’arachide','g'),(3,'Viande de bœuf','g'),(4,'Crevettes','g'),(5,'Oignons','pièce'),(6,'Tomates','pièce'),(7,'Gousses d’ail','pièce'),(8,'Cubes de bouillon','pièce'),(9,'Huile végétale','ml'),(10,'Sel','cuillère à café'),(11,'Poivre','cuillère à café'),(12,'Bananes plantains','pièce'),(13,'Carottes','pièce'),(14,'Poivron vert','pièce'),(15,'Poulet entier','pièce'),(16,'Haricots koki (niébé)','g'),(17,'Feuilles de bananier','pièce'),(18,'Piment frais','pièce'),(19,'Feuilles d\'eru','g'),(20,'Feuilles de waterleaf (ou épinards)','g'),(21,'Viande de bœuf fumée','g'),(22,'Queue de bœuf','g'),(23,'Crabes frais','pièce'),(24,'Crevettes séchées','g'),(25,'Grains de maïs doux','g'),(26,'Viande de chèvre','g'),(27,'Poisson frais','g'),(28,'Mbongo épices (épices noircies)','g'),(29,'Taro','g'),(30,'Pierre d\'achu (limestone alimentaire)','g'),(31,'Peau de vache (kanda)','g'),(32,'Taro râpé','g'),(33,'Feuilles de cocoyam','pièce'),(34,'Viande de bœuf pour brochettes','g'),(35,'Poudre d\'arachide grillée','g'),(36,'Poisson fumé','g'),(37,'Haricots rouges','g'),(38,'Maïs sec','g');
/*!40000 ALTER TABLE ingredient ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_recette`
--

DROP TABLE IF EXISTS ingredient_recette;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE ingredient_recette (
  id_ingredient_recette int NOT NULL AUTO_INCREMENT,
  id_ingredient smallint DEFAULT NULL,
  id_recette smallint DEFAULT NULL,
  quantite decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (id_ingredient_recette),
  KEY id_ingredient (id_ingredient),
  KEY id_recette (id_recette),
  CONSTRAINT ingredient_recette_ibfk_1 FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient) ON DELETE CASCADE,
  CONSTRAINT ingredient_recette_ibfk_2 FOREIGN KEY (id_recette) REFERENCES recette (id_recette) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_recette`
--

LOCK TABLES ingredient_recette WRITE;
/*!40000 ALTER TABLE ingredient_recette DISABLE KEYS */;
INSERT INTO ingredient_recette VALUES (1,1,1,500.00),(2,2,1,200.00),(3,3,1,500.00),(4,4,1,200.00),(5,5,1,2.00),(6,6,1,2.00),(7,7,1,2.00),(8,8,1,2.00),(9,9,1,50.00),(10,10,1,1.00),(11,11,1,1.00),(12,15,2,1.00),(13,12,2,6.00),(14,13,2,2.00),(15,5,2,2.00),(16,6,2,2.00),(17,7,2,2.00),(18,14,2,1.00),(19,8,2,2.00),(20,9,2,100.00),(21,10,2,1.00),(22,11,2,1.00),(23,16,3,500.00),(24,17,3,4.00),(25,9,3,100.00),(26,18,3,2.00),(27,10,3,1.00),(28,19,4,500.00),(29,20,4,400.00),(30,21,4,300.00),(31,22,4,300.00),(32,23,4,4.00),(33,24,4,100.00),(34,9,4,150.00),(35,8,4,3.00),(36,10,4,1.00),(37,12,5,400.00),(38,25,5,200.00),(39,18,5,300.00),(40,10,5,1.00),(41,11,5,1.00),(42,26,6,999.99),(43,12,6,8.00),(44,6,6,3.00),(45,5,6,2.00),(46,7,6,3.00),(47,23,6,20.00),(48,11,6,1.00),(49,8,6,2.00),(50,18,6,2.00),(51,10,6,1.00),(52,26,6,900.00),(53,27,7,800.00),(54,28,7,50.00),(55,6,7,4.00),(56,5,7,2.00),(57,18,7,2.00),(58,7,7,3.00),(59,23,7,20.00),(60,8,7,2.00),(61,9,7,50.00),(62,10,7,1.00),(63,29,8,900.00),(64,9,8,150.00),(65,30,8,20.00),(66,3,8,500.00),(67,31,8,300.00),(68,17,8,200.00),(69,8,8,3.00),(70,18,8,2.00),(71,10,8,1.00),(72,15,9,1.00),(73,9,9,100.00),(74,10,9,1.00),(75,11,9,1.00),(76,5,9,2.00),(77,32,10,999.99),(78,33,10,30.00),(79,9,10,100.00),(80,5,10,2.00),(81,7,10,2.00),(82,8,10,2.00),(83,10,10,1.00),(84,32,10,900.00),(85,32,10,900.00),(86,34,11,500.00),(87,35,11,50.00),(88,10,11,1.00),(89,11,11,1.00),(90,18,11,2.00),(91,32,12,800.00),(92,33,12,30.00),(93,36,12,200.00),(94,9,12,100.00),(95,5,12,2.00),(96,7,12,2.00),(97,8,12,2.00),(98,10,12,1.00),(99,37,13,500.00),(100,38,13,500.00),(101,5,13,2.00),(102,7,13,2.00),(103,9,13,100.00),(104,8,13,2.00),(105,10,13,1.00),(106,12,14,500.00),(107,2,14,200.00),(108,18,14,300.00),(109,10,14,1.00),(110,11,14,1.00),(111,15,15,1.00),(112,5,15,2.00),(113,6,15,3.00),(114,7,15,2.00),(115,8,15,2.00),(116,18,15,2.00),(117,10,15,1.00),(118,11,15,1.00),(119,26,16,999.99),(120,9,16,100.00),(121,5,16,2.00),(122,10,16,1.00),(123,11,16,1.00),(124,26,16,900.00);
/*!40000 ALTER TABLE ingredient_recette ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS rating;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE rating (
  id_rating int NOT NULL AUTO_INCREMENT,
  note decimal(3,2) NOT NULL,
  commentaire varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  id_user smallint NOT NULL,
  id_recette smallint NOT NULL,
  PRIMARY KEY (id_rating),
  KEY id_user (id_user),
  KEY id_recette (id_recette),
  CONSTRAINT rating_ibfk_1 FOREIGN KEY (id_user) REFERENCES utilisateur (id_user) ON DELETE CASCADE,
  CONSTRAINT rating_ibfk_2 FOREIGN KEY (id_recette) REFERENCES recette (id_recette) ON DELETE CASCADE,
  CONSTRAINT rating_chk_1 CHECK ((`note` between 0 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES rating WRITE;
/*!40000 ALTER TABLE rating DISABLE KEYS */;
INSERT INTO rating VALUES (1,4.50,'Excellent plat, très savoureux !',2,1),(2,5.00,'Un classique incontournable.',3,2),(3,4.00,'Bien épicé, très bon.',4,3),(4,3.50,'Un peu trop salé à mon goût.',5,4),(5,4.70,'Superbe recette, je recommande.',6,5),(6,3.00,'Moyen, manque un peu de goût.',7,6),(7,5.00,'Parfait pour un repas familial.',8,7),(8,4.20,'Délicieux, merci pour la recette.',9,8),(9,3.80,'Bonne recette mais longue à préparer.',10,9),(10,4.60,'Très bon et bien présenté.',11,10),(11,4.90,'Excellent équilibre des saveurs.',12,11),(12,3.70,'Bien mais un peu épicé pour moi.',13,12),(13,4.30,'Recette facile et savoureuse.',14,13),(14,5.00,'Un pur délice, bravo !',15,14),(15,3.20,'Pas assez relevé à mon goût.',16,15),(16,4.80,'Très belle découverte, merci.',17,16),(17,4.10,'Goût authentique du pays.',18,1),(18,3.50,'Préparation longue mais bon résultat.',19,2),(19,4.00,'Recette validée par toute la famille.',20,3),(20,3.90,'Savoureux et parfumé.',21,4),(21,4.70,'Recette bien expliquée, super.',2,5),(22,4.20,'Très bon mais un peu gras.',3,6),(23,5.00,'Rien à redire, excellent !',4,7),(24,3.60,'Correct mais j’ai préféré d’autres plats.',5,8),(25,4.50,'Goût très riche et parfumé.',6,9),(26,3.80,'Jolie présentation, bon goût.',7,10),(27,4.10,'Simple et bon.',8,11),(28,4.00,'Très bon plat de fête.',9,12),(29,3.40,'Pas mal, mais pas mon préféré.',10,13),(30,4.90,'Délicieux, tout le monde a aimé.',11,14),(31,3.90,'Pas mal du tout, à refaire.',12,15),(32,4.60,'Très bonne recette, super goût.',13,16),(33,4.30,'Texture parfaite, très apprécié.',14,1),(34,4.80,'Plat réussi, mes invités ont adoré.',15,2),(35,3.70,'Un peu difficile à préparer, mais bon.',16,3),(36,4.50,'Bien équilibré et savoureux.',17,4),(37,3.50,'Pas très fan, mais bien fait.',18,5),(38,4.90,'Excellente recette, très fidèle.',19,6),(39,4.00,'Simple et bon pour le quotidien.',20,7),(40,5.00,'Magnifique plat, bravo !',21,8);
/*!40000 ALTER TABLE rating ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recette`
--

DROP TABLE IF EXISTS recette;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE recette (
  id_recette smallint NOT NULL AUTO_INCREMENT,
  nom varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  tmp_preparation tinyint unsigned NOT NULL,
  tmp_cuisson tinyint unsigned DEFAULT NULL,
  nbr_personne tinyint unsigned NOT NULL,
  origine varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (id_recette)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recette`
--

LOCK TABLES recette WRITE;
/*!40000 ALTER TABLE recette DISABLE KEYS */;
INSERT INTO recette VALUES (1,'Ndolé',30,60,4,'Cameroun','https://www.afrocuisinemagazine.com/_files/ugd/8c1c0f_3f1b0a6e2b6e4e8e9a5e5e5e5e5e5e5e.jpg'),(2,'Poulet DG',25,45,4,'Cameroun','https://res.cloudinary.com/hilnmyskv/image/upload/f_auto,fl_lossy,q_auto/v1/Images_Articles/Cuisine/poulet_dg'),(3,'Koki',20,60,4,'Cameroun','https://www.afrocuisine.net/wp-content/uploads/2018/09/Le-Koki.jpg'),(4,'Eru',40,90,6,'Cameroun','https://assets.africanbites.com/wp-content/uploads/2019/06/Eru-Soup-500x375.jpg'),(5,'Sanga',20,40,4,'Cameroun','https://i.ytimg.com/vi/5gdtuwZkGnc/maxresdefault.jpg'),(6,'Kondre',30,90,6,'Cameroun','https://www.cuisinonsencouleurs.fr/wp-content/uploads/2021/01/kondre.jpg'),(7,'Mbongo Tchobi',30,60,5,'Cameroun','https://www.afrocuisine.net/wp-content/uploads/2019/05/Mbongo-tchobi-Cameroon.jpg'),(8,'Achu Soup',45,90,6,'Cameroun','https://www.africanbites.com/wp-content/uploads/2020/03/Achu-and-Yellow-Soup-1-500x500.jpg'),(9,'Kati Kati',20,60,4,'Cameroun','https://www.africanvibes.com/wp-content/uploads/2021/02/Kati-Kati.jpg'),(10,'Ekwang',60,120,6,'Cameroun','https://www.africanbites.com/wp-content/uploads/2020/08/Ekwang-8-500x500.jpg'),(11,'Soya',15,10,4,'Cameroun','https://www.afrocuisine.net/wp-content/uploads/2020/10/Soya-Cameroun.jpg'),(12,'Ekwang de Poisson',60,120,6,'Cameroun','https://cdn.africanvibes.com/wp-content/uploads/2020/10/ekwang.jpg'),(13,'Cornchaff',30,90,6,'Cameroun','https://upload.wikimedia.org/wikipedia/commons/2/24/Cornchaff_Cameroon.jpg'),(14,'Okok',25,45,4,'Cameroun','https://www.okok.co/images/okok_cameroun.jpg'),(15,'Ndomba de Poulet',40,60,4,'Cameroun','https://www.cuisinedafrique.com/wp-content/uploads/2021/02/ndomba-poulet.jpg'),(16,'Kati Kati de Chèvre',20,60,4,'Cameroun','https://t1.uc.ltmcdn.com/fr/posts/7/6/8/kati_kati_recette_camerounaise_28767_600.webp');
/*!40000 ALTER TABLE recette ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_recette`
--

DROP TABLE IF EXISTS user_recette;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE user_recette (
  id_user_recette int NOT NULL AUTO_INCREMENT,
  id_user smallint DEFAULT NULL,
  id_recette smallint DEFAULT NULL,
  PRIMARY KEY (id_user_recette),
  KEY id_user (id_user),
  KEY id_recette (id_recette),
  CONSTRAINT user_recette_ibfk_1 FOREIGN KEY (id_user) REFERENCES utilisateur (id_user) ON DELETE CASCADE,
  CONSTRAINT user_recette_ibfk_2 FOREIGN KEY (id_recette) REFERENCES recette (id_recette) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_recette`
--

LOCK TABLES user_recette WRITE;
/*!40000 ALTER TABLE user_recette DISABLE KEYS */;
/*!40000 ALTER TABLE user_recette ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ustensil`
--

DROP TABLE IF EXISTS ustensil;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE ustensil (
  id_ustensil tinyint NOT NULL AUTO_INCREMENT,
  nom varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (id_ustensil)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ustensil`
--

LOCK TABLES ustensil WRITE;
/*!40000 ALTER TABLE ustensil DISABLE KEYS */;
INSERT INTO ustensil VALUES (1,'Marmite'),(2,'Couteau'),(3,'Planche à découper'),(4,'Louche'),(5,'Passoire'),(6,'Cuillère en bois'),(7,'Mixeur'),(8,'Bol'),(9,'Assiette'),(10,'Poêle');
/*!40000 ALTER TABLE ustensil ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ustensil_recette`
--

DROP TABLE IF EXISTS ustensil_recette;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE ustensil_recette (
  id_ustensil_recette int NOT NULL AUTO_INCREMENT,
  id_recette smallint DEFAULT NULL,
  id_ustensil tinyint DEFAULT NULL,
  PRIMARY KEY (id_ustensil_recette),
  KEY id_recette (id_recette),
  KEY id_ustensil (id_ustensil),
  CONSTRAINT ustensil_recette_ibfk_1 FOREIGN KEY (id_recette) REFERENCES recette (id_recette) ON DELETE CASCADE,
  CONSTRAINT ustensil_recette_ibfk_2 FOREIGN KEY (id_ustensil) REFERENCES ustensil (id_ustensil) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ustensil_recette`
--

LOCK TABLES ustensil_recette WRITE;
/*!40000 ALTER TABLE ustensil_recette DISABLE KEYS */;
INSERT INTO ustensil_recette VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,6),(6,2,1),(7,2,2),(8,2,3),(9,2,4),(10,2,10),(11,3,1),(12,3,2),(13,3,3),(14,3,4),(15,3,5),(16,4,1),(17,4,2),(18,4,3),(19,4,4),(20,4,5),(21,5,1),(22,5,2),(23,5,3),(24,5,4),(25,5,5),(26,6,1),(27,6,2),(28,6,3),(29,6,4),(30,6,5),(31,7,1),(32,7,2),(33,7,3),(34,7,4),(35,7,7),(36,8,1),(37,8,2),(38,8,3),(39,8,4),(40,8,8),(41,9,1),(42,9,2),(43,9,3),(44,9,4),(45,9,9),(46,10,1),(47,10,2),(48,10,3),(49,10,4),(50,10,5),(51,11,2),(52,11,3),(53,11,9),(54,12,1),(55,12,2),(56,12,3),(57,12,4),(58,12,5),(59,13,1),(60,13,2),(61,13,3),(62,13,4),(63,13,5),(64,14,1),(65,14,2),(66,14,3),(67,14,4),(68,14,5),(69,15,1),(70,15,2),(71,15,3),(72,15,4),(73,15,5),(74,16,1),(75,16,2),(76,16,3),(77,16,4),(78,16,9);
/*!40000 ALTER TABLE ustensil_recette ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS utilisateur;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE utilisateur (
  id_user smallint NOT NULL AUTO_INCREMENT,
  email varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_general_ci NOT NULL,
  `password` char(60) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (id_user),
  UNIQUE KEY email (email)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES utilisateur WRITE;
/*!40000 ALTER TABLE utilisateur DISABLE KEYS */;
INSERT INTO utilisateur VALUES (1,'admin@recetteafricaine.cm','admin','$2y$10$e0NRyQ6Qz1Xh8Z0N1x9e0u1x9e0u1x9e0u1x9e0u1x9e0u1x9e0u'),(2,'paul.ndongo@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(3,'amina.bello@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(4,'justine.mfoua@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(5,'stephane.manga@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(6,'chanel.ndi@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(7,'roland.ekeu@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(8,'david.biloa@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(9,'marie.yomb@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(10,'patrick.songa@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(11,'vanessa.kotto@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(12,'martin.nkoulou@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(13,'emilie.efoua@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(14,'yannick.mendo@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(15,'florence.koum@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(16,'gilles.tamba@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(17,'aurélie.nkou@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(18,'brice.abega@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(19,'doris.mballa@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(20,'cedric.ekani@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ=='),(21,'sandra.meyong@gmail.com','user','$2y$10$eImiTXuWVxfM37uY4JANjQ==');
/*!40000 ALTER TABLE utilisateur ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-29 11:32:40
