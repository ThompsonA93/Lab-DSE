SET search_path TO music_store;

CREATE VIEW detailed_track_info AS
SELECT
    t.track_title,
    t.duration_seconds,
    a.album_title,
    art.artist_name,
    g.genre_name,
    a.release_year
FROM
    tracks t
JOIN
    albums a ON t.album_id = a.album_id
JOIN
    artists art ON a.artist_id = art.artist_id
LEFT JOIN
    genres g ON a.genre_id = g.genre_id;

SELECT * FROM detailed_track_info WHERE artist_name = 'Queen';
