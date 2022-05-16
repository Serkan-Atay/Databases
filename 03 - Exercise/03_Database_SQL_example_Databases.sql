-- 	Lecture:		DATABASE
--  Autor:			Salvatore Sabba
-- 	Date:			12.11.2019
--	Chapter:		SQL (1)


-- 1. simple SELECT
SELECT *
FROM plz
;
-- 2a. SELECT with attribute reduction
SELECT ort, plz
FROM plz
;

-- 2b. SELECT with attribute reduction - different output
SELECT plz, ort
FROM plz
;

-- 2c. SELECT with attribute reduction and ALIAS
SELECT plz AS zip, ort AS city
FROM plz
;

-- 3a. SELECT ort
SELECT ort
FROM plz
;
-- 3b. SELECT DISTINCT ort
SELECT DISTINCT ort
FROM plz
;
-- 4a. SELECT with WHERE condition (AND/OR)
SELECT *
FROM plz
WHERE ort = 'dieburg' OR ort = 'dietzenbach'
;
-- 4b. SELECT with WHERE condition (IN)
SELECT ort
FROM plz
WHERE ort IN ('dieburg', 'dietzenbach')
;
-- 4c. SELECT with WHERE condition (SELECT query)
SELECT ort
FROM plz
WHERE plz IN 
		(
			SELECT plz
			FROM plz
            WHERE plz LIKE '6%'
        )
;

-- 4d. SELECT with WHERE condition (BETWEEN)
SELECT DISTINCT ort
FROM plz
WHERE ort BETWEEN 'A' AND 'Au'
ORDER BY 1
;

-- 4e. SELECT with WHERE condition (LIKE) AND _ (underline)

SELECT plz, ort, length(ort) AS digits
FROM plz
WHERE ort LIKE 'W%h'
ORDER BY ort
;

SELECT plz, ort, length(ort) AS digits
FROM plz
WHERE ort LIKE 'W___h'
ORDER BY length(ort) DESC
-- ORDER BY 4 DESC
-- ORDER BY digits DESC
;

SELECT plz, ort, length(ort) AS digits
FROM plz
WHERE ort LIKE 'W___h'
ORDER BY ort
;
-- 5a. SELECT without brackets
SELECT *
FROM plz
WHERE 	NOT ort = 'Dietzenbach'
		AND	ort = 'Heusenstamm'
        OR  plz LIKE '631%'
;
-- 5b. SELECT with brackets V1
SELECT *
FROM plz
WHERE 	NOT ort = 'Dietzenbach'
		AND
		(
				ort = 'Heusenstamm'
			OR  plz LIKE '631%'
		)
;

-- 6a. SELECT GROUP BY ort
SELECT ort, count(*)
FROM	plz
GROUP BY ort
;
-- 6b. SELECT GROUP BY by using HAVING
SELECT ort, count(*) AS qty
FROM plz
GROUP BY ort
HAVING qty >= 30
ORDER BY qty DESC 
;

-- END OF LECTURE 25.11.2020

-- 7a. SELECT with MIN

-- 7b. SELECT with MIN

-- ### switch to VM! (copykund) ###
-- 8a. SELECT COUNT vm1 - name2 is empty

-- 8b. SELECT COUNT vm1 - name2 is NULL

-- 8C. SELECT COUNT vm1 - name2 is empty OR NULL 
