USE MY_DB;

--Creating customer table
CREATE TABLE Customers(
customers_id INTEGER PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL
);

--creating products table
CREATE TABLE products(
product_id INTEGER PRIMARY KEY ,
name VARCHAR(50) NOT NULL,
price DECIMAL(5, 2) CHECK(price > 0) NOT NULL
);

--creating orders table
CREATE TABLE Orders(
order_id INTEGER PRIMARY KEY,
product_id INT NOT NULL,
customers_id INT NOT NULL,
quantity INTEGER NOT NULL,
order_date DATE NOT NULL,

FOREIGN KEY (customers_id) REFERENCES Customers(customers_id), 
FOREIGN KEY (product_id) REFERENCES Products(product_id) 
);
GO

--inserting data into the products table
INSERT INTO products(product_id, name, price) 
VALUES (1, 'Cookies', 10 ), 
       (2, 'Candy', 5.2) ;

--inserting data into customers table
INSERT INTO Customers(customers_id, name, address) 
VALUES (1, 'Ahmed', 'Tunisia' ), 
       (2, 'Coulibaly', 'Senegal'),
	   (3, 'Hasan', 'Egypt');

--inserting data into products table
INSERT INTO Orders(order_id, customers_id, product_id, quantity, order_date) 
VALUES (1, 1, 2, 3, '2023-01-22' ), 
       (2, 2, 1, 10, '2023-04-14') ;

SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM products;
