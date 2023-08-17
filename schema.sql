/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
ALTER TABLE animals
ADD
COLUMN species VARCHAR (50);

-- creating table owners

CREATE TABLE owners (
    id SERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(300),
    age INTEGER
);

-- creating spice tables

CREATE TABLE species (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100)
);

-- removing colum spices from table animals

ALTER TABLE animals DROP COLUMN species;
-- adding column spices_id which is a foreign key reference spices table

ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);
 -- Add column owner_id which is a foreign key referencing owners table

ALTER TABLE animals ADD COLUMN owner_id BIGINT REFERENCES owners(id); 

-- create a table named vets

CREATE TABLE vets (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    age INTEGER,
    date_of_graduation DATE
);

-- create a table named specilizations

CREATE TABLE specializations (
    vet_id INTEGER,
    species_id INTEGER,
    FOREIGN KEY (vet_id) REFERENCES vets (id),
    FOREIGN KEY (species_id) REFERENCES species (id)
);

-- add a unique constratint to the "id" column in the "animals" table:

ALTER TABLE animals ADD CONSTRAINT animals_id_unique UNIQUE (id);

-- creating a table named vists.

CREATE TABLE visits (
    animal_id INTEGER REFERENCES animals (id),
    vet_id INTEGER REFERENCES vets (id),
    date_of_visit DATE
);