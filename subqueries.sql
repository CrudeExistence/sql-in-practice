


-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT * 
FROM invoice 
WHERE invoice_id IN(
  SELECT invoice_id
  FROM invoice_line
  WHERE unit_price > 0.99
);

-- Get all playlist tracks where the playlist name is Music.

SELECT *
FROM playlist
WHERE playlist_id IN(
  SELECT playlist_id
  FROM playlist_track
  WHERE name = 'Music'
);


-- Get all track names for playlist_id 5.
-- track has track_id - name - album_id - media_type_id - genre_id
-- playlist has playlist_id and name
-- playlist_track has playlist_track_id - playlist_id - track_id

SELECT name
FROM track
WHERE track_id IN(
  SELECT track_id
  FROM playlist_track
  WHERE playlist_id = 5
 );

-- Get all tracks where the genre is Comedy.
-- genre_id 22 is comedy from genre 
-- from track

SELECT * 
FROM track
WHERE genre_id IN(
  SELECT genre_id
  FROM genre
  WHERE name = 'Comedy'
 );


-- Get all tracks where the album is Fireball.

SELECT *
FROM track
WHERE album_id IN(
  SELECT album_id
  FROM album
  WHERE title = 'Fireball'
 );

-- Get all tracks for the artist Queen ( 2 nested subqueries ).
-- Queen (name) - 51 (artist_id) from artist
-- 51 (artist_id) - album_id (*) - title(null) - album
-- track has track_id - name - album_id - media_type_id - genre_id

SELECT *
FROM track
WHERE album_id IN(
  SELECT album_id
  FROM album
  WHERE artist_id IN(
    SELECT artist_id
    FROM artist
    WHERE name = 'Queen'
  )
);
