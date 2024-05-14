CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO



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


SELECT * FROM Books;