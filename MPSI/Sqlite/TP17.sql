-- TP17 -- Augustin ALbert

.headers on
.mode column
.open geographie.sqlite

-- 1 --
SELECT nom FROM communes ;

-- 2 --
SELECT nom, population_2010 FROM communes ORDER BY population_2010 DESC LIMIT 10 ;

-- 3 --
SELECT nom, latitude FROM communes ORDER BY latitude DESC LIMIT 1 ;

-- 4 -- 
SELECT nom, population_2010/surface as densite FROM communes ORDER BY densite DESC LIMIT 10 ;

-- 5 --
SELECT nom, surface FROM communes ORDER BY surface LIMIT 10 ;

-- 6 --
SELECT nom, zmax-zmin AS e FROM communes WHERE e>0  ORDER BY e LIMIT 15 ;

-- 7 -- 
SELECT nom FROM communes WHERE population_2010 >= 2e5 ;

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
SELECT nom, MAX(surface) FROM communes;

-- 19 -- 
SELECT COUNT(*) FROM communes WHERE num_departement == 14 ;

-- 20 --
SELECT COUNT(*) FROM communes WHERE nom LIKE "%x%x%" ;

-- 21 --
SELECT COUNT(*) FROM communes WHERE 
	nom LIKE "%a%" AND 
	nom LIKE "%e%" AND 
	nom LIKE "%i%" AND 
	nom LIKE "%o%" AND 
	nom LIKE "%u%" AND 
	nom LIKE "%y%";

-- 22 --
SELECT num_departement, COUNT(*) AS c FROM communes 
	GROUP BY num_departement 
	ORDER BY c DESC; 

-- 23 --
SELECT num_departement, AVG(zmax) FROM communes 
	WHERE num_departement IN (14, 74) 
	GROUP BY num_departement;

-- 24 --
SELECT num_departement, SUM(population_2010) AS s FROM communes 
	GROUP BY num_departement 
	ORDER BY s DESC;

-- 25 --
SELECT num_departement, SUM(population_2010) AS s FROM communes 
	WHERE population_2010 >= 20000
	GROUP BY num_departement 
	ORDER BY s 
       	LIMIT 10;

-- 26 -- 
SELECT num_departement, SUM(population_2010) AS s FROM communes 
	GROUP BY num_departement 
	HAVING s >= 15e5 
	ORDER BY s DESC 
	LIMIT 10; 

-- 27 --
SELECT LENGTH(nom) AS l, COUNT(*) FROM communes 
	GROUP BY l
	ORDER BY l;

-- 28 --
SELECT LENGTH(nom) as l, COUNT(*), nom  FROM communes 
	GROUP BY l
	ORDER BY l;

-- 29 --
SELECT nom, COUNT(*) AS c FROM communes 
	GROUP BY nom
	ORDER BY c DESC
       	LIMIT 15;

-- 30 -- Ce produit cartésien comporte 1818 enregistrements. 
SELECT * FROM departements, regions ;

-- 31 --
SELECT * FROM departements JOIN regions ON departements.num_region == regions.num_region ;

-- 32 L'attribut num_region est contenu par les deux tables ! -- 
SELECT * FROM departements 
	JOIN regions ON departements.num_region == regions.num_region 
	WHERE num_region=28;

SELECT * FROM departements 
	JOIN regions ON departements.num_region == regions.num_region 
	WHERE regions.num_region == 28;

-- 33 --
SELECT departements.nom, COUNT(*) as c FROM departements 
	JOIN communes ON departements.num_departement == communes.num_departement 
	GROUP BY departements.nom
	ORDER BY c DESC;

-- 34 --
SELECT departements.nom, SUM(population_2010) as s FROM departements 
	JOIN communes ON departements.num_departement == communes.num_departement 
	GROUP BY departements.nom
	ORDER BY s DESC;

-- 35 --
SELECT departements.nom, SUM(population_2010) as s FROM departements 
	JOIN communes ON departements.num_departement == communes.num_departement 
	GROUP BY departements.nom
	HAVING s >= 15e5
	ORDER BY s DESC;

-- 36 --
SELECT regions.nom, COUNT(*) AS c FROM regions
	JOIN departements ON departements.num_region == regions.num_region 
	GROUP BY regions.nom
	ORDER by c;

