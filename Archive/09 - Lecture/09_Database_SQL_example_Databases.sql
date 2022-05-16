SELECT * FROM copykund.branche;

SELECT * FROM copykund.vm1
WHERE KDNR <= 120000;

SELECT * FROM copykund.vm1a;

CREATE TABLE vm2
(
SELECT * FROM copykund.vm1
WHERE KDNR <= 120000
);

CREATE TABLE vm2a
(
SELECT * FROM copykund.vm1a
WHERE KDNR <= 120000
);

CREATE TABLE branche2
(
SELECT * FROM copykund.branche
);

SELECT anredea, name1, strasse, plz, ort
FROM vm2;

SELECT kdnr, branche, email
FROM vm2a;

SELECT beschreibung
FROM branche2;

SELECT b.kdnr, a.anredea, a.name1, a.strasse, a.plz, a.ort, b.branche, b.email
FROM vm2 AS a
INNER JOIN vm2a AS b ON a.kdnr = b.kdnr
;

SELECT DISTINCT branche
FROM vm2a
ORDER BY 1
;

SELECT *
FROM branche2
;

SELECT b.*
FROM branche2 AS b
LEFT JOIN vm2a AS v ON v.BRANCHE = b.ID
WHERE v.branche IS NULL
;

-- QTY: 19868

/*
LÖSUNGEN
(1)	-- QTY: 19868
(2)	-- QTY: 19869
(3) -- QTY: 19867
*/

SELECT b.kdnr, a.anredea, a.name1, a.strasse, a.plz, a.ort, b.branche, b.email, br.beschreibung
FROM vm2 AS a
INNER JOIN vm2a AS b ON a.kdnr = b.kdnr
LEFT JOIN branche2 AS br ON b.branche = br.id
-- WHERE b.KDNR = 112000
;

SELECT *
FROM vm2a
WHERE KDNR = 112000
;
-- SON-37


UPDATE vm2a
SET branche = 'xxx'
WHERE KDNR = 112000
;

DELETE FROM branche2
WHERE id = 'xxx'
;

INSERT 