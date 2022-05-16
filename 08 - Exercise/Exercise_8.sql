-- You have received some new requisitions from your Marketing Manager. He decided to add some company informations. So please add the following attributes:
ALTER TABLE person
	ADD COLUMN company_name VARCHAR(30),
    ADD COLUMN str_company VARCHAR(60),
    ADD COLUMN plz_company_id INTEGER UNSIGNED,
    ADD COLUMN tel_company VARCHAR(40),
    ADD COLUMN url VARCHAR(45)
;

ALTER TABLE person
	ADD CONSTRAINT fk_person2plz_company
    FOREIGN KEY(plz_company_id)
    REFERENCES plz(id)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
;

SELECT * FROM person;
-- 2.a That’s why he wants you to fill the new fields (1a till 1f) with the existing private information (e.g. the address of the company is the same like the private). 
UPDATE person
SET str_company = str
;
UPDATE person
SET plz_company_id = plz_id
;
UPDATE person
SET tel_company = tel
;

-- b.	Please drop the attribute url.
ALTER TABLE person
DROP COLUMN url
;