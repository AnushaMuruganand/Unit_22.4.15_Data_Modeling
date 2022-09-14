DROP DATABASE IF EXISTS craiglist_db;

CREATE DATABASE craiglist_db;

\c craiglist_db;


CREATE TABLE Regions 
(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(15) NOT NULL
);

CREATE TABLE Users 
(
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR(20) UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    "region_id" INT NOT NULL REFERENCES Regions
);

CREATE TABLE Categories 
(
    "id" SERIAL PRIMARY KEY,
    "category_name" VARCHAR(25) NOT NULL
);

CREATE TABLE Posts 
(
    "id" SERIAL PRIMARY KEY,
    "title" TEXT   NOT NULL,
    "text" TEXT   NOT NULL,
    "loacation" TEXT   NOT NULL,
    "user_id" INT   NOT NULL REFERENCES Users ON DELETE CASCADE,
    "region_id" INT   NOT NULL REFERENCES Regions,
    "category_id" INT   NOT NULL REFERENCES Categories ON DELETE SET NULL
);


