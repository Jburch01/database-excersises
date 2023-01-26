USE albums_db;
SHOW CREATE DATABASE albums_db;
SHOW Tables; 
DESCRIBE albums;
SELECT DISTINCT COUNT(artist) FROM albums;
SELECT release_date FROM albums ORDER BY release_date;
SELECT * FROM albums;

-- 3.
-- a. How many rows are in the albums table? 6 rows
-- b. How many unique artist names are in the albums table? 31 unique artist names
-- c. What is the primary key for the albums table? id 
-- d. What is the oldest release date for any album in the albums table? What is the most recent release date? 1967, 2011

-- 4. 
-- a. The name of all albums by Pink Floyd
SELECT * FROM albums WHERE artist = 'Pink Floyd';

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date FROM albums WHERE albums.name LIKE 'Sgt. Pepper%';

-- c. The genre for the album Nevermind
Select genre FROM albums WHERE albums.name = 'Nevermind';

-- d. Which albums were released in the 1990s
SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 1999;

-- e. Which albums had less than 20 million certified sales
SELECT * FROM albums WHERE sales < 20;

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
Select * FROM albums WHERE genre LIKE '%Rock%';