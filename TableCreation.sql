CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(60) NOT NULL
);

DROP TABLE rangers

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL UNIQUE,
    discovery_date DATE CHECK (discovery_date <= CURRENT_DATE),
    conservation_status TEXT NOT NULL CHECK(
        conservation_status IN('Endangered', 'Vulnerable')
    )
);

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INT REFERENCES species(species_id)ON DELETE CASCADE,
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);

SELECT * FROM rangers

