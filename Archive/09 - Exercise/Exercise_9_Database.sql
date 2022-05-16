-- Exercise 9

-- Exkurs:	Erläuterung Natural JOIN

SELECT *
FROM team_one;

SELECT *
FROM team_two;


SELECT *
FROM team_one
NATURAL JOIN team_two;

SELECT t1.id, t1.team
FROM team_one t1
INNER JOIN team_two t2 ON t2.id = t1.id;

SELECT *
FROM vm2;

SELECT *
FROM vm2a;

SELECT *
FROM vm2 
NATURAL JOIN vm2a;

SELECT *
FROM vm2a 
NATURAL JOIN branche2;


-- #############################################################
-- 1.	Please use the JOIN Operator for the following requests: 
--	a.	Select the attributes plz and ort of the table plz, which are used in your table person!

SELECT DISTINCT pl.plz, pl.ort
FROM	plz AS pl
INNER JOIN person as pe ON pe.plz_id = pl.id
;

-- 	b. Select the attributes plz and ort of the table plz, which are not used in your table person!
SELECT count(DISTINCT pl.plz, pl.ort)
FROM	plz AS pl
LEFT JOIN person as pe ON pe.plz_id = pl.id
WHERE pe.plz_id IS NULL
;

--	c. Select all attributes of the table person with the attribute ort of the table plz
SELECT pe.*, pl.ort
FROM person as pe 
INNER JOIN plz AS pl ON pe.plz_id = pl.id
;


SELECT *
FROM team_one NATURAL JOIN team_two
;

SELECT *
FROM vm2 NATURAL JOIN vm2a
;

SELECT *
FROM vm2a NATURAL JOIN branche2 