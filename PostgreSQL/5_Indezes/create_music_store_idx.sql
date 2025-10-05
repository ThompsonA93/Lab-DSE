SET search_path TO music_store;

CREATE INDEX idx_artist_name ON artists (artist_name);

CREATE INDEX idx_album_title ON albums (album_title);
