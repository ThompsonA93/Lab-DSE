# JOIN

- [JOIN](#join)
  - [Der Music\_Store](#der-music_store)
  - [JOINs](#joins)
  - [Theoriefragen](#theoriefragen)



## Der Music_Store

In `Joins/sql/music_store.sql` gibt es einige Befehle zum Erstellen und Füllen einer Testdatenbank.
1. Erkläre den Zweck von `create schema music_store;`
2. Warum benötigt man `create search_path to music_store;`?
3. Erkläre den Aufbau der erstellten Datenbank mithilfe einer grafischen Darstellung.
4. Was ist der Zweck der `REFERENCES` Instruktion und wie funktioniert diese?

## JOINs

[JOIN](https://www.postgresql.org/docs/current/tutorial-join.html) ermöglichen das Selektieren von multiplen Tabellen in einer Abfrage.

1. Erkläre wie folgende Abfragen funktionieren.
```sql
SELECT a.album_title, t1.artist_name
FROM albums AS a
JOIN artists AS t1 ON a.artist_id = t1.artist_id;
```

```sql
SELECT t.track_title, a.album_title, art.artist_name
FROM tracks AS t
JOIN albums AS a ON t.album_id = a.album_id
JOIN artists AS art ON a.artist_id = art.artist_id;
```
```sql
SELECT g.genre_name, COUNT(a.album_id) AS number_of_albums
FROM genres AS g
JOIN albums AS a ON g.genre_id = a.genre_id
GROUP BY g.genre_name
HAVING COUNT(a.album_id) > 1;
```

2. Schreibe Abfragen die folgende Informationen liefern:
   - Liste alle Alben und deren Artists
   - Liste alle Tracks und deren Alben
   - Liste alle Alben und deren Genre
   - Liste all Tracks und deren Alben als auch Artists
   - Selektiere Alben eines spezifischen Artists, z.b: Metallica

3. Es gibt unterschiedliche Arten des Joins. Erkläre den Unterschied folgender Abfragen.
```sql
SELECT
    a.artist_name,
    al.album_title
FROM
    artists AS a
(LEFT|RIGHT) JOIN
    albums AS al ON a.artist_id = al.artist_id;
```
```sql
SELECT
    al.album_title,
    g.genre_name
FROM
    albums AS al
(INNER|FULL OUTER) JOIN
    genres AS g ON al.genre_id = g.genre_id;
```
```sql
SELECT
    a.artist_name,
    g.genre_name
FROM
    artists AS a
CROSS JOIN
    genres AS g;
```
4. `JOIN`s werden sehr oft in Kombination mit Aggregatsfunktionen `COUNT`, `SUM`, `AVG`, `MAX`, `MIN` und Gruppierungen `GROUP BY` verwendet. Erkläre folgende Queries.
```sql
SELECT
    G.genre_name,
    COUNT(AL.album_id) AS number_of_albums
FROM
    genres AS G
LEFT JOIN
    albums AS AL ON G.genre_id = AL.genre_id
GROUP BY
    G.genre_name
ORDER BY
    number_of_albums DESC;
```
```sql
SELECT
    AL.album_title,
    SUM(T.duration_seconds) AS total_duration_seconds
FROM
    albums AS AL
INNER JOIN
    tracks AS T ON AL.album_id = T.album_id
WHERE
    AL.album_title = 'Led Zeppelin IV'
GROUP BY
    AL.album_title;
```
```sql
SELECT
    A.artist_name,
    AVG(T.duration_seconds) AS average_track_duration
FROM
    artists AS A
INNER JOIN
    albums AS AL ON A.artist_id = AL.artist_id
INNER JOIN
    tracks AS T ON AL.album_id = T.album_id
WHERE
    A.artist_name = 'Queen'
GROUP BY
    A.artist_name;
```

5. Schreibe folgende Abfragen mithilfe von `JOIN`:
   - Selektiere alle Artists und Alben. Angegebene Artists müssen mindestens ein Album haben. Sortiere das Resultat nach Name der Artists.
   - Selektiere Artists die kein Album haben. 
   - Finde Tracks ohne `duration_seconds`.
   - Liste alle Genres und zähle alle Alben per Genre.
   - Liste alle Alben und deren Tracks, unabhängig ob Album oder Track zugeordnet wurde.
   - Selektiere den längsten Track in Tracks mitsamt dessen Albumtitel.

## Theoriefragen

1. `INNER JOIN` gibt immer alle Werte aus, auch wenn diese NULL beinhalten.
2. Was ist ein sinnvoller Anwendungszweck für `FULL OUTER JOIN`?
3. Ein `CROSS JOIN` zwischen einer Tabelle A mit 5 Zeilen und einer Tabelle B mit 3 Zeilen ergibt eine Tabelle mit wievielen Zeilen?
4. Warum ist ein `FOREIGN KEY` wichtig für `JOIN`s?
