
CREATE TABLE Customers(
customers_id INTEGER PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL
);

CREATE TABLE products(
product_id INTEGER PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
price DECIMAL CHECK(price > 0) NOT NULL
);


CREATE TABLE Orders(
order_id INTEGER PRIMARY KEY NOT NULL,
product_id INT NOT NULL,
customers_id INT NOT NULL,
quantity INTEGER NOT NULL,
order_date DATE NOT NULL,

FOREIGN KEY (customers_id) REFERENCES Customers(customers_id), 
FOREIGN KEY (product_id) REFERENCES Products(product_id) 
);
GO