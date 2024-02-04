-- the first block would only work with a manual entry as the server db did have the right authorities
\COPY track_raw (title, artist, album, count, rating, len)
FROM 'library.csv'
WITH DELIMITER ',' CSV;

INSERT INTO album(title)
SELECT DISTINCT album
FROM  track_raw;

UPDATE track_raw SET album_id = (SELECT album.id FROM album WHERE album.title = track_raw.album);

INSERT INTO track(title, len, rating, count, album_id)
SELECT title, len, rating, count, album_id
FROM track_raw;

SELECT track.title, album.title
FROM track
         JOIN album ON track.album_id = album.id
ORDER BY track.title LIMIT 3;