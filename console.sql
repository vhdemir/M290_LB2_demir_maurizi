show databases;

create database m290_LB2;

use m290_LB2;

CREATE TABLE IF NOT EXISTS countries (
  countryID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  code VARCHAR(3)
);

INSERT INTO countries (countryID, name, code) VALUES
  (0, 'Schweiz', 'CH'),
  (0, 'Deutschland', 'DE'),
  (0, 'Vereinigte Staaten', 'USA'),
  (0, 'Österreich', 'AUS');

select * from countries;


CREATE TABLE IF NOT EXISTS addresses (
  addressID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  street VARCHAR(255) NOT NULL,
  code VARCHAR(10) NOT NULL,
  town VARCHAR (255) NOT NULL,
  countryID INT,
  FOREIGN KEY (countryID) REFERENCES countries(countryID)
);


