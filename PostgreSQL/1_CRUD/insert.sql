SET search_path TO music_store;

INSERT INTO artists (artist_name) VALUES
('Taylor Swift'),
('Kendrick Lamar'),
('Adele'),
('Daft Punk'),
('Pink Floyd'),
('The Beatles'),
('AC/DC'),
('Prince'),
('Miles Davis');

INSERT INTO artists (artist_name, city) VALUES
('Queen', 'London'),
('Metallica', 'Los Angeles'),
('Jimi Hendrix', NULL),
('Michael Jackson', 'Gary'),
('The Rolling Stones', 'London'),
('Vivaldi', 'Venice'),
('Norah Jones', NULL),
('Led Zeppelin', 'London'),
('Eagles', 'Los Angeles'),
('John Lennon', 'Liverpool'),
('Nirvana', 'Aberdeen'),
('Bob Dylan', 'Duluth'),
-- Artists with NULL names
(NULL, 'New York'),
(NULL, 'Manchester'),
(NULL, NULL),
(NULL, 'Rome'),
(NULL, 'Berlin'),
(NULL, 'Toronto');



INSERT INTO genres (genre_name) VALUES
('Rock'),
('Pop'),
('Metal'),
('Country'),
('Blues'),
('Jazz'),
('Classical'),
('Hip Hop'),
('Folk-Rock');

