--Creating a database to store all the tables and data
CREATE DATABASE DB;

--using the database
USE DB;

--Creating tables

--Customers table
CREATE TABLE Customer(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
customer_tel VARCHAR(15)
);

--products table
CREATE TABLE Product(
product_id INT PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
category VARCHAR(50) NOT NULL, 
price DECIMAL(10, 2) NOT NULL
); 

--orders table
CREATE TABLE Orders(
customer_id INT FOREIGN KEY REFERENCES Customer(customer_id),
product_id INT FOREIGN KEY REFERENCES Product(product_id),
order_date DATE NOT NULL,
quantity INT NOT NULL,
total_amount DECIMAL(10, 2) NOT NULL
);

-- Insert data into Customer table
INSERT INTO Customer (customer_id, customer_name, customer_tel) VALUES
(1, 'Alice', '123-456-7890'),
(2, 'Bob', '234-567-8901'),
(3, 'Charlie', '345-678-9012');

-- Insert data into Product table
INSERT INTO Product (product_id, product_name, category, price) VALUES
(1, 'Widget', 'Widgets', 10.00),
(2, 'Gadget', 'Gadgets', 20.00),
(3, 'Doohickey', 'Doohickeys', 15.00);

-- Insert data into Orders table
INSERT INTO Orders (customer_id, product_id, order_date, quantity, total_amount) VALUES
(1, 1, '2023-05-01', 2, 20.00),
(1, 2, '2023-05-02', 1, 20.00),
(2, 1, '2023-05-03', 3, 30.00),
(2, 3, '2023-05-04', 1, 15.00),
(3, 2, '2023-05-05', 2, 40.00),
(3, 3, '2023-05-06', 1, 15.00),
(3, 1, '2023-05-07', 1, 10.00);

--Overview of each table
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Orders;

--Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, 
--along with the total cost of the widgets and gadgets ordered by each customer. 
--The cost of each item should be calculated by multiplying the quantity by the price of the product.
 
 SELECT 
    customer_name, 
    COUNT(DISTINCT Product.product_id) AS products_count,  
    SUM(Orders.quantity *	Product.price) AS total_cost 
 FROM 
    Customer
 JOIN Orders ON 
    Customer.customer_id = Orders.customer_id
 JOIN Product ON 
    Orders.product_id = Product.product_id
 WHERE
    Product.product_name IN ('Widget', 'Gadget')
 GROUP BY customer_name;
 
 --Write a query to retrieve the names of the customers who have placed an order for at least one widget, 
 --along with the total cost of the widgets ordered by each customer.

 SELECT 
    customer_name, 
    COUNT(DISTINCT Product.product_id) AS products_count,  
    SUM(Orders.quantity *	Product.price) AS total_cost 
 FROM 
    Customer
 JOIN Orders ON 
    Customer.customer_id = Orders.customer_id
 JOIN Product ON 
    Orders.product_id = Product.product_id
 WHERE
    Product.product_name IN ('Widget')
 GROUP BY customer_name;

 --Write a query to retrieve the names of the customers who have placed an order for at least one gadget,
 --along with the total cost of the gadgets ordered by each customer.

 SELECT 
   customer_name, 
   COUNT(DISTINCT Product.product_id) AS products_count,  
   SUM(Orders.quantity *	Product.price) AS total_cost 
 FROM 
   Customer
 JOIN Orders ON 
   Customer.customer_id = Orders.customer_id
 JOIN Product ON 
   Orders.product_id = Product.product_id
 WHERE
    Product.product_name IN ('Gadget')
 GROUP BY customer_name;

 --Write a query to retrieve the names of the customers who have placed an order for at least one doohickey,
 --along with the total cost of the doohickeys ordered by each customer.

 SELECT 
    customer_name, 
    COUNT(DISTINCT Product.product_id) AS products_count,  
    SUM(Orders.quantity *	Product.price) AS total_cost 
 FROM 
    Customer
 JOIN Orders ON 
    Customer.customer_id = Orders.customer_id
 JOIN Product ON 
    Orders.product_id = Product.product_id
 WHERE
    Product.product_name IN ('Doohickey')
 GROUP BY customer_name;

 --Write a query to retrieve the total number of widgets and gadgets ordered by each customer,
 --along with the total cost of the orders.

 
 SELECT 
     customer_name, 
     COUNT(DISTINCT Product.product_id) AS products_count,  
     SUM(Orders.quantity *	Product.price) AS total_cost 
 FROM 
     Customer
 JOIN Orders ON 
     Customer.customer_id = Orders.customer_id
 JOIN Product ON 
     Orders.product_id = Product.product_id
 WHERE
    Product.product_name IN ('Widget', 'Gadget')
 GROUP BY customer_name;

 --Write a query to retrieve the names of the products that have been ordered by at least one customer,
 --along with the total quantity of each product ordered.

SELECT 
    Product.product_name, 
	SUM(Orders.quantity) AS Total_Quantity
FROM 
    Product
JOIN Orders ON 
    Product.product_id = Orders.product_id
GROUP BY 
    Product.product_name;


-- Write a query to retrieve the names of the customers who have placed the most orders, 
--along with the total number of orders placed by each customer.

SELECT TOP 1
   customer_name, count(*) as total_number_of_orders 
FROM 
   Customer
JOIN 
   Orders ON Customer.customer_id = Orders.customer_id
GROUP BY 
   customer_name
ORDER BY 
   total_number_of_orders desc;

--Write a query to retrieve the names of the products that have been ordered the most, 
--along with the total quantity of each product ordered.

SELECT 
   product_name, SUM(Orders.quantity) AS total_quantity
FROM 
   Product
JOIN 
   Orders ON Product.product_id = Orders.product_id
GROUP BY 
   product_name
ORDER BY
   total_quantity;

--Write a query to retrieve the names of the customers who have placed an order on every day of the week, 
--along with the total number of orders placed by each customer.

SELECT
    customer_name,
    COUNT(DISTINCT DATEPART(dw, order_date)) AS days_ordered
FROM
    Customer
JOIN
    Orders ON Customer.customer_id = Orders.customer_id
GROUP BY
    customer_name
HAVING
    COUNT(DISTINCT DATEPART(dw, order_date)) = 7;
