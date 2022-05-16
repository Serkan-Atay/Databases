/*
	Try to DELETE a plz of your plz table on … 
 
	a. … which you have a reference out of your table person. 
    b. … which you haven’t got a reference out of your table person. 
	What is happening and why? 
*/
-- Displays which plz_id are used from plz
SELECT DISTINCT plz_id
FROM person;

DELETE 
FROM plz
WHERE id = 10032
;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`db_ws_20`.`person`, CONSTRAINT `fk_person2pl` FOREIGN KEY (`plz_id`) REFERENCES `plz` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT)
DELETE 
FROM plz
WHERE id = 14957
;

/*
b. What is happening and why?

-Because UPDATE and DELETE are restricted based on FOREIGN KEY, the operations are not possible if there exists a reference in the child table.
*/

-- 2.a CREATE a new Table anrede with the following settings: 
CREATE TABLE anrede
(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Anrede VARCHAR(20) NOT NULL    
);
-- 2.b. Add in your table anrede the following two attributes id 0, 1 | anrede herr, frau
INSERT INTO anrede(ID,Anrede)
VALUES(0,'Herr'),
(1,'Frau');

UPDATE anrede
SET ID = 1
WHERE anrede = 'Frau'
;

UPDATE anrede
SET ID = 0
WHERE anrede = 'Herr'
;

SELECT * FROM anrede;

/* 
Add now a constraint with the name fk_person2anrede and
set the anrede as a FOREIGN KEY from the table person which REFERENCES to the id from anrede.
Please use RESTRICT for UPDATE & DELETE! 
*/

ALTER TABLE person
	ADD CONSTRAINT fk_person2anred
    FOREIGN KEY(anrede)
    REFERENCES anrede(ID)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
;

/*


*/