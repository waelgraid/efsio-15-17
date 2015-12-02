CREATE DATABASE si3;
USE si3;

CREATE TABLE client (
  code_cli varchar(10) NOT NULL COMMENT 'Code du client',
  rs_cli varchar(50) NOT NULL COMMENT 'Raison social du client',
  adr_cli varchar(100) NOT NULL COMMENT 'Adresse du client',
  cp_cli varchar(5) NOT NULL COMMENT 'Code postal du client',
  ville_cli varchar(30) NOT NULL COMMENT 'Ville du client',
  PRIMARY KEY (code_cli)
);

INSERT INTO client (code_cli, rs_cli, adr_cli, cp_cli, ville_cli) VALUES
('ALB01', 'A la bonne notre', '15 rue des Clercs', '38200', 'VIENNE'),
('BOV05', 'Restaurant Bovarois', 'Chemin de la manche', '38780', 'SEPTEME'),
('COU01', 'Le courageux poney', '365 Route de Pisieu', '38270', 'REVEL-TOURDAN'),
('MAB07', 'Menestrels Anti Bavoir', '8 bis, rue maurice', '91345', 'LONGJUMEAU');

CREATE TABLE facture (
  num_fac int(11) NOT NULL AUTO_INCREMENT COMMENT 'Numéro de facture',
  date_fac date NOT NULL COMMENT 'Date de facture',
  mtht_fac double NOT NULL COMMENT 'Montant hors taxe de la facture',
  code_cli varchar(10) NOT NULL COMMENT 'Code du client',
  PRIMARY KEY (num_fac)
);

INSERT INTO facture (num_fac, date_fac, mtht_fac, code_cli) VALUES
(100, '2015-09-24', 79.5, 'BOV05'),
(101, '2015-09-24', 25.85, 'MAB07'),
(102, '2015-09-24', 145, 'ALB01'),
(115, '2015-10-01', 171.25, 'BOV05');

CREATE TABLE ligne_facture (
  num_fac int(11) NOT NULL COMMENT 'Numéro de facture',
  code_pro varchar(10) NOT NULL COMMENT 'Code de produit',
  qte_lfac double NOT NULL COMMENT 'Quantité de produit',
  PRIMARY KEY (num_fac,code_pro)
);

INSERT INTO ligne_facture (num_fac, code_pro, qte_lfac) VALUES
(100, 'CLEF', 10),
(100, 'CLEM', 30),
(100, 'ORAN', 25),
(101, 'CLEF', 8),
(101, 'GTOM', 5),
(102, 'CLEM', 80),
(102, 'TOMC', 45),
(115, 'CLEM', 25),
(115, 'TOM', 200);

CREATE TABLE produit (
  code_pro varchar(10) NOT NULL COMMENT 'Code du produit',
  lib_pro varchar(30) NOT NULL COMMENT 'Libelle du produit',
  puht_pro double NOT NULL COMMENT 'Prix unitaire hors taxe',
  taxe_pro double NOT NULL COMMENT 'Taux de taxe du produit',
  PRIMARY KEY (code_pro)
);

INSERT INTO produit (code_pro, lib_pro, puht_pro, taxe_pro) VALUES
('CLEF', 'Clémentines Feuilles', 1.45, 7),
('CLEM', 'Clémentines', 1.25, 7),
('GTOM', 'Graines de tomates', 2.85, 20),
('ORAN', 'Oranges', 1.1, 7),
('ORANES', 'Oranges Espagne', 0.85, 7),
('TOM', 'Tomates', 0.7, 7),
('TOMC', 'Tomates cerises', 0.75, 7);
