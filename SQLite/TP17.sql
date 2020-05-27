-- TP17 -- Augustin ALbert

.headers on
.mode column 
.open geographie.sqlite

-- 1 --
SELECT nom FROM communes ;

-- 2 --
SELECT nom,population_2010 FROM communes ORDER BY population_2010 DESC LIMIT 10 ;

-- 3 --
SELECT nom,latitude FROM communes ORDER BY latitude DESC LIMIT 1 ;

-- 4 -- 
SELECT nom, population_2010/surface as densite FROM communes ORDER BY densite DESC LIMIT 10 ;

-- 5 --
SELECT nom,surface FROM communes ORDER BY surface LIMIT 10 ;

-- 6 --
SELECT nom, zmax-zmin AS e FROM communes WHERE e>0  ORDER BY e LIMIT 15 ;

-- 7 -- 
SELECT nom FROM communes WHERE population_2010 >= 200000 ;

-- 8 --
SELECT communes.nom, population_2010 FROM communes 
	WHERE num_departement == 14 
	ORDER BY population_2010 DESC LIMIT 20 ;

-- 9 --
SELECT nom FROM departements WHERE num_region in (84,75) ;

-- 10 -- 
SELECT nom,population_2010 FROM communes WHERE nom LIKE "Z%" ORDER BY population_2010 DESC LIMIT 5 ;

-- 11 -- 
SELECT communes.nom, population_2010-population_1999 AS absolue FROM communes 
	WHERE num_departement == 14 
	ORDER BY absolue DESC LIMIT 5 ;

SELECT communes.nom, (1.*population_2010-population_1999)/population_1999*100 AS relative FROM communes 
	WHERE num_departement == 14 
	ORDER BY relative DESC LIMIT 5 ;

-- 12 -- 
SELECT nom FROM communes WHERE 
	nom LIKE "%a%" AND 
	nom LIKE "%e%" AND 
	nom LIKE "%i%" AND 
	nom LIKE "%o%" AND 
	nom LIKE "%u%" AND 
	nom LIKE "%y%"
	ORDER BY LENGTH(nom) LIMIT 1;

-- 13 --
SELECT nom FROM communes WHERE num_departement == 14 AND 
	nom LIKE "%a%" AND 
	nom LIKE "%e%" AND 
	nom LIKE "%i%" AND 
	nom LIKE "%o%" AND 
	nom LIKE "%u%" AND 
	nom LIKE "%y%"
	ORDER BY LENGTH(communes.nom) LIMIT 1;

-- 14 --
SELECT nom FROM communes WHERE nom LIKE "ca%en" ;

-- 15 --
SELECT nom FROM communes WHERE nom LIKE "%z%z%" AND nom LIKE "%x%" ;

-- 16 -- 
SELECT nom FROM communes WHERE LENGTH(nom) >= 40 ;
SELECT nom FROM communes WHERE LENGTH(nom) <= 2 ;

-- 17 --
SELECT SUM(population_2010) FROM communes ;

-- 18 -- 
SELECT COUNT(*) FROM communes ;

-- 19 --
SELECT COUNT(*) FROM communes WHERE nom LIKE "%x%x" ;

-- 20 --
SELECT COUNT(*) FROM communes WHERE 
	nom LIKE "%a%" AND 
	nom LIKE "%e%" AND 
	nom LIKE "%i%" AND 
	nom LIKE "%o%" AND 
	nom LIKE "%u%" AND 
	nom LIKE "%y%";

-- 21 --
SELECT num_departement, COUNT(*) FROM communes 
GROUP BY num_departement ORDER BY COUNT(*) DESC; 

-- 22 --
SELECT num_departement, AVG(zmax) FROM communes 
WHERE num_departement IN (14, 74) 
GROUP BY num_departement;

-- 23 --
SELECT num_departement, SUM(population_2010) FROM communes 
	GROUP BY num_departement 
	ORDER BY SUM(population_2010) DESC;

-- 24 --
SELECT num_departement, SUM(population_2010) as s FROM communes 
	WHERE population_2010 >= 20000
	GROUP BY num_departement 
	ORDER BY s 
       	LIMIT 10;

-- 25 -- l'ghn'i(gu'p(okg;'(pgk'p(
SELECT num_departement, SUM(population_2010) FROM communes GROUP BY num_departement ORDER BY SUM(population_2010) DESC LIMIT 10; 
