SHOW DATABASES;

DROP DATABASE myTestDB;

CREATE DATABASE myTestDB;

USE myTestDB;
# -------------------------------------------------------------
#  Creating a base table" logins" & filling with content
# -------------------------------------------------------------
# drop table logins;
CREATE TABLE IF NOT EXISTS logins (
                                      loginID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                      user    VARCHAR(50) NOT NULL,
                                      passwd  VARCHAR(50) NOT NULL
);

INSERT INTO logins (loginID, user, passwd) VALUES (0, 'demir', 'prometheus');
INSERT INTO logins (loginID, user, passwd) VALUES (0, 'duerrenmatt', 'derphysiker');
INSERT INTO logins (loginID, user, passwd) VALUES (0, 'mickey', 'cute12');
INSERT INTO logins (loginID, user, passwd) VALUES (0, 'mini', 'detective');
INSERT INTO logins (loginID, user, passwd) VALUES (0, 'neo', 'bluepill');
INSERT INTO logins (loginID, user, passwd) VALUES (0, 'obama', 'yeswec4n');
INSERT INTO logins (loginID, user, passwd) VALUES (0, 'wurst', 'koncita');
INSERT INTO logins (loginID, user, passwd) VALUES (0, 'schweiger', 'manta');

SELECT * FROM logins;


/Users/volkandemir/Library/CloudStorage/OneDrive-BildungszentrumZürichsee/--- Latest Version ---/m290/themen/db/sql/bsp/lo_sql_feldstudie.sql
# -------------------------------------------------------------
#  Creating a base table" addresses" & filling with content
# -------------------------------------------------------------
# DROP TABLE addresses;
CREATE TABLE IF NOT EXISTS addresses (
                                         addressID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                         street      VARCHAR(255) NOT NULL,
                                         code        VARCHAR(10)  NOT NULL,
                                         town        VARCHAR (255) NOT NULL,
                                         country      VARCHAR(50) NOT NULL
);

INSERT INTO addresses (addressID, street, code, town, country) VALUES (0, 'Hauptstrasse 15'      , '8153', 'Dietikon', 'Schweiz');
INSERT INTO addresses (addressID, street, code, town, country) VALUES (0, 'Schlieremerstrasse 44', '1514', 'Vevey', 'Schweiz');
INSERT INTO addresses (addressID, street, code, town, country) VALUES (0, 'Zürcherstrasse 1'     , '8032', 'Birmensdorf', 'Confederation Helvetia');
INSERT INTO addresses (addressID, street, code, town, country) VALUES (0, 'In der Au 3'          , '8400', 'Winterthur', 'CH');
INSERT INTO addresses (addressID, street, code, town, country) VALUES (0, 'Am hohen Wasser 99'   , '4444', 'Kreuzlingen', 'Schweiz');
INSERT INTO addresses (addressID, street, code, town, country) VALUES (0, 'At the beach 4757'    , '15000', 'Oahu', 'USA');
INSERT INTO addresses (addressID, street, code, town, country) VALUES (0, 'Am Schlosspark 1'     , '1005', 'Wien', 'Austria');
INSERT INTO addresses (addressID, street, code, town, country) VALUES (0, 'Rennpiste 255'       , '43012', 'Oberhausen', 'DE');

SELECT * FROM addresses;

# -------------------------------------------------------------
#  Creating a base table" gender"
# -------------------------------------------------------------
CREATE TABLE IF NOT EXISTS gender (
                                      genderID    INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                      gender      VARCHAR(50) NOT NULL,
                                      abbrev      VARCHAR(5)
);

INSERT INTO gender (genderID, gender, abbrev) VALUES (0, 'female', 'fm');
INSERT INTO gender (genderID, gender, abbrev) VALUES (0, 'male', 'm');
INSERT INTO gender (genderID, gender, abbrev) VALUES (0, 'neutral', 'n');

SELECT * FROM gender;

# -------------------------------------------------------------
# Creating a relation table" persons" & filling with content
# The table has a foreign key to relate to thw gender table
# -------------------------------------------------------------
# drop table persons;
CREATE TABLE IF NOT EXISTS persons(
                                      personID  INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                      name      VARCHAR(255)        not null,
                                      surename  VARCHAR(255),
                                      birthdate char(10), # DD.MM.YYYY
                                      genderID    INT,
                                      FOREIGN KEY (genderID) REFERENCES gender(genderID)
);

