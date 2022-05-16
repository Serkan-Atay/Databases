-- 1. CREATE a table person with the following attributes and settings:

CREATE TABLE person 
(
	ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	anrede INTEGER NOT NULL,
   	nnam VARCHAR(60) NOT NULL,
   	vnam VARCHAR(60) NOT NULL,
   	gebdat TIMESTAMP NOT NULL DEFAULT '2014-01-01 06:30:00',
   	plz_id INTEGER UNSIGNED,
   	str VARCHAR(60) NOT NULL,
   	tel VARCHAR(40) NOT NULL,
	mobil VARCHAR(40) NOT NULL
);

ALTER TABLE person
	ADD CONSTRAINT fk_person2pl
    FOREIGN KEY(plz_id) REFERENCES plz (id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
;


-- 0 Woman / 1 Men 
INSERT INTO person
VALUES(1, 'Smith', 'Herbert', '1990-02-19 14:30:00', 1, 'Hausweg 2', '234234', '0164724322'),
(1, 'Müller', 'Paul', '1991-02-13 14:30:00', 2, 'Blindenstr. 64', '423423', '01747241232'),
(1, 'Müller', 'Paul', '1991-06-13 13:30:00', 3, 'Merkurweg 23', '534223', '01647243234'),
(0, 'Turman', 'Anna', '1999-04-01 12:30:00', 4, 'Teichbachring 33', '21312', '016472234234'),
(1, 'Turman', 'Martin', '1999-04-01 12:30:00', 5, 'Martinhorn 33', '21312', '016472234234'),
(0, 'Weisbach', 'Annabel', '1993-03-01 17:30:00', 'Derandereweg 33', '21312', '016472234234'),
(1, 'Irgendeiner', 'Petro', '1999-12-01 12:30:00', 'Textbuch 3', '21312', '016472234234'),
(0, 'Mitleid', 'Maria', '1999-03-21 15:30:00', 1, 'Fahrweg 123', '21312', '016472234234'),
(0, 'BinNichtHier', 'Kiyan', '1999-04-01 14:30:00', 1, 'Kommnichtweghier 1', '21312', '016472234234'),
(0, 'Fahrrad', 'Bart', '1969-01-21 12:30:00', 1, 'Teichbach- 33', '21312', '016472234234')
;


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


SELECT *
FROM person
;

DELETE FROM person WHERE id;