-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
-- Base de données :  `boutique`
--
DROP DATABASE boutique;
CREATE DATABASE boutique;
USE boutique;
CREATE TABLE categorie(idcat INTEGER PRIMARY KEY AUTO_INCREMENT,
                       nom VARCHAR(32),
                       description VARCHAR (128)
);
CREATE TABLE produit(idp int(11) AUTO_INCREMENT,
                     titre VARCHAR(64),
                     description VARCHAR(256), 
                     dimensions VARCHAR(11),
                     poids FLOAT,
                     rating INT(3) DEFAULT 0,
                     ean VARCHAR(13),
                     prix FLOAT DEFAULT 0.01,
                     idcat INTEGER DEFAULT NULL REFERENCES categorie(idcat),
                     PRIMARY KEY(idp)
);
CREATE TABLE image(idimage INTEGER AUTO_INCREMENT PRIMARY KEY,idp INTEGER REFERENCES produit(idp), url VARCHAR(256));
CREATE TABLE client(idcl INTEGER PRIMARY KEY AUTO_INCREMENT,
                    nom VARCHAR(64),
                    pnom VARCHAR(64),
                    adr1 VARCHAR(32),
					adr2 VARCHAR(32),
                    cp CHAR(5),
                    ville VARCHAR(32)
);
CREATE TABLE etat (idetat INTEGER PRIMARY KEY AUTO_INCREMENT,
                   nom VARCHAR(32),
                   description VARCHAR(128)
);
CREATE TABLE ajouter_panier(idcl INTEGER REFERENCES client(idcl),
                            idp INTEGER REFERENCES produit(idp),
                            PRIMARY KEY(idcl,idp)
);
CREATE TABLE acheter(idcl INTEGER REFERENCES client(idcl),
                            idp INTEGER REFERENCES produit(idp),
                            idetat INTEGER REFERENCES etat(idetat),
                            prix FLOAT,
                            quant FLOAT,
                            numerofacture VARCHAR(10) NOT NULL UNIQUE,
                            PRIMARY KEY(idcl,idp,idetat)
);



--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idp`, `ean`, `titre`, `description`, `prix`, `rating`, `dimensions`, `poids`) VALUES(1, '4004764850150', 'Marqueur edding bleu pour tableau blanc', 'Superbe stylo pour tableau blanc d\'une qualité exemplaire et a prix discount de couleur bleu', 0.99, 0, '30x30x120', 65);
INSERT INTO `produit` (`idp`, `ean`, `titre`, `description`, `prix`, `rating`, `dimensions`, `poids`) VALUES(2, '4004764850099', 'Marqueur edding noir pour tableau blanc', 'Superbe stylo pour tableau blanc d\'une qualité exemplaire et a prix discount et de couleur noir vraiment couvrant', 0.98, 0, '30x30x120', 65);
INSERT INTO `produit` (`idp`, `ean`, `titre`, `description`, `prix`, `rating`, `dimensions`, `poids`) VALUES(3, '14389', 'php solutions 3/2009', 'Superbe magazine sur la tech php', 7.5, 0, '210x297x4', 68);


COMMIT;
