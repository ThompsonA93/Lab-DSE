SET search_path TO music_store;

-- VACUUM deletes rows marked to be deleted.

CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    established_year INTEGER
);

INSERT INTO publishers (name, country, established_year)
SELECT
    'Publisher ' || g,
    CASE floor(random() * 3)
        WHEN 0 THEN 'USA'
        WHEN 1 THEN 'EU'
        ELSE 'CH'
    END,
    (random() * 50 + 1950)::int
FROM generate_series(1, 250000) g;

SELECT COUNT(*) FROM publishers;
SELECT pg_size_pretty(pg_relation_size('publishers')) AS size;

DELETE FROM publishers WHERE publisher_id <= 125000;

SELECT COUNT(*) FROM publishers;
SELECT pg_size_pretty(pg_relation_size('publishers')) AS size;

VACUUM FULL publishers;

SELECT COUNT(*) FROM publishers;
SELECT pg_size_pretty(pg_relation_size('publishers')) AS size;

DROP TABLE publishers;