# Subqueries

## Der Music_Store

In `Subqueries/sql/music_store.sql` gibt es einige Befehle zum Erstellen und Füllen einer Testdatenbank. 
1. Erkläre den Zweck von `create schema music_store;`
2. Warum benötigt man `create search_path to music_store;`?
3. Erkläre den Aufbau der erstellten Datenbank mithilfe einer grafischen Darstellung.
4. Was ist der Zweck der `REFERENCES` Instruktion und wie funktioniert diese?

## Subqueries

[Subqueries](https://www.geeksforgeeks.org/postgresql/postgresql-subquery/) sind Abfragen die in anderen Abfragen eingebettet werden. 
Die Innere Abfrage läuft zuerst, berechnet ein Ergebnis, und liefert das Ergebnis an die äußere Abfrage weiter.

1. Betrachte den Unterschied folgender Abfrage. Überlege wie die einzelnen Abfragen die Daten erfassen, selektieren, und weitergeben.
```sql
SELECT
    al.album_title
FROM
    albums AS al
INNER JOIN
    artists AS a ON al.artist_id = a.artist_id
WHERE
    a.country = 'USA';
```
```sql
SELECT
    album_title
FROM
    albums
WHERE
    artist_id IN (
        SELECT artist_id
        FROM artists
        WHERE country = 'USA'
    );
```
2. Erkläre was folgende Abfragen tun.
```sql
SELECT
    album_title
FROM
    albums
WHERE
    artist_id IN (
        SELECT artist_id
        FROM artists
        WHERE country = 'Australia'
    );
```
```sql
SELECT
    genre_name
FROM
    genres
WHERE
    EXISTS (
        SELECT 1 FROM albums WHERE albums.genre_id = genres.genre_id
    );
```
2. Ein großer Vorteil von Subqueries ist die Struktur der Abfragen, da innere Abfragen unabhängig von den Äußeren Abfragen ausgeführt werden können. Versuche für folgende Abfragen zu ermitteln, was das Resultat der inneren Abfrage ist, und wie darauf die äußere Abfrage zu ihrem Ergebnis kommt.
```sql
SELECT
    artist_name
FROM
    artists
WHERE
    artist_id IN (
        SELECT artist_id
        FROM albums
        WHERE release_year = (
            SELECT release_year
            FROM albums
            WHERE album_title = 'Master of Puppets'
        )
    );
```
```sql
SELECT
    artist_name,
    (
        SELECT COUNT(*)
        FROM albums
        WHERE albums.artist_id = artists.artist_id
    ) AS album_count
FROM
    artists;
```
