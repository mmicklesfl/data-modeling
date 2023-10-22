-- Create Database
DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

-- Create Patients Table
CREATE TABLE patients (
    id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    new BOOLEAN NOT NULL
);

-- Insert into Patients Table
INSERT INTO patients (id, first_name, last_name, dob, new) VALUES
(1, 'Anne', 'Hathaway', '1982-11-12', TRUE),
(2, 'Ash', 'Ketchum', '1997-05-22', TRUE),
(3, 'Alice', 'Cooper', '1948-02-04', FALSE),
(4, 'Randy', 'Marsh', '1960-04-20', TRUE);

-- Create Doctors Table
CREATE TABLE doctors (
    id INT PRIMARY KEY NOT NULL,
    npi VARCHAR(10) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(50) NOT NULL
);

-- Insert into Doctors Table
INSERT INTO doctors (id, npi, first_name, last_name, specialty) VALUES
(1, '1111111111', 'Shaquille', 'O''Neal', 'Cardiology'),
(2, '2222222222', 'Keanu', 'Reeves', 'Pulmonology'),
(3, '3333333333', 'Dolly', 'Parton', 'Oncology'),
(4, '4444444444', 'Paris', 'Hilton', 'Neurology');

-- Create Visits Table
CREATE TABLE visits (
    id INT PRIMARY KEY NOT NULL,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appt_timestamp TIMESTAMP NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

-- Insert into Visits Table
INSERT INTO visits (id, patient_id, doctor_id, appt_timestamp) VALUES
(1, 1, 1, '2023-10-20 14:30:00'),
(2, 2, 2, '2023-10-21 09:00:00'),
(3, 3, 3, '2023-10-22 15:45:00'),
(4, 4, 4, '2023-10-23 11:30:00');

-- Create Health Conditions Table
CREATE TABLE health_conditions (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- Insert into Health Conditions Table
INSERT INTO health_conditions (id, name) VALUES
(1, 'Diabetes'),
(2, 'High Blood Pressure'),
(3, 'Asthma'),
(4, 'Depression');

-- Create Diagnoses Table
CREATE TABLE diagnoses (
    id INT PRIMARY KEY NOT NULL,
    health_conditions_id INT NOT NULL,
    FOREIGN KEY (health_conditions_id) REFERENCES health_conditions(id)
);

-- Insert into Diagnoses Table
INSERT INTO diagnoses (id, health_conditions_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);
