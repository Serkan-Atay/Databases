-- Exercise 7
-- #############################################################
-- 1.	Try to DELETE a plz of your plz table on …
-- a. … which you have a reference out of your table person.

-- looking which plz_ids are used
SELECT DISTINCT plz_id
FROM person;

-- RESULT:	10032 & 10081

DELETE 
FROM plz
WHERE id = 10032
;
-- LÖSCHUNG wird nicht durchgeführt!

-- b. … which you haven’t got a reference out of your table person.

-- trying to delete the "NOT" used plz_id 13456
DELETE 
FROM plz
WHERE id = 14957
;

-- LÖSCHUNG wird durchgeführt!

-- 2. Table anrede
-- a. CREATE a new Table anrede with the following settings:
CREATE TABLE anrede
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    anrede VARCHAR(20) NOT NULL
);

-- b. Add in your table anrede the following two attributes:
INSERT INTO anrede (anrede)
VALUES ('Herr'), ('Frau')
;

UPDATE anrede
SET ID = 0
WHERE anrede = 'Frau'
;

UPDATE anrede
SET ID = 1
WHERE anrede = 'Herr'
;
-- c. Add now a constraint with the name fk_person2anrede and set the anrede as a FOREIGN KEY from the table person which REFERENCES to the id from anrede. Please use RESTRICT for UPDATE & DELETE!
ALTER TABLE person 
ADD CONSTRAINT fk_person_anrede_id
FOREIGN KEY (anrede)
REFERENCES anrede(id)
ON DELETE RESTRICT
ON UPDATE RESTRICT
;
