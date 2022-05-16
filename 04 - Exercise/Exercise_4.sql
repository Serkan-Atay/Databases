-- 1 a.	How many attributes do you have? 
SELECT *
from plz;

DESC plz;

-- 1 b.	How many datasets do you have?
SELECT count(*)
from plz
;

SELECT MAX(id)
FROM plz;

SELECT count(*) AS 'total cloumns'
FROM information_schema.columns
WHERE table_name = 'plz' AND table_schema = 'db_ws_20'
;


-- 2 Select for your colleague from the states all plz and ort from plz. The new table should be ZIP & CITY
SELECT PLZ AS ZIP, Ort as City
FROM plz
;

-- 3.a Select all unique ort from plz
SELECT distinct Ort
FROM plz
;

-- 3.b. Select all unique ort from plz sorting by plz ascending
SELECT distinct Ort
from plz
order by Ort ASC
;

-- 3.c. Select all unique ort from plz sorting by ort descending
SELECT distinct Ort
from plz
order by Ort DESC
;

-- 4. How many unique cities do we have, which start with “BE…”
SELECT count( distinct Ort ) as amount
from plz
where Ort LIKE "BE%"
;

-- 5. Select all cities where the plz is between 60000 AND 91234
-- 	a. Use once the operator BETWEEN
-- 	b. and create a new query by using another operator
SELECT DISTINCT Ort as City
from plz
WHERE PLZ BETWEEN 60000 and 91234
;

SELECT DISTINCT ort as City
FROM plz
WHERE plz >= '60000' AND plz <= '91234'
ORDER BY plz
;

-- 6. Select all plz (by using the IN operator) from the following cities: Berlin Frankfurt Aachen
SELECT PLZ, Ort
from plz
WHERE Ort IN ("Frankfurt", "Aachen", "Berlin")
;

-- 7. Select all 4 digits unique cities from plz where are in this format 
SELECT DISTINCT Ort
from plz
WHERE Ort LIKE "B__N"
;

-- 8. Execute and tell why they are different results?
SELECT *
FROM plz
WHERE ort LIKE 'B__N' AND plz < '30000' OR ort ='Dietzenbach'
;

SELECT *
FROM plz
WHERE ort LIKE 'B__N' AND (plz < '30000' OR ort ='Dietzenbach')
;

