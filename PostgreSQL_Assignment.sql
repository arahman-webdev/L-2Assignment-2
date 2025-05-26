-- Active: 1747648890294@@127.0.0.1@5432@conservation_db


-- Problem - 1

INSERT INTO rangers(name, region)
VALUES('Derek Fox', 'Coastal Plains')



-- Problem - 2 

SELECT COUNT(DISTINCT species_id) FROM sightings;


-- Problem - 3

SELECT * FROM sightings
WHERE location LIKE '%Pass%';

-- Problem - 4


SELECT rangers.name, COUNT(sightings.sighting_id) AS total_sigtings
FROM sightings
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY  rangers.name;



-- Problem - 5


SELECT species.common_name
FROM species
Left JOIN sightings ON sightings.species_id = species.species_id  
WHERE sightings.species_id IS NULL;


-- Problem - 6

SELECT common_name, sighting_time, name
FROM sightings
INNER JOIN species ON sightings.species_id = species.species_id
INNER JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sighting_time DESC
LIMIT 2

-- Problem - 7

UPDATE species
SET conservation_status = 'Historic'
WHERE DATE (discovery_date) < '1800-01-01'


-- Problem - 8

SELECT sighting_id, sighting_time FROM sightings;

SELECT sighting_id,
CASE 
    WHEN date_part('hour', sighting_time) BETWEEN 5 AND 12 THEN  'Morning'
    WHEN date_part('hour', sighting_time) BETWEEN 13 AND 17 THEN  'Afternoon'
    WHEN date_part('hour', sighting_time) > 17 THEN  'Evening'
    ELSE  'Unknown'
END AS time_of_day
FROM sightings;



-- Problem - 9



DELETE FROM rangers
WHERE NOT EXISTS
(SELECT 1 FROM sightings WHERE sightings.ranger_id = rangers.ranger_id);


