-- this first code should be manualy input as like before this db doesnt give students authorities to run it.
\copy unesco_raw(name,description,justification,year,longitude,latitude,area_hectares,category,state,region,iso) FROM 'whc-sites-2018-small.csv' WITH DELIMITER ',' CSV HEADER;

INSERT INTO category(name)
SELECT DISTINCT category
FROM  unesco_raw;

INSERT INTO state(name)
SELECT DISTINCT state
FROM  unesco_raw;

INSERT INTO region(name)
SELECT DISTINCT region
FROM  unesco_raw;

INSERT INTO iso(name)
SELECT DISTINCT iso
FROM  unesco_raw;

UPDATE unesco_raw
SET category_id = (
	SELECT category.id 
	FROM category 
	WHERE category.name = unesco_raw.category
);

UPDATE unesco_raw 
SET state_id = (
        SELECT state.id 
        FROM state 
        WHERE state.name = unesco_raw.state
);

UPDATE unesco_raw
SET region_id = (
        SELECT region.id
        FROM region
        WHERE region.name = unesco_raw.region
);

UPDATE unesco_raw
SET iso_id = (
        SELECT iso.id
        FROM iso
        WHERE iso.name = unesco_raw.iso
);

INSERT INTO unesco(
	name,
    description,
    justification,
	year,
    longitude,
    latitude,
	area_hectares,
	category_id,
	state_id,
	region_id,
	iso_id
)
SELECT  name,
        description,
        justification,
        year,longitude, 
        latitude,
        area_hectares,
        category_id,
        state_id,
        region_id,
        iso_id
FROM unesco_raw;
