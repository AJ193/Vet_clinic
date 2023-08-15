/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * from animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT  date_of_birth FROM animals WHERE  (  name = 'Agumon'  OR name = 'Pikachu'  );
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
 SELECT * from animals WHERE neutered = TRUE;
 SELECT * from animals WHERE name != 'Gabumon';
 SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
 
-- begin transaction
BEGIN;

UPDATE animals SET species = 'unspecified';

-- verfying that change was made
SELECT * FROM animals;

--Roll back the change 
ROLLBACK;

-- verifying that the species columns went back to the state before the transaction.
SELECT * FROM animals;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;

BEGIN;

--Deleting all records
DELETE FROM animals;

-- rolling back the transcation
ROLLBACK;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SP1;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT MAX(escape_attempts), neutered FROM animals GROUP BY neutered;

SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';