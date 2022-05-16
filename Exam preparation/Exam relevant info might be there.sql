CREATE TABLE person2
(
	name VARCHAR(30) NOT NULL
);
-- For the Database exam: 40 percent SQL programming + 21 percent Normalization and ER Modelling and rest theory
CREATE TABLE gender
(
	gender VARCHAR(2) NOT NULL
);

CREATE TABLE city
(
	city VARCHAR(30) NOT NULL
);

INSERT INTO person2
VALUES ('Salvatore Sabba'), ('Matthias Schubert'), ('Angela Merkel'), ('Sarah Conner');

INSERT INTO city
VALUES ('Manila'), ('Rom'), ('Istanbul'), ('Casablanca');

INSERT INTO gender
VALUES ('m'), ('w');

SELECT *
FROM gender;

-- SELECT *
-- FROM gender, city; 

-- RELATION: Person with name x1 (person2), which was born in x2 (city) and is x3 (gender)

CREATE TABLE person_multi
(
	SELECT *
    FROM gender, person2, city
    WHERE name = 'Salvatore Sabba'
		AND city = 'Rom'
        AND gender = 'm'
);