-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- Création de la BD
DROP DATABASE IF EXISTS zonemaison;
CREATE DATABASE zonemaison CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE zonemaison;


-- ---
-- Table 'categorie'
-- 
-- ---

DROP TABLE IF EXISTS `categorie`;
		
CREATE TABLE `categorie` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(100) NOT NULL,
  `id_parent` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'produit'
-- 
-- ---

DROP TABLE IF EXISTS `produit`;
		
CREATE TABLE `produit` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(25) NOT NULL,
  `sku` VARCHAR(25) NOT NULL,
  `desc_courte` VARCHAR(100) NULL DEFAULT NULL,
  `desc_longue` VARCHAR(1000) NULL DEFAULT NULL,
  `prix` DECIMAL(7,2) NOT NULL,
  `prix_solde` DECIMAL(7,2) NULL DEFAULT NULL,
  `date_ajout` DATE NOT NULL,
  `stock` SMALLINT NOT NULL,
  `detail_technique` VARCHAR(3000) NULL DEFAULT NULL,
  `id_categorie` SMALLINT NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'image_produit'
-- 
-- ---

DROP TABLE IF EXISTS `image_produit`;
		
CREATE TABLE `image_produit` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `fichier` VARCHAR(100) NOT NULL,
  `id_produit` MEDIUMINT NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `categorie` ADD FOREIGN KEY (id_parent) REFERENCES `categorie` (`id`);
ALTER TABLE `produit` ADD FOREIGN KEY (id_categorie) REFERENCES `categorie` (`id`);
ALTER TABLE `image_produit` ADD FOREIGN KEY (id_produit) REFERENCES `produit` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `categorie` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `produit` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `image_produit` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `categorie` (`id`,`nom`,`id_parent`) VALUES
-- ('','','');
-- INSERT INTO `produit` (`id`,`nom`,`sku`,`desc_courte`,`desc_longue`,`prix`,`prix_solde`,`date_ajout`,`stock`,`detail_technique`,`id_categorie`) VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO `image_produit` (`id`,`fichier`,`id_produit`) VALUES
-- ('','','');