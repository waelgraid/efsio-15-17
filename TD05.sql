CREATE TABLE fournisseur (
  code_fou varchar(10) NOT NULL COMMENT 'Code du fournisseur',
  rs_fou varchar(50) NOT NULL COMMENT 'Raison social du fournisseur',
  adr_fou varchar(100) NOT NULL COMMENT 'Adresse du fournisseur',
  cp_fou varchar(5) NOT NULL COMMENT 'Code postal du fournisseur',
  ville_fou varchar(30) NOT NULL COMMENT 'Ville du fournisseur',
  PRIMARY KEY (code_fou)
);

INSERT INTO fournisseur (code_fou, rs_fou, adr_fou, cp_fou, ville_fou) VALUES
('LYO12', 'Lyon Selection', '69 Rue Marcel Mérieux', '69960', 'CORBAS'),
('FRU05', 'FRUCOLY', '69 Rue Marcel Mérieux', '69960', 'CORBAS'),
('FRU27', 'Frutas Poneytas', '69 Rue Marcel Mérieux', '69960', 'CORBAS'),
('JOU02', 'Jourdanay & Marzo', '69 Rue Marcel Mérieux', '69960', 'CORBAS');

CREATE TABLE achat (
  num_ach int(11) NOT NULL AUTO_INCREMENT COMMENT 'Numéro de l\'achat',
  date_ach date NOT NULL COMMENT 'Date de l\'achat',
  mtht_ach double NOT NULL COMMENT 'Montant hors taxe de l\'achat',
  code_fou varchar(10) NOT NULL COMMENT 'Code du l\'achat',
  PRIMARY KEY (num_ach)
);

INSERT INTO achat (num_ach, date_ach, mtht_ach, code_fou) VALUES
(53, '2015-09-22', 225.25, 'LYO12'),
(65, '2015-09-22', 73.25, 'FRU05'),
(68, '2015-09-23', 152.50, 'JOU02'),
(74, '2015-09-28', 160.50, 'LYO12');

CREATE TABLE ligne_achat (
  num_ach int(11) NOT NULL COMMENT 'Numéro d\'achat',
  code_pro varchar(10) NOT NULL COMMENT 'Code de produit',
  qte_lach double NOT NULL COMMENT 'Quantité de produit',
  puht_lach double NOT NULL COMMENT 'Prix hors taxe du produit',
  taxe_lach double NOT NULL COMMENT 'Taux de taxe du produit',
  PRIMARY KEY (num_ach,code_pro)
);

INSERT INTO ligne_achat (num_ach, code_pro, qte_lach, puht_lach, taxe_lach) VALUES
(53, 'CLEF', 100, 1.50,7),
(53, 'CLEM', 70, 0.85,7),
(53, 'ORANES', 35, 0.45,7),
(65, 'CLEF', 25, 1.55,7),
(65, 'GTOM', 15, 2.30,20),
(68, 'CLEM', 100, 0.70,7),
(68, 'TOMC', 150, 0.55,7),
(74, 'CLEM', 60, 0.80,7),
(74, 'TOM', 250, 0.45,7);