-- 37 --
SELECT departements.nom, (1.*SUM(population_2010))/SUM(surface) as densite FROM departements 
	JOIN communes ON departements.num_departement == communes.num_departement 
	GROUP BY departements.nom
	ORDER BY densite DESC;

-- 38 -- 
SELECT communes.nom FROM communes
	JOIN departements ON departements.num_departement == communes.num_departement
       	WHERE num_region == 75 AND 
	communes.nom LIKE "%a%" AND 
	communes.nom LIKE "%e%" AND 
	communes.nom LIKE "%i%" AND 
	communes.nom LIKE "%o%" AND 
	communes.nom LIKE "%u%" AND 
	communes.nom LIKE "%y%";

-- 39 -- 
SELECT communes.nom FROM communes 
	JOIN departements ON departements.num_departement == communes.num_departement
       	WHERE INSTR( UPPER(communes.nom), UPPER(departements.nom) ) > 0; 

-- 40 -- 
SELECT communes.nom, departements.nom, regions.nom FROM communes
	JOIN departements ON communes.num_departement == departements.num_departement
	JOIN regions ON departements.num_region == regions.num_region;

-- 41 -- 
SELECT regions.nom, SUM(population_2010) AS s FROM regions
	JOIN departements ON regions.num_region == departements.num_region
	JOIN communes ON departements.num_departement == communes.num_departement
	GROUP BY regions.nom
	ORDER BY s DESC;

-- 42 --
SELECT regions.nom, 1.*SUM(population_2010)/SUM(surface) AS densite FROM regions
	JOIN departements ON regions.num_region == departements.num_region
	JOIN communes ON departements.num_departement == communes.num_departement
	GROUP BY regions.nom
	ORDER BY densite DESC;

-- 43 --
SELECT regions.nom, COUNT(*) AS c FROM regions 
	JOIN departements ON regions.num_region == departements.num_region
	JOIN communes ON departements.num_departement == communes.num_departement
	WHERE regions.nom == "Normandie";

-- 44 --
SELECT regions.nom, SUM(population_2010) AS s, communes.nom, MAX(communes.population_2010) FROM regions
	JOIN departements ON regions.num_region == departements.num_region
	JOIN communes ON departements.num_departement == communes.num_departement
	GROUP BY regions.nom
	ORDER BY s DESC;

-- 45 --
SELECT communes.nom, departements.nom, regions.nom, zmax-zmin AS e FROM communes
	JOIN departements ON departements.num_departement == communes.num_departement
	JOIN regions ON departements.num_region == regions.num_region
	WHERE e>0
	ORDER BY e DESC
	LIMIT 15;

-- 46 --
SELECT communes.nom, COUNT(*) AS c FROM communes
	JOIN departements ON departements.num_departement == communes.num_departement
	WHERE departements.num_region == 28
	GROUP BY communes.nom
	HAVING c >= 3
	ORDER BY c DESC;

-- 47 -- 

-- Lent
SELECT nom FROM departements AS d 
	WHERE EXISTS ( 
		SELECT num_departement FROM communes 
		WHERE num_departement == d.num_departement AND	
		population_2010 >= 140000 
	);

-- Etonnament plus rapide mais pas joli
SELECT nom from departements AS d
	WHERE EXISTS ( 
		SELECT * from communes 
		JOIN departements ON communes.num_departement == d.num_departement 
		WHERE population_2010 >= 140000 
	);

-- Rapide mais sans EXISTS 
SELECT DISTINCT d.nom FROM departements AS d
	JOIN communes ON communes.num_departement == d.num_departement
	WHERE communes.population_2010 >= 140000;

-- 48 --
SELECT nom FROM departements AS d
	WHERE NOT EXISTS (
		SELECT num_departement FROM communes 
		WHERE num_departement == d.num_departement AND
		population_2010 >= 30000 
	);

-- Encore une fois plus rapide 
SELECT nom FROM departements AS d
	WHERE NOT EXISTS (
		SELECT * FROM communes 
		JOIN departements ON communes.num_departement == d.num_departement 
		WHERE population_2010 >= 30000 
	);

-- 49 --
SELECT nom FROM regions AS r
	WHERE EXISTS (
		SELECT nom, num_region FROM departements 
		WHERE num_region == r.num_region AND
		nom LIKE "c%"
	);
