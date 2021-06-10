CREATE DATABASE JongerenKansrijker;
USE JongerenKansrijker;

-- Tables
CREATE TABLE instituut
(
    instituutcode INT AUTO_INCREMENT NOT NULL,
    instituut VARCHAR(40) NOT NULL,
    instituuttelefoon VARCHAR(18),
    PRIMARY KEY (instituutcode)
);

CREATE TABLE jongere
(
    jongerecode INT AUTO_INCREMENT NOT NULL,
    roepnaam VARCHAR(20) NOT NULL,
    tussenvoegsel VARCHAR(7),
    achternaam VARCHAR(25) NOT NULL,
    inschrijfdatum DATE NOT NULL,
    PRIMARY KEY (jongerecode)
);

CREATE TABLE jongereinstituut
(
    jongereinstituutid INT AUTO_INCREMENT NOT NULL,
    startdatum DATE NOT NULL,
    jongerecode INT,
    instituutcode INT,
    PRIMARY KEY (jongereinstituutid),
    FOREIGN KEY (jongerecode) REFERENCES jongere(jongerecode),
    FOREIGN KEY (instituutcode) REFERENCES instituut(instituutcode)
);

CREATE TABLE activiteit
(
    activiteitcode INT AUTO_INCREMENT NOT NULL,
    activiteit VARCHAR(40) NOT NULL,
    PRIMARY KEY (activiteitcode)
);

CREATE TABLE jongereactiviteit
(
    startdatum DATE NOT NULL,
    afgerond TINYINT,
    jongerecode INT,
    activiteitcode INT,
    FOREIGN KEY (jongerecode) REFERENCES jongere(jongerecode),
    FOREIGN KEY (activiteitcode) REFERENCES activiteit(activiteitcode)
);

-- Kan mogelijk nog een overzicht bij toevoegen? Niet 100% zeker
CREATE TABLE medewerker
(
    medewerkerid INT AUTO_INCREMENT NOT NULL,
    medewerkernaam VARCHAR(20) NOT NULL,
    medewerkertussenvoegsel VARCHAR(10),
    medewerkerachternaam VARCHAR(30) NOT NULL,
    medewerkergeboortedatum DATE NOT NULL,
    PRIMARY KEY (medewerkerid)
);
