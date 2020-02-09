CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

CREATE TABLE IF NOT EXISTS Teachers (
    ID varchar(255) NOT NULL,
    NAME varchar(255),
    SURNAME varchar(255),
    USERNAME varchar(255) NOT NULL UNIQUE,
    PASSWORD varchar(255) NOT NULL,
    EMAIL varchar(255),
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Students (
	ID varchar(255) NOT NULL,
	NAME varchar(255),
	SURNAME varchar(255),
	FATHERNAME varchar(255),
	GRADE real,
	MOBILENUMBER varchar(255),
	Birthday date,
	PRIMARY KEY (ID)
)

INSERT INTO `Teachers` (`ID`, `NAME`, `SURNAME`, `USERNAME`, `PASSWORD`, `EMAIL`) VALUES ('456457', 'Panagiotis', 'Giannakopoulos', 'pgiannakopoulos', '12345678', 'panagiotis@email.com')
INSERT INTO `Students` (`ID`, `NAME`, `SURNAME`, `FATHERNAME`, `GRADE`, `MOBILENUMBER`, `Birthday`) VALUES ('46457596', 'Nikos', 'Nikolopoulos', 'Kostas', '10', '6901234567', '2020-02-19')