INSERT INTO albums (album_title, release_year, artist_id, genre_id) VALUES
('A Night at the Opera', 1975, (SELECT artist_id FROM artists WHERE artist_name = 'Queen'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Led Zeppelin IV', 1971, (SELECT artist_id FROM artists WHERE artist_name = 'Led Zeppelin'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('21', 2011, (SELECT artist_id FROM artists WHERE artist_name = 'Adele'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop')),
('Master of Puppets', 1986, (SELECT artist_id FROM artists WHERE artist_name = 'Metallica'), (SELECT genre_id FROM genres WHERE genre_name = 'Metal')),
('Fearless', 2008, (SELECT artist_id FROM artists WHERE artist_name = 'Taylor Swift'), (SELECT genre_id FROM genres WHERE genre_name = 'Country')),
('News of the World', 1977, (SELECT artist_id FROM artists WHERE artist_name = 'Queen'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Black Album', 1991, (SELECT artist_id FROM artists WHERE artist_name = 'Metallica'), (SELECT genre_id FROM genres WHERE genre_name = 'Metal')),
('Sgt. Pepper''s Lonely Hearts Club Band', 1967, (SELECT artist_id FROM artists WHERE artist_name = 'The Beatles'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('The Dark Side of the Moon', 1973, (SELECT artist_id FROM artists WHERE artist_name = 'Pink Floyd'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Kind of Blue', 1959, (SELECT artist_id FROM artists WHERE artist_name = 'Miles Davis'), (SELECT genre_id FROM genres WHERE genre_name = 'Jazz')),
('Thriller', 1982, (SELECT artist_id FROM artists WHERE artist_name = 'Michael Jackson'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop')),
('Back in Black', 1980, (SELECT artist_id FROM artists WHERE artist_name = 'AC/DC'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Exile on Main St.', 1972, (SELECT artist_id FROM artists WHERE artist_name = 'The Rolling Stones'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('The Four Seasons', 1723, (SELECT artist_id FROM artists WHERE artist_name = 'Vivaldi'), (SELECT genre_id FROM genres WHERE genre_name = 'Classical')),
('To Pimp a Butterfly', 2015, (SELECT artist_id FROM artists WHERE artist_name = 'Kendrick Lamar'), (SELECT genre_id FROM genres WHERE genre_name = 'Hip Hop')),
('Come Away with Me', 2002, (SELECT artist_id FROM artists WHERE artist_name = 'Norah Jones'), (SELECT genre_id FROM genres WHERE genre_name = 'Jazz')),
('Purple Rain', 1984, (SELECT artist_id FROM artists WHERE artist_name = 'Prince'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop')),
('Their Greatest Hits (1971–1975)', 1976, (SELECT artist_id FROM artists WHERE artist_name = 'Eagles'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Imagine', 1971, (SELECT artist_id FROM artists WHERE artist_name = 'John Lennon'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop')),
('Nevermind', 1991, (SELECT artist_id FROM artists WHERE artist_name = 'Nirvana'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Highway 61 Revisited', 1965, (SELECT artist_id FROM artists WHERE artist_name = 'Bob Dylan'), (SELECT genre_id FROM genres WHERE genre_name = 'Folk-Rock')),
('Past Masters', 1988, (SELECT artist_id FROM artists WHERE artist_name = 'The Beatles'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
(NULL, 1997, (SELECT artist_id FROM artists WHERE artist_name = 'Daft Punk'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop')),
(NULL, 2020, (SELECT artist_id FROM artists WHERE artist_name = 'Taylor Swift'), (SELECT genre_id FROM genres WHERE genre_name = 'Folk-Rock')),
(NULL, 1971, (SELECT artist_id FROM artists WHERE artist_name = 'Jimi Hendrix'), (SELECT genre_id FROM genres WHERE genre_name = 'Blues')),
(NULL, 1969, (SELECT artist_id FROM artists WHERE artist_name = 'The Rolling Stones'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
(NULL, 1992, (SELECT artist_id FROM artists WHERE artist_name = 'Prince'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop')),
(NULL, 2022, (SELECT artist_id FROM artists WHERE artist_name = 'Adele'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop')),
('Rumours', 1977, (SELECT artist_id FROM artists WHERE artist_name = 'Eagles'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('DAMN.', 2017, (SELECT artist_id FROM artists WHERE artist_name = 'Kendrick Lamar'), (SELECT genre_id FROM genres WHERE genre_name = 'Hip Hop')),
('Born in the U.S.A.', 1984, (SELECT artist_id FROM artists WHERE artist_name = 'Bob Dylan'), (SELECT genre_id FROM genres WHERE genre_name = 'Rock')),
('Synchronicity', 1983, (SELECT artist_id FROM artists WHERE artist_name = 'The Beatles'), (SELECT genre_id FROM genres WHERE genre_name = 'Pop'));


INSERT INTO tracks (track_title, duration_seconds, album_id) VALUES
('Bohemian Rhapsody', 354, (SELECT album_id FROM albums WHERE album_title = 'A Night at the Opera')),
('Stairway to Heaven', 482, (SELECT album_id FROM albums WHERE album_title = 'Led Zeppelin IV')),
('Rolling in the Deep', 221, (SELECT album_id FROM albums WHERE album_title = '21')),
('Master of Puppets', 515, (SELECT album_id FROM albums WHERE album_title = 'Master of Puppets')),
('You Belong With Me', 237, (SELECT album_id FROM albums WHERE album_title = 'Fearless')),
('We Will Rock You', 162, (SELECT album_id FROM albums WHERE album_title = 'News of the World')),
('Enter Sandman', 332, (SELECT album_id FROM albums WHERE album_title = 'Black Album')),
('The Unforgiven', 386, (SELECT album_id FROM albums WHERE album_title = 'Black Album')),
('Crazy Little Thing Called Love', 162, (SELECT album_id FROM albums WHERE album_title = 'News of the World')),
('Imagine', 192, (SELECT album_id FROM albums WHERE album_title = 'Imagine')),
('Smells Like Teen Spirit', 301, (SELECT album_id FROM albums WHERE album_title = 'Nevermind')),
('Like a Rolling Stone', 369, (SELECT album_id FROM albums WHERE album_title = 'Highway 61 Revisited')),
('Hey Jude', 431, (SELECT album_id FROM albums WHERE album_title = 'Past Masters')),
('Love of My Life', 217, (SELECT album_id FROM albums WHERE album_title = 'A Night at the Opera')),
('Black Dog', 294, (SELECT album_id FROM albums WHERE album_title = 'Led Zeppelin IV')),
('Someone Like You', 285, (SELECT album_id FROM albums WHERE album_title = '21')),
('Battery', 312, (SELECT album_id FROM albums WHERE album_title = 'Master of Puppets')),
('White Horse', 249, (SELECT album_id FROM albums WHERE album_title = 'Fearless'));

INSERT INTO playlists (playlist_name) VALUES
('Classic Rock Anthems'),
('Power Ballads'),
('90s Grunge'),
('Pop Hits 2011'),
('Thrash & Heavy Metal');


INSERT INTO playlist_tracks (playlist_id, track_id, track_order) VALUES
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Classic Rock Anthems'), (SELECT track_id FROM tracks WHERE track_title = 'Bohemian Rhapsody'), 1),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Classic Rock Anthems'), (SELECT track_id FROM tracks WHERE track_title = 'Stairway to Heaven'), 2),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Classic Rock Anthems'), (SELECT track_id FROM tracks WHERE track_title = 'We Will Rock You'), 3),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Pop Hits 2011'), (SELECT track_id FROM tracks WHERE track_title = 'Rolling in the Deep'), 1),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Pop Hits 2011'), (SELECT track_id FROM tracks WHERE track_title = 'Someone Like You'), 2),
((SELECT playlist_id FROM playlists WHERE playlist_name = '90s Grunge'), (SELECT track_id FROM tracks WHERE track_title = 'Smells Like Teen Spirit'), 1),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Power Ballads'), (SELECT track_id FROM tracks WHERE track_title = 'Bohemian Rhapsody'), 1),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Classic Rock Anthems'), (SELECT track_id FROM tracks WHERE track_title = 'Crazy Little Thing Called Love'), 4),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Classic Rock Anthems'), (SELECT track_id FROM tracks WHERE track_title = 'Black Dog'), 5),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Thrash & Heavy Metal'), (SELECT track_id FROM tracks WHERE track_title = 'Master of Puppets'), 1),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Thrash & Heavy Metal'), (SELECT track_id FROM tracks WHERE track_title = 'Enter Sandman'), 2),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Thrash & Heavy Metal'), (SELECT track_id FROM tracks WHERE track_title = 'Battery'), 3),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Thrash & Heavy Metal'), (SELECT track_id FROM tracks WHERE track_title = 'The Unforgiven'), 4),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Power Ballads'), (SELECT track_id FROM tracks WHERE track_title = 'Love of My Life'), 2),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Power Ballads'), (SELECT track_id FROM tracks WHERE track_title = 'Someone Like You'), 3),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Pop Hits 2011'), (SELECT track_id FROM tracks WHERE track_title = 'White Horse'), 3),
((SELECT playlist_id FROM playlists WHERE playlist_name = 'Classic Rock Anthems'), (SELECT track_id FROM tracks WHERE track_title = 'Imagine'), 6);


INSERT INTO company_branches (branch_name, city, established_date, parent_branch_id) VALUES
('Global Corporate HQ', 'London', '2000-01-01', NULL);

INSERT INTO company_branches (branch_name, city, established_date, parent_branch_id) VALUES
('Europe HQ', 'Paris', '2004-03-10', (SELECT branch_id FROM company_branches WHERE branch_name = 'Global Corporate HQ')),
('Asia HQ', 'Singapore', '2005-06-15', (SELECT branch_id FROM company_branches WHERE branch_name = 'Global Corporate HQ')),
('Americas HQ', 'New York', '2006-08-01', (SELECT branch_id FROM company_branches WHERE branch_name = 'Global Corporate HQ')),
('Africa HQ', 'Johannesburg', '2007-09-01', (SELECT branch_id FROM company_branches WHERE branch_name = 'Global Corporate HQ'));

INSERT INTO company_branches (branch_name, city, established_date, parent_branch_id) VALUES
('France National HQ', 'Marseille', '2010-01-15', (SELECT branch_id FROM company_branches WHERE branch_name = 'Europe HQ')),
('Japan National HQ', 'Tokyo', '2011-04-20', (SELECT branch_id FROM company_branches WHERE branch_name = 'Asia HQ')),
('Canada National HQ', 'Toronto', '2012-07-25', (SELECT branch_id FROM company_branches WHERE branch_name = 'Americas HQ')),
('Nigeria National HQ', 'Lagos', '2013-10-30', (SELECT branch_id FROM company_branches WHERE branch_name = 'Africa HQ'));

INSERT INTO company_branches (branch_name, city, established_date, parent_branch_id) VALUES
('Paris Office', 'Paris', '2015-02-01', (SELECT branch_id FROM company_branches WHERE branch_name = 'France National HQ')),
('Osaka Office', 'Osaka', '2016-05-06', (SELECT branch_id FROM company_branches WHERE branch_name = 'Japan National HQ')),
('Vancouver Office', 'Vancouver', '2017-08-11', (SELECT branch_id FROM company_branches WHERE branch_name = 'Canada National HQ')),
('Abuja Office', 'Abuja', '2018-11-16', (SELECT branch_id FROM company_branches WHERE branch_name = 'Nigeria National HQ'));

INSERT INTO company_branches (branch_name, city, established_date, parent_branch_id) VALUES
('Paris Retail Store A', 'Paris', '2020-03-20', (SELECT branch_id FROM company_branches WHERE branch_name = 'Paris Office')),
('Osaka Retail Store B', 'Osaka', '2021-06-25', (SELECT branch_id FROM company_branches WHERE branch_name = 'Osaka Office')),
('Vancouver Retail Store C', 'Vancouver', '2022-09-30', (SELECT branch_id FROM company_branches WHERE branch_name = 'Vancouver Office')),
('Paris Retail Store D', 'Paris', '2023-01-10', (SELECT branch_id FROM company_branches WHERE branch_name = 'Paris Office')),
('Paris Retail Store E', 'Paris', '2023-04-15', (SELECT branch_id FROM company_branches WHERE branch_name = 'Paris Office')),
('Osaka Retail Store F', 'Osaka', '2023-07-20', (SELECT branch_id FROM company_branches WHERE branch_name = 'Osaka Office')),
('Vancouver Retail Store G', 'Vancouver', '2023-10-25', (SELECT branch_id FROM company_branches WHERE branch_name = 'Vancouver Office')),
('Abuja Retail Store H', 'Abuja', '2024-01-30', (SELECT branch_id FROM company_branches WHERE branch_name = 'Abuja Office'));
