-- Examples for Joins and Subqueries
create schema music_store;

set search_path to music_store;

DROP TABLE IF EXISTS tracks, albums, artists, genres;

CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE genres  (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    album_title VARCHAR(200) NOT NULL,
    release_year INTEGER,
    artist_id INTEGER NOT NULL REFERENCES artists(artist_id),
    genre_id INTEGER REFERENCES genres(genre_id)
);

CREATE TABLE tracks  (
    track_id SERIAL PRIMARY KEY,
    track_title VARCHAR(200) NOT NULL,
    duration_seconds INTEGER,
    album_id INTEGER NOT NULL REFERENCES albums(album_id)
);

INSERT INTO artists (artist_name, country) VALUES
('Queen', 'UK'),
('Led Zeppelin', NULL),
('Adele', 'UK'),
('Metallica', 'USA'),
('Taylor Swift', 'USA'),
('The Beatles', NULL),
('Nirvana', NULL),
('Eagles', 'USA'),
('AC/DC', 'Australia'),
('Pink Floyd', NULL),
('The Lumineers', 'USA'),
('Phoebe Bridgers', 'USA');

INSERT INTO genres (genre_name) VALUES
('Rock'),
('Pop'),
('Metal'),
('Country'),
('Blues'),
('Classic Rock'),
('Alternative Rock'),
('Hard Rock'),
('Psychedelic Rock'),
('Folk'),
('Indie Folk');

INSERT INTO albums (album_title, release_year, artist_id, genre_id) VALUES
('A Night at the Opera', 1975, (SELECT artist_id FROM artists WHERE artist_name = 'Queen'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Led Zeppelin IV', 1971, (SELECT artist_id FROM artists WHERE artist_name = 'Led Zeppelin'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('21', 2011, (SELECT artist_id FROM artists WHERE artist_name = 'Adele'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop')),
('Master of Puppets', 1986, (SELECT artist_id FROM artists WHERE artist_name = 'Metallica'), (SELECT genre_id FROM genres WHERE genre_name = 'Metal')),
('Fearless', 2008, (SELECT artist_id FROM artists WHERE artist_name = 'Taylor Swift'), (SELECT genre_id FROM genres WHERE genre_name = 'Country')),
('News of the World', 1977, (SELECT artist_id FROM artists WHERE artist_name = 'Queen'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Black Album', NULL, (SELECT artist_id FROM artists WHERE artist_name = 'Metallica'), (SELECT genre_id FROM genres WHERE genre_name = 'Metal')),
('Abbey Road', 1969, (SELECT artist_id FROM artists WHERE artist_name = 'The Beatles'), (SELECT genre_id FROM genres WHERE genre_name = 'Classic Rock')),
('Nevermind', 1991, (SELECT artist_id FROM artists WHERE artist_name = 'Nirvana'), NULL),
('Hotel California', 1976, (SELECT artist_id FROM artists WHERE artist_name = 'Eagles'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Back in Black', 1980, (SELECT artist_id FROM artists WHERE artist_name = 'AC/DC'), (SELECT genre_id FROM genres WHERE genre_name = 'Hard Rock')),
('The Dark Side of the Moon', 1973, (SELECT artist_id FROM artists WHERE artist_name = 'Pink Floyd'), (SELECT genre_id FROM genres WHERE genre_name = 'Psychedelic Rock')),
('Brightside', NULL, (SELECT artist_id FROM artists WHERE artist_name = 'The Lumineers'), NULL);


INSERT INTO tracks (track_title, duration_seconds, album_id) VALUES
('Bohemian Rhapsody', 354, (SELECT album_id FROM albums WHERE album_title = 'A Night at the Opera')),
('Stairway to Heaven', 482, (SELECT album_id FROM albums WHERE album_title = 'Led Zeppelin IV')),
('Rolling in the Deep', 221, (SELECT album_id FROM albums WHERE album_title = '21')),
('Master of Puppets', NULL, (SELECT album_id FROM albums WHERE album_title = 'Master of Puppets')),
('You Belong With Me', 237, (SELECT album_id FROM albums WHERE album_title = 'Fearless')),
('We Will Rock You', 162, (SELECT album_id FROM albums WHERE album_title = 'News of the World')),
('Enter Sandman', 332, (SELECT album_id FROM albums WHERE album_title = 'Black Album')),
('The Unforgiven', 386, (SELECT album_id FROM albums WHERE album_title = 'Black Album')),
('Crazy Little Thing Called Love', 162, (SELECT album_id FROM albums WHERE album_title = 'News of the World')),
('Come Together', NULL, (SELECT album_id FROM albums WHERE album_title = 'Abbey Road')),
('Smells Like Teen Spirit', 301, (SELECT album_id FROM albums WHERE album_title = 'Nevermind')),
('Lithium', 256, (SELECT album_id FROM albums WHERE album_title = 'Nevermind')),
('Hotel California', 390, (SELECT album_id FROM albums WHERE album_title = 'Hotel California')),
('Highway to Hell', 208, (SELECT album_id FROM albums WHERE album_title = 'Back in Black')),
('You Shook Me All Night Long', 210, (SELECT album_id FROM albums WHERE album_title = 'Back in Black')),
('Money', 236, (SELECT album_id FROM albums WHERE album_title = 'The Dark Side of the Moon')),
('Comfortably Numb', 382, (SELECT album_id FROM albums WHERE album_title = 'The Dark Side of the Moon'));
