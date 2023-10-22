-- Create Database
DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

-- Create Regions Table
CREATE TABLE regions (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- Insert Into Regions
INSERT INTO regions (id, name) VALUES
(1, 'Arlen, Texas'),
(2, 'Gotham City'),
(3, 'Planet Earth');
(4, 'waffle town')

-- Create Users Table
CREATE TABLE users (
    id INT PRIMARY KEY NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    preferred_region_id INT,
    FOREIGN KEY (preferred_region_id) REFERENCES regions(id)
);

--Insert Into Users
INSERT INTO users (id, username, email, preferred_region_id) VALUES
(1, 'StricklandPropane', 'hank@stricklandpropane.com', 1),
(2, 'vengeance', 'bruce@wayneenterprises.com', 2),
(3, 'MASTEROFALLHUMANS', 'zim@invadermail.com', 3),
(4, 'doooomydoomdoom', 'doom@doomydoom.doom', 3);

-- Create Categories Table
CREATE TABLE categories (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL
);

--Insert Into Categories
INSERT INTO categories (id, name) VALUES
(1, 'Computer Parts'),
(2, 'Automobiles'),
(3, 'Household');
(4, 'Rants & Raves')

-- Create Posts Table
CREATE TABLE posts (
    id INT PRIMARY KEY NOT NULL,
    title VARCHAR(100) NOT NULL,
    text TEXT NOT NULL,
    user_id INT NOT NULL,
    location VARCHAR(100) NOT NULL,
    region_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (region_id) REFERENCES regions(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

--Insert Into Posts
INSERT INTO posts (id, title, text, user_id, location, region_id, category_id) VALUES
(1, 'Irken Technology for Sale', 'Selling a useless a malfunctioning Irken SIR, a Standard-issue Information Retrieval robot. Contact Zim if interested.', 3, 'Zim''s HOUSE', 3, 2),
(2, '1965 Lincoln Futura For Sale', 'Selling my old Batmobile - I mean car... Pickup only.', 2, 'Wayne Enterprises, Inc.', 2, 2),
(3, 'Taste the meat, not the heat!', 'Overstock of propane tanks at Strickland Propane.', 1, 'Strickland Propane', 1, 3),
(4, 'Do u liek....wafflez??!', 'Greetings! :D I made wafflez!! O_o There''z WAFFLE in them. :3', 4, 'WaFfLEzz!!!', 3, 3);
