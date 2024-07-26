CREATE DATABASE IF NOT EXISTS magic_school;
CREATE USER IF NOT EXISTS 'wizard'@'%' IDENTIFIED BY '4230';
GRANT ALL PRIVILEGES ON magic_school.* TO 'wizard'@'%' IDENTIFIED BY '4230';
FLUSH PRIVILEGES;
USE magic_school;


CREATE TABLE IF NOT EXISTS wizards (
	wizard_id int NOT NULL AUTO_INCREMENT,
	wizards_name varchar(255) NOT NULL,
	PRIMARY KEY (wizard_id)
);

CREATE TABLE IF NOT EXISTS magic_instrument (
	magic_instrument_id int NOT NULL AUTO_INCREMENT,
	wizard_id int NOT NULL,
	type_of_instrument varchar(255) NOT NULL,
	type_of_magic varchar(255) NOT NULL,
	PRIMARY KEY (magic_instrument_id),
	FOREIGN KEY (wizard_id) REFERENCES wizards(wizard_id) on delete cascade
);

DELETE FROM wizards;
DELETE FROM magic_instrument;
ALTER TABLE wizards AUTO_INCREMENT = 1;
ALTER TABLE magic_instrument AUTO_INCREMENT = 1;

INSERT INTO wizards(wizards_name) VALUES
	('Zogratis'),
	('Julius'),
	('Asta');

INSERT INTO magic_instrument (wizard_id, type_of_instrument, type_of_magic) VALUES
	(1, 'grimore', 'gravity manipulation'),
	(2, 'grimore', 'time manipulation'),
	(3, 'sword', 'anti magic');
