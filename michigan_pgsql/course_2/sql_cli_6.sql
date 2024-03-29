\copy track(title,artist,album,count,rating,len) FROM 'library.csv' WITH DELIMITER ',' CSV;

INSERT INTO album (title) 
SELECT DISTINCT album FROM track;
UPDATE track SET album_id = (
	SELECT album.id
       	FROM album WHERE album.title = track.album
);

INSERT INTO tracktoartist (track, artist) 
SELECT DISTINCT title, artist FROM track;

INSERT INTO artist (name)
SELECT DISTINCT artist FROM track;

UPDATE tracktoartist SET track_id = (
	SELECT track.id
	FROM track 
	WHERE track.title=tracktoartist.track
);
UPDATE tracktoartist SET artist_id = (
	SELECT artist.id
	FROM artist
	WHERE artist.name=tracktoartist.artist
);

-- We are now done with these text fields
ALTER TABLE track DROP COLUMN album;
ALTER TABLE track DROP COLUMN artist;
ALTER TABLE tracktoartist DROP COLUMN track;
ALTER TABLE tracktoartist DROP COLUMN artist;

SELECT track.title, album.title, artist.name
FROM track
JOIN album ON track.album_id = album.id
JOIN tracktoartist ON track.id = tracktoartist.track_id
JOIN artist ON tracktoartist.artist_id = artist.id
LIMIT 3;
