--create a database
CREATE DATABASE LibraryDB;
GO

--use the database	
USE LibraryDB;
GO


--creating tables
CREATE TABLE Authors(
   author_id INT PRIMARY KEY,
   author_name VARCHAR(50),
   birth_year INT
);
GO

CREATE TABLE Publishers(
   publisher_id INT PRIMARY KEY,
   publisher_name VARCHAR(50),
   country VARCHAR(50)
);
GO

CREATE TABLE Books(
    book_id INT PRIMARY KEY,
	title VARCHAR(50),
	author VARCHAR(50),
	publication_year INT, 
	ISBN VARCHAR(50),
	author_id INT

	FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

--altering or adding constraints

ALTER TABLE Books 
ADD CONSTRAINT fk_authorID FOREIGN KEY (author_id) REFERENCES Authors(author_id) 

ALTER TABLE Books
ADD CONSTRAINT chk_publication_year CHECK (publication_year < 2000);

ALTER TABLE Authors
ADD CONSTRAINT chk_birth_year CHECK (birth_year < 2000);

---delete books table
DROP TABLE Books;

--Recreate table for books
CREATE TABLE Books(
    book_id INT PRIMARY KEY,
	title VARCHAR(50),
	author VARCHAR(50),
	publication_year INT CHECK (publication_year < 2000), 
	ISBN VARCHAR(50),
	author_id INT, 
	FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
