CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

CREATE TABLE IF NOT EXISTS Teachers (
    ID varchar(255) NOT NULL,
    NAME varchar(255),
    SURNAME varchar(255),
    USERNAME varchar(255),
    PASSWORD varchar(255),
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