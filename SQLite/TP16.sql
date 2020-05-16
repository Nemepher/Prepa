-- TP16 -- Augustin Albert

DROP TABLE IF EXISTS "livres";
DROP TABLE IF EXISTS "ecrivains";
DROP TABLE IF EXISTS "auteurs";
.headers on 
.mode column

-- 3 --
CREATE TABLE livres(
	titre TEXT NOT NULL,
	auteur TEXT, 
	illustateur TEXT DEFAULT NULL,
	ISBN INT PRIMARY KEY, 
	proprietaire TEXT 
);

-- 4 --
ALTER TABLE livres ADD COLUMN annee INT;

-- 5 -- 
INSERT INTO livres VALUES 
("tg ","Werber","","123","","2001"),
("jb","khbjkhb","nkn","321321","Augustin Albert","1989");

-- 6 -- La colonne ISBN est la clée primaire, imposible d'ajouter des doublons
INSERT INTO livres VALUES ("Lefefe ","bhh","","123","","20001");

-- 8 --
CREATE TABLE ecrivains(
	Nom TEXT NOT NULL,
	Prenom TEXT NOT NULL,
	Pays DEFAULT NULL,
	Anneenaissance INT,
	Anneedeces INT
);

-- 9 --
INSERT INTO ecrivains VALUES 
("Le ","bhh","","1203","2001"),
("jb","khbjkhb","nkn","1021","1989");

-- 10 --
ALTER TABLE ecrivains RENAME TO auteurs;

-- 11 --
CREATE TABLE titi(toto);
DROP TABLE titi;

-- 12 -- 
UPDATE livres SET proprietaire = "Jean Valjean" WHERE auteur = "Werber";

-- 13 --
.output livres.sql
SELECT * FROM livres;
.output stdout

-- 14 -- Alternative à .output FILENAME suivi de .output stdout
.mode csv
.once livres.csv 
SELECT * FROM livres;

-- 15 -- 
.mode column
.import livres.csv livres2
SELECT * FROM livres2;

