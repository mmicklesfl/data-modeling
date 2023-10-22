-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- Creating Artists Table
CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Creating Producers Table
CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Creating Albums Table
CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL
);

-- Creating Songs Table
CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER,
  FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- Creating Songs_Artists Table (Many-to-Many relationship between Songs and Artists)
CREATE TABLE songs_artists
(
  song_id INTEGER,
  artist_id INTEGER,
  PRIMARY KEY (song_id, artist_id),
  FOREIGN KEY (song_id) REFERENCES songs(id),
  FOREIGN KEY (artist_id) REFERENCES artists(id)
);

-- Creating Songs_Producers Table (Many-to-Many relationship between Songs and Producers)
CREATE TABLE songs_producers
(
  song_id INTEGER,
  producer_id INTEGER,
  PRIMARY KEY (song_id, producer_id),
  FOREIGN KEY (song_id) REFERENCES songs(id),
  FOREIGN KEY (producer_id) REFERENCES producers(id)
);

-- Inserting data into Artists Table
INSERT INTO artists (name) VALUES
('Rush'),
('TESSERACT'),
('Gordon Lightfoot');

-- Inserting data into Producers Table
INSERT INTO producers (name) VALUES
('Terry Brown'),
('Acle Kahney'),
('Joe Wissert');

-- Inserting data into Albums Table
INSERT INTO albums (title, release_date) VALUES
('Permanent Waves', '1980-01-01'),
('Altered State', '2013-05-27'),
('Sit Down Young Stranger', '1970-05-01');

-- Inserting data into Songs Table
INSERT INTO songs (title, duration_in_seconds, release_date, album_id) VALUES
('The Spirit of Radio', 298, '1980-01-01', 1),
('Of Mind: Exile', 523, '2013-05-27', 2),
('If You Could Read My Mind', 223, '1970-05-01', 3);

-- Inserting data into Songs_Artists Table
INSERT INTO songs_artists (song_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserting data into Songs_Producers Table
INSERT INTO songs_producers (song_id, producer_id) VALUES
(1, 1),
(2, 2),
(3, 3);
