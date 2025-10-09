SET search_path TO music_store;

DROP TABLE IF EXISTS
    artists,
    genres,
    albums,
    tracks,
    playlists,
    playlist_tracks,
    company_branches,
    purchases,
    concerts,
    collaborations
    CASCADE;
