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
("Les Contemplations","Victor Hugo","","123","Augustin","1856"),
("La Supplication","Svetlana Alexievitch","","548","","1997");

-- 6 -- La colonne ISBN est la clée primaire, imposible d'ajouter des doublons
INSERT INTO livres VALUES ("Le Gai savoir","Friedrich Nietzsche","","123","","1887");
INSERT INTO livres VALUES ("Le Gai savoir","Friedrich Nietzsche","","151","","1887");

-- 8 --
CREATE TABLE ecrivains(
	Nom TEXT NOT NULL,
	Prenom TEXT NOT NULL,
	Pays TEXT,
	Anneenaissance INT,
	Anneedeces INT
);

-- 9 --
INSERT INTO ecrivains VALUES 
("Hugo","Victor","France","1802","1885"),
("Svetlana","Alexievitch","Ukraine","1948","");

-- 10 --
ALTER TABLE ecrivains RENAME TO auteurs;

-- 11 --
CREATE TABLE titi(toto);
DROP TABLE titi;

-- 12 -- 
UPDATE livres SET proprietaire = "Jean Valjean" WHERE auteur != "Victor Hugo";

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


