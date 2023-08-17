INSERT INTO 
        animals (
            name,
            date_of_birth,
            escape_attempts,
            neutered,
            weight_kg
        )
VALUES
    ('Agumon', '2020-02-03', '0', TRUE, '10.23'),
    ('Gabumon', '2018-11-15', '2', TRUE, '8'),
    ('Pikachu', '2021-01-07', '1', FALSE, '15.04'),
    ('Devimon', '2017-05-12', '5', TRUE, '11');

INSERT INTO 
        animals (
            name,
            date_of_birth,
            escape_attempts,
            neutered,
            weight_kg
        )
VALUES
     ('Charmander', '2020-02-08', -11, FALSE, 0),
     ('Planetmon', '2021-11-15', -5.7, TRUE, 2),
     ('Squirtle', '1993-04-02', -12.13, FALSE, 3),
     ('Angemon', '2005-06-12', -45, TRUE, 1),
     ('Boarmon', '2005-06-07', 20.4, TRUE, 7),
     ('Blossom', '1998-10-13', 17, TRUE, 3),
     ('Ditto', '2022-05-14', 22, TRUE, 4);
     
     -- inserting data into owners table

     INSERT INTO owners (full_name, age)
     VALUES ('Sam Smith', 34),
            ('Jennifer Orwell', 19),
            ('Bob', 45),
            ('Melody Pond', 77),
            ('Dean Wischester', 14),
            ('Jodie Whittaker', 38);

    -- inserting data into spices table

    INSERT INTO species (name)
    VALUES ('Pokemon'),
           ('Digimon');

           -- Modifying inserted animals so it includes the species_id:
    -- if the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = (SELECT id FROM spices WHERE name = 'Digimon') WHERE name LIKE '%mon';

-- all other animals are Pokemon
UPDATE animals SET species_id = (SELECT id FROM spices WHERE name = 'Pokemon') WHERE species_id is NULL;

-- Modify your inserted animals to include owner information (owner_id):

-- Sam Smith owns Agumon

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith' LIMIT 1) WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell' LIMIT 1) WHERE name = 'Gabumon' OR name = 'Pikachu';

-- Bob owns Devimon and Plantmon.

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob' LIMIT 1) WHERE name = 'Devimon' OR name = 'Plantom';

-- Melody Pond owns Charmander, Squirtle, Blossom

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond' LIMIT 1) WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

-- Dean Winchester owns Angemon and Boarmon

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester' LIMIT 1) WHERE name = 'Angemon' OR name = 'Boarmon';

-- Insert data into vets table

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');
          
-- Insert data into the specilization's table
INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1),
       (3, 2),
       (3, 1),
       (4, 2);

-- Insert data into vist tables.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(5, 2, '2020-01-05'),
(5, 2, '2020-03-08'),
(5, 2, '2020-05-14'),
(3, 3, '2021-05-04'),
(6, 4, '2021-02-24'),
(8, 2, '2019-12-21'),
(8, 1, '2020-08-10'),
(8, 2, '2021-04-7'),
(10, 3, '2019-09-29'),
(9, 4, '2020-10-03'),
(9, 4, '2020-11-04'),
(4, 2, '2019-01-24'),
(4, 2, '2019-05-15'),
(4, 2, '2020-02-27'),
(4, 2, '2020-08-03'),
(7, 3, '2020-05-24'),
(7, 1, '2021-01-11');