# This base values for the inserts are completely made up, no truth in it at all
INSERT INTO persons (personID, name, surename, birthdate, genderID) VALUES (0, 'Demir', 'Volkan', '31.01.1969', 2);
INSERT INTO persons (personID, name, surename, birthdate, genderID) VALUES (0, 'Dürrenmatt', 'Friedrich', '05.01.1921', 2);
INSERT INTO persons (personID, name, surename, birthdate, genderID) VALUES (0, 'Maus', 'Mickey', '12.04.1990', 2);
INSERT INTO persons (personID, name, surename, birthdate, genderID) VALUES (0, 'Maus', 'Mini', '12.12.1990', 1) ;
INSERT INTO persons (personID, name, surename, birthdate, genderID) VALUES (0, 'Neo', 'Matrix', '31.12.1988', 2);
INSERT INTO persons (personID, name, surename, birthdate, genderID) VALUES (0, 'Wurst', 'Concita', '30.05.1992', 3);
INSERT INTO persons (personID, name, surename, birthdate, genderID) VALUES (0, 'Schweiger', 'Till', '28.09.1962', 2);
INSERT INTO persons (personID, name, surename, birthdate, genderID) VALUES (0, 'Obama', 'Barack', '04.08.1961', 2);

SELECT * FROM persons;

# Selecting content from 2 separate tables with one join
SELECT persons.personid, persons.name, persons.surename
     , persons.birthdate, gender.gender, gender.abbrev
FROM persons, gender
WHERE persons.genderID = gender.genderID
ORDER BY 1, 2; # order by second selected colum§# ASSIGNMENT 1

# ------------------------------------------------------------------------------------------------
# Assignments 03.11.2023
# ------------------------------------------------------------------------------------------------
# 1. Create a table "countries" (countryID, name, code)
# 2. INSERT at least 10 countries to the table countries
# 3. Change the table addresses: replace column "country" with the foreign key of the countries
# 4. Create new inserts for addresses, including countryID
# 5. Select all addresses including county data by using countryID as a join criteria

# ------------------------------------------------------------------------------------------------
# Assignments 10.11.2023
# ------------------------------------------------------------------------------------------------
# 6. Change the persons table in order to connect with the addresses
# 7. Insert data to persons including addressid
# 8. Select the persons data including addresses

# ------------------------------------------------------------------------------------------------
# Assignments 17.11.2023
# ------------------------------------------------------------------------------------------------
#  9. Select the persons data including addresses and the countries
# 10. Select the persons data including addresses, countries and gender
# 11. Connect the logins with the persons table
# 12. Create new persons data including logins
# 13. Select the persons data including addresses, countries, gender and logins

# -------------------------------------------------------------
# 1. CREATE a table "countries" (countryID, name, code)
# -------------------------------------------------------------
# drop table countries;
CREATE TABLE countries (
                           countryID   INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
                           name        VARCHAR(255) NOT NULL,
                           code        VARCHAR(3)
);

# -------------------------------------------------------------
# 2. INSERT at least 10 countries to the table
# -------------------------------------------------------------
# Inserting of a several rows with one insert statement
INSERT INTO countries (countryID, name, code)
VALUES      (0, 'Schweiz', 'CH'),
            (0, 'Deutschland', 'DE'),
            (0, 'Vereinigte Staaten', 'USA'),
            (0, 'Österreich', 'AUS');

SELECT * from countries;

# -------------------------------------------------------------
# 3. change the table addresses: replace column "country" with the foreign key of the countries
# -------------------------------------------------------------
# 3.1 ---------------------------------------------------------
drop table persons;
drop table addresses;

# 3.2 ---------------------------------------------------------
CREATE TABLE addresses (
                           addressID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
                           street      VARCHAR(255) NOT NULL,
                           code        VARCHAR(10)  NOT NULL,
                           town        VARCHAR (255) NOT NULL,
                           countryID   INT,
                           FOREIGN KEY (countryID) REFERENCES countries(countryID)
);

# ------------------------------------------------------------------------------------------------
# 4. Create new inserts for addresses, including countryIDINSERT INTO addresses ( addressID, street, code, town, countryID)
VALUES  (0, 'Hauptstrasse 15'      , '8153' , 'Dietikon'   , 1),
        (0, 'Schlieremerstrasse 44', '1514' , 'Vevey'      , 1),
        (0, 'Zürcherstrasse 1'     , '8032' , 'Birmensdorf', 1),
        (0, 'In der Au 3'          , '8400' , 'Winterthur' , 1),
        (0, 'Am hohen Wasser 99'   , '4444',  'Kreuzlingen', 1),
        (0, 'At the beach'         , '15000', 'Oahu'       , 3),
        (0, 'Am Schlosspark'       , '1005' , 'Wien'       , 4),
        (0, 'Rennpiste 255'       , '43012' , 'Oberhausen' , 2);

select * from addresses;
select * from countries;

# -------------------------------------------------------------
# 5. Select all addresses including county data by using countryID as a join criteria
# -------------------------------------------------------------
SELECT a.street, a.code, a.town, c.name, c.code
FROM addresses a, countries c
WHERE a.countryID = c.countryID
ORDER BY 5; # order by second selected colum

# -------------------------------------------------------------
# 6. Select all addresses including county data by using countryID as a join criteria
# -------------------------------------------------------------
# 6.1 ---------------------------------------------------------
DROP TABLE persons;

