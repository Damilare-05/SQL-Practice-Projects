--using a database
USE DB;

--RELATIONAL MODEL
--link(https://notebook.zohopublic.com/public/notes/x8h2x36dc238b79ce477a95c97e95b8fb95b7)

--creating tables

--WINE TABLE
CREATE TABLE Wine(
numW INT PRIMARY KEY,
category VARCHAR(255),
year_ INT,
degree DECIMAL(10, 2)
);

--PRODUCER TABLE
CREATE TABLE Producer(
numP INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
region VARCHAR(50)
);

--HARVEST TABLE
CREATE TABLE Harvest(
numW INT,
numP INT,
quantity DECIMAL(10, 2)

FOREIGN KEY(numW) REFERENCES Wine(numW),
FOREIGN KEY(numP) REFERENCES Producer(numP)
);

--Changing the datatype of the quantity column to INT
ALTER TABLE Harvest
ALTER COLUMN quantity INT;

--INSERTING DATA

-- Sample data for the Wine table
INSERT INTO Wine (numW, category, year_, degree)
VALUES
    (1, 'Red', 2018, 13.5),
    (2, 'White', 2020, 11.8),
    (3, 'Rosé', 2019, 12.2);

-- Sample data for the Producer table
INSERT INTO Producer (numP, first_name, last_name, region)
VALUES
    (101, 'John', 'Smith', 'Bordeaux'),
    (102, 'Maria', 'Garcia', 'Sousse'),
    (103, 'Alex', 'Lee', 'Champagne');

-- Sample data for the Harvest table
INSERT INTO Harvest (numW, numP, quantity)
VALUES
    (1, 101, 500),  
    (2, 102, 300),  
    (3, 103, 700);  

--producer table
INSERT INTO Producer (numP, first_name, last_name, region)
VALUES
    (104, 'Emily', 'Johnson', 'Burgundy'),
    (105, 'Daniel', 'Martinez', 'Sousse'),
    (106, 'Sophia', 'Kim', 'Champagne'),
    (107, 'Oliver', 'Brown', 'Bordeaux'),
    (108, 'Emma', 'Nguyen', 'Alsace'),
    (109, 'Liam', 'Rodriguez', 'Sousse'),
	(110, 'Sophie', 'Brown', 'Bordeaux'),
    (111, 'William', 'Nguyen', 'Alsace'),
    (112, 'Emma', 'Rodriguez', 'Sousse'),
    (113, 'James', 'Kim', 'Champagne'),
    (114, 'Olivia', 'Martinez', 'Burgundy'),
    (115, 'Noah', 'Johnson', 'Bordeaux'),
    (116, 'Ava', 'Garcia', 'Sousse'),
    (117, 'Liam', 'Lee', 'Champagne'),
    (118, 'Isabella', 'Smith', 'Burgundy'),
    (119, 'Ethan', 'Jones', 'Alsace'),
    (120, 'Mia', 'Davis', 'Bordeaux');

--wine table
INSERT INTO Wine (numW, category, year_, degree)
VALUES
    (4, 'Red', 2017, 14.0),
    (5, 'White', 2019, 10.5),
    (6, 'Rosé', 2021, 11.7),
    (7, 'Red', 2022, 13.3),
    (8, 'White', 2023, 11.0),
    (9, 'Rosé', 2022, 12.5),
	(10, 'Red', 2023, 13.2),
    (11, 'White', 2022, 11.5),
    (12, 'Rosé', 2021, 12.8),
    (13, 'Red', 2020, 14.3),
    (14, 'White', 2019, 10.7),
    (15, 'Rosé', 2022, 11.9),
    (16, 'Red', 2018, 13.6),
    (17, 'White', 2021, 11.2),
    (18, 'Rosé', 2020, 12.1),
    (19, 'Red', 2019, 14.5),
    (20, 'White', 2023, 10.9);

--harvest table
INSERT INTO Harvest (numW, numP, quantity)
VALUES
    (4, 104, 600),   
    (5, 105, 400),  
    (6, 106, 550),   
    (7, 107, 480),  
    (8, 108, 620),  
    (9, 109, 520),
    (10, 110, 550),  
    (11, 111, 420),  
    (12, 112, 680), 
    (13, 113, 590),  
    (14, 114, 380),  
    (15, 115, 520),  
    (16, 116, 610),  
    (17, 117, 450), 
    (18, 118, 700),  
    (19, 119, 560),  
    (20, 120, 400);  

--overview of the tables
SELECT * FROM Wine;
SELECT * FROM Producer;
SELECT * FROM Harvest;

--4. Give the list the producers.
SELECT numP, first_name, last_name FROM Producer;

--5. Give the list of producers sorted by name.
SELECT first_name, last_name FROM Producer
ORDER BY first_name, last_name;

--6. Give the list the producers of Sousse.
SELECT numP, first_name, last_name, region FROM Producer
WHERE region = 'Sousse';

--7. Calculate the total quantity of wine produced having the number 12.
SELECT SUM(quantity) AS Sum_of_quantity FROM Harvest WHERE numW = 12;

--8. Calculate the quantity of wine produced by category.
SELECT category, SUM(quantity) as quantity FROM Wine
JOIN Harvest  ON
Wine.numW = Harvest.numW
GROUP BY category;

--9. Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters?
--We want the names and first names of the producers, sorted in alphabetical order.

SELECT first_name, last_name, quantity FROM Producer
JOIN Harvest ON 
Producer.numP = Harvest.numP
WHERE Producer.numP IN (
    SELECT numP FROM Harvest WHERE region = 'Sousse' AND quantity > 300
)
ORDER BY last_name, first_name;

--OR
SELECT first_name, last_name
FROM Producer
WHERE numP IN (
    SELECT numP FROM Harvest WHERE region = 'Sousse' AND quantity > 300
)
ORDER BY last_name, first_name;

--10. List the wine numbers that have a degree greater than 12 and
--that have been produced by producer number 24.

SELECT Wine.numW FROM Wine
JOIN  Harvest ON 
Wine.numW = Harvest.numW
JOIN Producer ON
Producer.numP =Harvest.numP
WHERE degree > 12 and Producer.numP = 24;

--OR

SELECT numW FROM Wine WHERE degree > 12
AND numW IN (SELECT numW FROM Harvest WHERE numP = 24);

