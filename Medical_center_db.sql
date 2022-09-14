-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE Doctors
(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(15) UNIQUE NOT NULL,
    "phone_no" INT NOT NULL,
    "speciality" TEXT NOT NULL
);

CREATE TABLE Patients 
(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(15) UNIQUE NOT NULL,
    "dob" DATE NOT NULL,
    "insurance" TEXT
);

CREATE TABLE Doctors_Patients 
(
    "id" SERIAL PRIMARY KEY,
    "doctor_id" INT REFERENCES Doctors ON DELETE CASCADE,
    "patient_id" INT REFERENCES Patients ON DELETE CASCADE,
    "date_visited" DATE
);

CREATE TABLE Diseases 
(
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description" TEXT
);

CREATE TABLE Diagonses 
(
    "id" SERIAL PRIMARY KEY,
    "doctor_patient_id" INT REFERENCES Doctors_Patients ON DELETE CASCADE,
    "disease_id" INT REFERENCES Diseases ON DELETE SET NULL,
    "notes" TEXT
);


