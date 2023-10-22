-- Create Database
DROP DATABASE IF EXISTS starwars_league_db;
CREATE DATABASE starwars_league_db;
\c starwars_league_db;

-- Create Teams Table
CREATE TABLE teams (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    points INT NOT NULL DEFAULT 0
);

-- Insert into Teams
INSERT INTO teams (id, name) VALUES
(1, 'Rebel Alliance'),
(2, 'Galactic Empire');

-- Create Players Table
CREATE TABLE players (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(id)
);

-- Insert into Players
INSERT INTO players (id, name, team_id) VALUES
(1, 'Luke Skywalker', 1),
(2, 'Princess Leia', 1),
(3, 'Darth Vader', 2),
(4, 'Emperor Palpatine', 2);

-- Create Referees Table
CREATE TABLE referees (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- Insert into Referees
INSERT INTO referees (id, name) VALUES
(1, 'Yoda'),
(2, 'Obi-Wan Kenobi');

-- Create Matches Table
CREATE TABLE matches (
    id INT PRIMARY KEY NOT NULL,
    team1_id INT,
    team2_id INT,
    referee_id INT,
    match_date DATE NOT NULL,
    FOREIGN KEY (team1_id) REFERENCES teams(id),
    FOREIGN KEY (team2_id) REFERENCES teams(id),
    FOREIGN KEY (referee_id) REFERENCES referees(id)
);

-- Insert into Matches
INSERT INTO matches (id, team1_id, team2_id, referee_id, match_date) VALUES
(1, 1, 2, 1, '2023-10-10');

-- Create Goals Table
CREATE TABLE goals (
    id INT PRIMARY KEY NOT NULL,
    match_id INT,
    player_id INT,
    goal_time TIME NOT NULL,
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (player_id) REFERENCES players(id)
);

-- Insert into Goals
INSERT INTO goals (id, match_id, player_id, goal_time) VALUES
(1, 1, 1, '00:15:00'),
(2, 1, 3, '00:30:00'),
(3, 1, 1, '00:45:00');

-- Create Seasons Table
CREATE TABLE seasons (
    id INT PRIMARY KEY NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Insert into Seasons
INSERT INTO seasons (id, start_date, end_date) VALUES
(1, '2023-09-01', '2023-11-30');
