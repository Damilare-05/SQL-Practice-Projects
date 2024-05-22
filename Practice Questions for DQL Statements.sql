-- ***Practice Questions for Data Query Language (DQL) Statements***
USE BOOKSTORE;

SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Reviews;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1. Retrieve all authors.

SELECT author_name FROM Authors;

-- 2. Retrieve the names and email addresses of all customers.

SELECT name, email from Customers;

-- 3. List all books along with their authors' names.

SELECT author_name, title FROM Authors 
JOIN Books ON 
Authors.author_id = Books.author_id;

-- 4. Find all books published before the year 2000.

SELECT title, publication_year from Books WHERE publication_year < 2000;

-- 5. Get the total number of books written by British authors.

SELECT  COUNT(*) AS Number_of_books, nationality, author_name
FROM Authors JOIN Books ON 
Authors.author_id = Books.author_id
GROUP BY nationality, author_name
HAVING nationality = 'British';

--or

SELECT COUNT(*) AS Number_of_books
FROM Authors JOIN Books ON 
Authors.author_id = Books.author_id
WHERE nationality = 'British';

-- 6. Retrieve the titles of all books reviewed by 'John Doe'.

SELECT title, Customers.name FROM Books 
JOIN Reviews ON
Books.book_id = Reviews.book_id
JOIN Customers ON 
Customers.customer_id = Reviews.customer_id
WHERE name = 'John Doe';

-- 7. Find the average rating for each book.

SELECT  AVG(rating) AS Average_rating, title
FROM Reviews JOIN Books ON 
Reviews.book_id = Books.book_id
GROUP BY title;

-- 8. List all orders made in the year 2023.

SELECT title, order_date AS YEAR_2023 FROM Books
JOIN Orders ON 
Books.book_id = Orders.book_id 
WHERE YEAR(order_date) = 2023;

--or

SELECT title, YEAR(order_date) AS YEAR_2023 FROM Books
JOIN Orders ON 
Books.book_id = Orders.book_id 
WHERE YEAR(order_date) = 2023;

-- 9. Retrieve the most recent review for each book.
--no definite column to query this
-- 10. Find all customers who have never placed an order.

SELECT name FROM Customers
JOIN Orders ON 
Customers.customer_id = Orders.customer_id
WHERE Orders.customer_id is null;

-- 11. List the top 5 highest-rated books based on average ratings.

SELECT TOP 5 title, AVG(Rating) AS Average_rating 
FROM Books JOIN Reviews ON 
Books.book_id = Reviews.book_id
GROUP BY title
ORDER BY Average_rating DESC;

-- 12. Retrieve the details of all American authors.

SELECT * FROM Authors where nationality = 'American';

--or

SELECT Authors.author_id, author_name, nationality, title FROM Authors 
JOIN Books ON 
Authors.author_id = Books.author_id
where nationality = 'American';

-- 13. Find the total number of orders placed by each customer.

SELECT name, COUNT(*) as Total_order_by_each_customer FROM Orders 
JOIN Customers ON
Orders.customer_id = Customers.customer_id
GROUP BY order_id, name;

-- 14. List the titles of all books and their corresponding review texts.

SELECT title, review_text FROM Books
JOIN Reviews ON 
Books.book_id = Reviews.book_id;

-- 15. Retrieve the names of all authors who have written more than one book.

SELECT author_name FROM Authors
WHERE author_id IN (SELECT author_id FROM Books GROUP BY author_id HAVING COUNT(*) > 1);

-- 16. Retrieve all books with the word 'the' in the title (case-insensitive).

SELECT title FROM Books WHERE title LIKE 'The%' OR title LIKE '%the%';

--OR
SELECT title FROM Books WHERE title LIKE '%the%'

-- 17. Find all customers whose email addresses end with 'example.com'.

SELECT name, email FROM Customers
WHERE email like '%example.com';

-- 18. Retrieve the names and birthdates of customers born in the 1980s.

SELECT name, birthdate FROM Customers
WHERE YEAR(birthdate) like '198%';

-- 19. List all authors from either the 'British' or 'American' nationality using a set operator.

SELECT author_name, nationality from Authors WHERE nationality = 'British'
UNION 
SELECT author_name, nationality from Authors WHERE nationality = 'American';

-- 20. Retrieve the titles and publication years of books published after 2000 but not in 2023 using a set operator.

SELECT title, publication_year FROM Books WHERE publication_year > 2000
EXCEPT 
SELECT title, publication_year FROM Books WHERE publication_year = 2023

-- 21. Find all books whose titles start with 'The'.

SELECT title FROM Books WHERE title LIKE 'The%';

-- 22. Retrieve the titles of books and their genres where the genre contains 'Fiction'.

SELECT title, genre FROM Books WHERE genre = 'Fiction';

-- 23. List the names of customers who have either 'John' or 'Jane' in their name.

SELECT name FROM Customers WHERE name LIKE '%JOHN%' OR name LIKE '%JANE%';

-- 24. Find all authors whose names end with 'ing'.

SELECT author_name FROM Authors WHERE author_name LIKE '%ing';

-- 25. Retrieve the names and nationalities of authors where the name contains exactly five letters.

SELECT author_name, nationality FROM Authors WHERE LEN(author_name) = 5;
