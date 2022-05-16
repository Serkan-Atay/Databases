-- Exercise 6
-- #############################################################
-- 1.	CREATE a table person with the following attributes and settings. 

CREATE TABLE person
(
	id INT NOT NULL AUTO_INCREMENT,
    anrede INT NOT NULL,
    nnam VARCHAR(60) NOT NULL,
    vnam VARCHAR(60) NOT NULL,
    gebdat TIMESTAMP NOT NULL DEFAULT '2014-01-01 06:30:00',
    plz_id INT UNSIGNED,
    str VARCHAR(60) NOT NULL,
    tel VARCHAR(40) NOT NULL,
    mobil VARCHAR(40) NOT NULL,
    -- to use "AUTO_INCREMENT" you need a KEY - for our purpose we can use index
    index(id)
);

-- CREATE first the table with all his attributes and afterwords set the id as PRIMARY KEY.

-- Version 1
ALTER TABLE person
ADD CONSTRAINT pk_person
PRIMARY KEY (id)
;

-- Version 2
ALTER TABLE person
MODIFY COLUMN id INT PRIMARY KEY AUTO_INCREMENT
;

-- Hiermit kann die Tabelle person auf WUNSCH gelöscht werden!
-- DROP TABLE person;

-- 2.	Add now a constraint with the name fk_person2plz and 
--		set the plz_id as a FOREIGN KEY from the table person
--		which REFERENCES to the id from plz. Please 
--		use RESTRICT for UPDATE & DELETE!

ALTER TABLE person
ADD CONSTRAINT fk_person_plz_id
FOREIGN KEY (plz_id)
REFERENCES plz (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT
;

-- showing the table information
-- DESC person;

-- 3.	Add at least 10 datasets in your table person by using the INSERT INTO command 
-- inserting single datasets
INSERT INTO person (anrede, nnam, vnam, plz_id, str, tel, mobil)
-- anrede 0 = Frau 1 = Herr
VALUES (0, 'Müller', 'Julia', 10032, 'Musterstr. 12', '01235/63571162', '0912773');

-- inserting a dataset -> the attribute order is different to the table order!!!
INSERT INTO person (mobil, anrede, nnam, vnam, plz_id, str, tel)
-- anrede 0 = Frau 1 = Herr
VALUES ('01905527436', 1, 'Müller', 'Horst', 10032, 'Musterstr. 12', '01235/63571162');

-- inserting a dataset without using the attributenames
INSERT INTO person 
-- anrede 0 = Frau 1 = Herr
VALUES (3, 0,  'Sabba', 'Salvatore', '1980-10-06 02:30:30', 10032, 'Musterstr. 12', '01235/63571162', '76383');

-- inserting multiple datasets
INSERT INTO person (anrede, nnam, vnam, plz_id, str, tel, mobil)
-- anrede 0 = Frau 1 = Herr
VALUES (0, 'Müller', 'Julia', 10032, 'Musterstr. 12', '01235/63571162', '0912773'),
		(0, 'Müller', 'Julia', 10032, 'Musterstr. 12', '01235/63571162', '0912773'),
		(0, 'Müller', 'Julia', 10032, 'Musterstr. 12', '01235/63571162', '0912773'),
		(0, 'Müller', 'Julia', 10032, 'Musterstr. 12', '01235/63571162', '0912773'),        
		(0, 'Müller', 'Julia', 10032, 'Musterstr. 12', '01235/63571162', '0912773'),
		(0, 'Müller', 'Julia', 10032, 'Musterstr. 12', '01235/63571162', '0912773'),       
		(0, 'Müller', 'Julia', 10032, 'Musterstr. 12', '01235/63571162', '0912773')
;

-- ADDITIONAL:
--	inserting a dataset by using SELECT for an attribute value
INSERT INTO person (mobil, anrede, nnam, vnam, plz_id, str, tel)
-- anrede 0 = Frau 1 = Herr
VALUES ('01905527436', 1, 'Müller', 'Horst', (SELECT id from plz where plz ='63128'), 'Musterstr. 12', '01235/63571162');

-- Example Reference Integrity
SELECT max(id) FROM plz ;
-- MAX ID = 14956

-- we try to insert a dataset with plz_id = 14957
INSERT INTO person (plz_id, str, tel, mobil, anrede, nnam, vnam)
VALUES (14957, 'Landwehrstr. 17', '12345/678910', '09123456', 0, 'Sabba', 'Carmine')
;
/*
-- THIS HERE SHOULD BE DONE BY ALL OF YOU !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ALTER TABLE plz
DROP FOREIGN KEY fk_landid;
*/