-- Idem 
SELECT DISTINCT r.nom FROM regions AS r
	JOIN departements ON departements.num_region == r.num_region
	WHERE departements.nom LIKE "c%";

-- 50 --
SELECT nom FROM regions AS r
	WHERE NOT EXISTS (
		SELECT * FROM communes 
		JOIN departements ON communes.num_departement == departements.num_departement 
		WHERE departements.num_region == r.num_region AND
		communes.nom LIKE "%a%" AND 
		communes.nom LIKE "%e%" AND 
		communes.nom LIKE "%i%" AND 
		communes.nom LIKE "%o%" AND 
		communes.nom LIKE "%u%" AND 
		communes.nom LIKE "%y%"
	);

-- 51 --
SELECT c.nom FROM communes AS c 
	JOIN departements AS d ON c.num_departement == d.num_departement 
	WHERE NOT INSTR(UPPER(c.nom),UPPER(d.nom)) AND 
	EXISTS ( SELECT nom AS n FROM departements 
		  WHERE INSTR((c.nom),(n))); 
-- Sans EXISTS
SELECT c.nom FROM communes as c
	JOIN departements AS d ON c.num_departement != d.num_departement AND 
				  INSTR(UPPER(c.nom), UPPER(d.nom));	

-- 52 --

SELECT num_departement, nom, population_2010 FROM communes 
	JOIN ( SELECT num_departement AS n, MAX(population_2010) AS p FROM communes
		GROUP BY n
		HAVING p >= 200000
	) ON population_2010 == p;	

-- Plus simple
SELECT d.num_departement, c.nom, MAX(population_2010) FROM departements AS d y
	JOIN communes AS c ON c.num_departement = d.num_departement AND population_2010 >= 200000
	GROUP BY d.num_departement;	

-- 53 -- 
SELECT SUBSTR(nom,1,1) AS l, nom, num_departement, surface FROM communes
	JOIN ( SELECT MAX(surface) AS s, SUBSTR(nom,1,1) AS l2 FROM communes 
		WHERE num_departement <= 95
		GROUP BY l2
	) ON l == l2 AND surface == s 
	ORDER BY l;

-- Plus simple, mais si deux communes avaient la même surface, une seule serait renvoyée
SELECT SUBSTR(nom,1,1) AS l, nom, num_departement, MAX(surface) FROM communes
	WHERE num_departement <= 95
	GROUP BY l;

-- 54 --
SELECT num_departement, nom, (population_1999-population_2010) AS diminution FROM communes
	JOIN ( SELECT MAX(population_1999-population_2010) AS d, num_departement AS n FROM communes
		GROUP BY n
	) ON num_departement == n AND diminution == d;	

-- Plus simple, mais ne renvoie qu'une seule des communes dont la population à le plus diminué  
SELECT num_departement, nom, MAX(population_1999-population_2010) AS diminution FROM communes	
	GROUP BY num_departement;

-- 55 --
SELECT (100.*sc)/SUM(population_2010) from communes 
	JOIN ( SELECT SUM(population_2010) AS sc FROM communes
		WHERE population_2010 >= 2000
	);

-- 56 -- 
SELECT (100.*COUNT(*)) / (SELECT COUNT(*) FROM communes) FROM communes
	WHERE nom LIKE "%saint%";

SELECT (100.*COUNT(*)) / (SELECT COUNT(*) FROM communes) FROM communes
	WHERE nom LIKE "%ville%";

SELECT (100.*COUNT(*)) / (SELECT COUNT(*) FROM communes) FROM communes
	WHERE nom LIKE "%sur%";

-- 57 --
SELECT nom, population_2010 FROM (
		SELECT nom, population_2010 FROM communes
		ORDER BY population_2010 DESC 
		LIMIT 2)
	ORDER BY population_2010 ASC 
	LIMIT 1;

-- Ou avec les fonctions déja existantes
SELECT nom, population_2010 FROM communes
	ORDER BY population_2010 DESC
	LIMIT 1 OFFSET 1;


-- 58 --
SELECT c.* FROM departements AS d
	JOIN ( SELECT num_departement, canton, SUM(population_2010) AS p, nom, MAX(population_2010) FROM communes 
		GROUP BY num_departement,canton) AS c ON c.num_departement == d.num_departement
	ORDER BY c.p LIMIT 10;;
