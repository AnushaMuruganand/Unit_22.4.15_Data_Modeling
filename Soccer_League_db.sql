DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db;


CREATE TABLE Teams 
(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(25) UNIQUE  NOT NULL,
    "city" VARCHAR(20) NOT NULL,
    "Rankings" INT
);

CREATE TABLE Players 
(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(20)   NOT NULL,
    "dob" DATE   NOT NULL,
    "team_id" INT REFERENCES Teams
);

CREATE TABLE Referees 
(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(20) NOT NULL,
    "dob" DATE NOT NULL
);

CREATE TABLE Seasons 
(
    "id" SERIAL PRIMARY KEY,
    "start_date" DATE   NOT NULL,
    "end_date" DATE NOT NULL
);

CREATE TABLE Matches 
(
    "id" SERIAL PRIMARY KEY,
    "match_date" DATE NOT NULL,
    "start_time" TIME NOT NULL,
    "team1_id" INT REFERENCES Teams ON DELETE CASCADE,
    "team2_id" INT REFERENCES Teams ON DELETE CASCADE,
    "main_referee_id" INT REFERENCES Referees ON DELETE SET NULL,
    "assistant_referee_id" INT REFERENCES Referees ON DELETE SET NULL,
    "season_id" INT REFERENCES Seasons
);

CREATE TABLE Goals 
(
    "id" SERIAL PRIMARY KEY,
    "player_id" INT REFERENCES Players,
    "match_id" INT REFERENCES Matches,
    "no_of_goals" INT DEFAULT 0
);

CREATE TABLE Results
(
    "id" SERIAL PRIMARY KEY,
    "match_id" INT REFERENCES Matches ON DELETE CASCADE,
    "team_id" INT REFERENCES Teams ON DELETE SET NULL,
    "result" VARCHAR(10) NOT NULL
);


