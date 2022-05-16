-- Exercise 4
-- #############################################################
-- 1.	Select all data from your plz table!
/* a.	How many attributes do you have? */
SELECT * 
FROM plz;

DESC plz;

/* b.	How many datasets do you have? */
SELECT COUNT(*)
FROM plz;

SELECT MAX(id)
FROM plz;

SELECT count(*) AS 'total cloumns'
FROM information_schema.columns
WHERE table_name = 'plz' 
	 AND table_schema = 'db_ws_20'
    ;

-- #############################################################


-- #############################################################
-- 2.	Select for your colleague from the states all plz and ort from plz. The new table should in this format:
-- /* In ZIP he wants the plz and in city the ort values! */
SELECT plz AS zip, ort AS city
FROM plz;

-- #############################################################

-- #############################################################

-- 3.	Please do the following selection:
/* a.	Select all unique ort from plz */
SELECT DISTINCT ort
FROM plz
ORDER BY ort;
/* b.	Select all unique ort from plz sorting by plz ascending */
SELECT DISTINCT ort
FROM plz
ORDER BY plz;
/* c.	Select all unique ort from plz sorting by ort descending */
SELECT DISTINCT ort
FROM plz
ORDER BY ort DESC;
-- #############################################################


-- #############################################################
-- 4.	How many unique cities do we have, which start with “BE…”
SELECT count(DISTINCT ort) AS qty
FROM plz
WHERE ort LIKE 'BE%'
;

SELECT count(ort) AS qty_total, count(DISTINCT ort) AS qty
FROM plz
WHERE ort LIKE 'BE%'
;
-- #############################################################

-- #############################################################

-- #############################################################
-- 5.	Select all cities where the plz is between 60000 AND 91234.
/* a.	Use once the operator BETWEEN */
SELECT DISTINCT ort
FROM plz
WHERE plz BETWEEN '60000' AND '91234'
ORDER BY plz
;

/* b.	and create a new query by using another operator */
SELECT DISTINCT ort
FROM plz
WHERE plz >= '60000' AND plz <= '91234'
ORDER BY plz
;

-- #############################################################
-- 6.	Select all plz (by using the IN operator) from the following cities:
/* Berlin - Frankfurt - Aachen */

SELECT plz, ort
FROM plz
WHERE ORT IN ('Berlin', 'Frankfurt', 'Aachen')
;

-- #############################################################

-- #############################################################
-- 7.	Select all 4 digits unique cities from plz where are in this format  
/* B**N */
SELECT DISTINCT ort
FROM plz
WHERE ort LIKE 'B__N'
;

SELECT DISTINCT ort
FROM plz
WHERE ort LIKE 'B%N'
	AND length(ort) = 4
;
-- #############################################################

-- #############################################################
-- 8.	Execute the following queries:
/* a.	SELECT * FROM plz WHERE ort LIKE 'B__N' AND plz < '30000' OR ort = 'Dietzenbach'; */
SELECT * FROM plz WHERE ort LIKE 'B__N' AND plz < '30000' OR ort = 'Dietzenbach'; 
/* b.	SELECT * FROM plz WHERE ort LIKE 'B__N' AND (plz < '30000' OR ort = 'Dietzenbach'); */
SELECT * FROM plz WHERE ort LIKE 'B__N' AND (plz < '30000' OR ort = 'Dietzenbach')

-- #############################################################
