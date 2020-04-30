-- TP16 -- Augustin Albert
.headers on 
.mode column

-- 3 --
DROP TABLE IF EXISTS "livres";
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
("Le ","bhh","","123","","2001"),
("jb","khbjkhb","nkn","321321","Augustin Albert","1989");

-- 6 --
INSERT INTO livres VALUES ("Lefefe ","bhh","","123","","20001");

-- 7 --


SELECT * FROM livres;
-- .save TP16.sqlite
