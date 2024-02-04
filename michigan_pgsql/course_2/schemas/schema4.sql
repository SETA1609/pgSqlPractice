DROP TABLE unesco_raw;
CREATE TABLE unesco_raw(
    	name TEXT,
       	description TEXT,
       	justification TEXT,
       	year INTEGER,
	    longitude FLOAT,
       	latitude FLOAT,
       	area_hectares FLOAT,
    	category TEXT,
       	category_id INTEGER,
       	state TEXT,
       	state_id INTEGER,
    	region TEXT,
       	region_id INTEGER,
       	iso TEXT,
       	iso_id INTEGER
);
DROP TABLE category;

CREATE TABLE category (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);
DROP TABLE state;

CREATE TABLE state (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);
DROP TABLE region;

CREATE TABLE region (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);
DROP TABLE iso;

CREATE TABLE iso (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);
DROP TABLE unesco;

CREATE TABLE unesco(
	    name TEXT,
       	description TEXT,
       	justification TEXT,
       	year INTEGER,
	    longitude FLOAT,
       	latitude FLOAT,
       	area_hectares FLOAT,
       	category_id INTEGER,
       	state_id INTEGER,
   	    region_id INTEGER,
        iso_id INTEGER
);
