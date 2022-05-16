-- 1:	CREATE TABLE TEAMS
CREATE TABLE teams_one
(
id  INT PRIMARY KEY AUTO_INCREMENT,
team VARCHAR(45) NOT NULL
)
;

-- 2: Einfügen der Teams

INSERT INTO teams_one (team)
VALUES ('Italien'), ('Spanien'), ('Deutschland'), ('USA')
;

SELECT *
FROM teams_one
;
-- 3. Thetajoin
SELECT h.team AS HEIM, g.team AS GAST
FROM teams_one AS h
INNER JOIN teams_one AS g ON g.id > h.id
;

-- 4:	CREATE TABLE teams_two
CREATE TABLE teams_two
(
id  INT PRIMARY KEY AUTO_INCREMENT,
team VARCHAR(45) NOT NULL
)
;
-- 5: Einfügen der teams_two
INSERT INTO teams_two
VALUES (1, 'Italien'), (5, 'Türkei'), (6, 'Ghana')
;

SELECT *
FROM teams_two
;
-- 6. Thetajoin
-- a. Ermittlung alles Jobs die in teams und in teams_two drin sind
SELECT h.team
FROM teams_one AS h
INNER JOIN teams_two AS g ON h.id = g.id
;

-- b. Ermittlung alles Jobs die in teams drin sind, aber nicht in teams_two drin sind
SELECT h.team
FROM teams_one AS h
LEFT JOIN teams_two AS g ON h.id = g.id
WHERE g.id IS NULL
;

-- c. Ermittlung alles Jobs die in teams_two drin sind, aber nicht in teams drin sind
SELECT g.team
FROM teams_one AS h
RIGHT JOIN teams_two AS g ON h.id = g.id
WHERE h.id IS NULL
;

-- d. Ermittlung alles Teams beider Tabellen
SELECT team
FROM teams_two
UNION 
SELECT team
FROM teams_one
;

DROP TABLE teams_one;
DROP TABLE teams_two;
