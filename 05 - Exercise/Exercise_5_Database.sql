-- Exercise 5
-- #############################################################
-- 1.	Your colleague from the marketing team needs some analysis. 
/* a.	***		*/
SELECT left(plz, 2) AS plz_kurz, count(*) AS qty
FROM plz
WHERE ort <> ''
	AND ort IS NOT NULL
GROUP BY plz_kurz
;    

-- #############################################################

-- #############################################################
/* b.	Create an overview with all unique ort names with 
		the qtys, how often you will find the ort in the 
        plz table – ordered by the quantity descending		*/

SELECT ort, COUNT(*) as qty
FROM plz
GROUP BY ort
ORDER BY qty DESC
;

-- #############################################################

/* c.	Create another overview (similar to b) where you get 
		to see all ort which are only once in your table!		*/

SELECT ort, COUNT(*) as qty
FROM plz
GROUP BY ort
HAVING qty = 1
;
-- #############################################################

-- #############################################################
/* d.	Your colleague saw in the last selection you gave him 
		(Exercise 4.6) that there haven’t been any plz 
		from Frankfurt am Main. 		*/
SELECT plz, ort
FROM plz
WHERE 	1=1 
	AND
        (		ort IN ('Berlin', 'Aachen')
			OR 	ort LIKE 'Frankfurt%'
        )
;
-- ODER
SELECT plz, ort
FROM plz
WHERE 	1=1 
	AND
        (		ort IN ('Berlin', 'Aachen', 'Frankfurt am Main', 'Frankfurt (Oder)')
        )
;
-- #############################################################


-- #############################################################
/* e.	Show your colleague the TOP three cities (highest). 
		TOP means – with the most plz		*/
SELECT ort, COUNT(*) AS qty
FROM plz
GROUP BY ort
ORDER BY qty DESC
LIMIT 1
;
-- #############################################################