# 6.2 ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS persons (
                                       personID    INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                       name        VARCHAR(255) NOT NULL,
                                       surename    VARCHAR(255),
                                       birthdate   CHAR(10), # DD.MM.YYYY
                                       genderID    INT,
                                       FOREIGN KEY (genderID) REFERENCES gender(genderID),
                                       addressID   INT,
                                       FOREIGN KEY (addressID) REFERENCES addresses(addressID)
);

SELECT * FROM persons;
select * from addresses;
# ------------------------------------------------------------------------------------------------
# 7. Insert data to persons including addressid
# ------------------------------------------------------------------------------------------------
INSERT INTO persons (personID, name, surename, birthdate, genderID, addressID)
VALUES            (0, 'Demir', 'Volkan', '31.01.1969', 2, 1)
     , (0, 'Dürrenmatt', 'Friedrich', '05.01.1921', 2, 2)
     , (0, 'Maus', 'Mickey', '12.04.1990', 2, 3)
     , (0, 'Maus', 'Mini', '12.12.1990', 1, 4)
     , (0, 'Neo', 'Matrix', '31.12.1988', 2, 5)
     , (0, 'Wurst', 'Concita', '30.05.1992', 3, 7)
     , (0, 'Schweiger', 'Till', '28.09.95', 2, 8)
     , (0, 'Obama', 'Barack', '04.08.1961', 2, 6);

SELECT * FROM persons;
# -------------------------------------------------
# 8. Select from 2 tables: addresses und persons
# ------------------------------------------------------------------------------------------------
SELECT p.name, p.surename, a.street, a.code, a.town
FROM persons p, addresses a
WHERE   p.addressID = a.addressID
ORDER BY 2;

# -------------------------------------------------------------
# 9. Select the persons data including addresses and the country
# -------------------------------------------------------------
SELECT p.name, p.surename, a.street, a.code, a.town, c.name, c.code
FROM persons p, addresses a, countries c
WHERE   p.addressID = a.addressID
  AND     a.countryID = c.countryID
ORDER BY 2; # order by second selected colum

# -------------------------------------------------------------
# 10. Select the persons data including the gender, addresses and the country
# -------------------------------------------------------------
SELECT p.name, p.surename, g.gender, a.code, a.town, c.code
FROM persons p, addresses a, countries c, gender g
WHERE   p.addressID = a.addressID
  AND     a.countryID = c.countryID
  AND     p.genderID = g.genderID
ORDER BY 2; #

# ------------------------------------------------------------------------------------------------
# 11. Connect the logins with the persons table
# ------------------------------------------------------------------------------------------------
# 11.1 -------------------------------------------------------------------------------------------
drop table persons;

# 11.2 -------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS persons (
                                       personID    INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                       name        VARCHAR(255) NOT NULL,
                                       surename    VARCHAR(255),
                                       birthdate   CHAR(10), # DD.MM.YYYY
                                       genderID    INT,
                                       FOREIGN KEY (genderID) REFERENCES gender(genderID),
                                       addressID   INT,
                                       FOREIGN KEY (addressID) REFERENCES addresses(addressID),
                                       loginID     INT,
                                       FOREIGN KEY (loginID) REFERENCES logins(loginID)
);
# ------------------------------------------------------------------------------------------------
# 12. Connect the logins with the persons table
# ------------------------------------------------------------------------------------------------
select * from persons;
INSERT INTO persons (personID, name, surename, birthdate, genderID, addressID, loginID)
VALUES            (0, 'Demir', 'Volkan', '31.01.1969', 2, 1, 1)
     , (0, 'Dürrenmatt', 'Friedrich', '05.01.1921', 2, 2, 2)
     , (0, 'Maus', 'Mickey', '12.04.1990', 2, 3, 3)
     , (0, 'Maus', 'Mini', '12.12.1990', 1, 4, 4)
     , (0, 'Neo', 'Matrix', '31.12.1988', 2, 5, 5)
     , (0, 'Wurst', 'Concita', '30.05.1992', 3, 7, 7)
     , (0, 'Schweiger', 'Till', '28.09.95', 2, 8, 8)
     , (0, 'Obama', 'Barack', '04.08.1961', 2, 6, 6);

select * from logins;

# ------------------------------------------------------------------------------------------------
# 12. Connect the logins with the persons table
# ------------------------------------------------------------------------------------------------
SELECT p.personid, p.name, p.surename, l.user, l.passwd, g.gender, a.code, a.town, c.code
FROM persons p, addresses a, countries c, gender g, logins l
WHERE   p.addressID = a.addressID
  AND     a.countryID = c.countryID
  AND     p.genderID = g.genderID
  AND     p.loginID = l.loginID
ORDER BY 2; #




SELECT a.street, a.code, a.town, c.name, c.code
FROM addresses a, countries c
WHERE a.countryID = c.countryID
ORDER BY 5; # order by fifth selected colum