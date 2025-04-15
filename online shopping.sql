CREATE DATABASE online_shopping;
USE online_shopping;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    password VARCHAR(100),
    address TEXT
);

INSERT INTO Users VALUES
(1, 'Alice', 'alice@example.com', '1234567890', 'pass123', 'New York'),
(2, 'Bob', 'bob@example.com', '2345678901', 'pass456', 'Los Angeles'),
(3, 'Charlie', 'charlie@example.com', '3456789012', 'pass789', 'Chicago'),
(4, 'David', 'david@example.com', '4567890123', 'pass321', 'Houston'),
(5, 'Eve', 'eve@example.com', '5678901234', 'pass654', 'Phoenix'),
(6, 'Frank', 'frank@example.com', '6789012345', 'pass987', 'Philadelphia'),
(7, 'Grace', 'grace@example.com', '7890123456', 'pass111', 'San Antonio'),
(8, 'Heidi', 'heidi@example.com', '8901234567', 'pass222', 'San Diego'),
(9, 'Ivan', 'ivan@example.com', '9012345678', 'pass333', 'Dallas'),
(10, 'Judy', 'judy@example.com', '0123456789', 'pass444', 'San Jose');

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

INSERT INTO Category VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Fashion'),
(4, 'Home Appliances'),
(5, 'Beauty & Health'),
(6, 'Toys'),
(7, 'Groceries'),
(8, 'Sports'),
(9, 'Automotive'),
(10, 'Stationery');

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    stock_qty INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO Product VALUES
(1, 'Smartphone', 'Android smartphone', 299.99, 50, 1),
(2, 'Laptop', 'Gaming laptop', 899.99, 30, 1),
(3, 'Book: DBMS', 'Educational book', 19.99, 100, 2),
(4, 'Jeans', 'Denim jeans', 39.99, 70, 3),
(5, 'Air Fryer', 'Oil-less cooking', 89.99, 20, 4),
(6, 'Lipstick', 'Matte finish', 9.99, 200, 5),
(7, 'Action Figure', 'Superhero toy', 14.99, 60, 6),
(8, 'Rice 5kg', 'Basmati rice', 12.49, 80, 7),
(9, 'Football', 'Size 5 football', 25.00, 40, 8),
(10, 'Notebook', 'College ruled', 2.99, 150, 10);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Orders VALUES
(1, 1, '2024-04-01', 299.99, 'Delivered'),
(2, 2, '2024-04-02', 59.98, 'Shipped'),
(3, 3, '2024-04-03', 19.99, 'Delivered'),
(4, 4, '2024-04-04', 89.99, 'Processing'),
(5, 5, '2024-04-05', 39.99, 'Cancelled'),
(6, 6, '2024-04-06', 100.00, 'Delivered'),
(7, 7, '2024-04-07', 50.00, 'Shipped'),
(8, 8, '2024-04-08', 120.49, 'Delivered'),
(9, 9, '2024-04-09', 15.00, 'Processing'),
(10, 10, '2024-04-10', 12.49, 'Delivered');

CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Order_Items VALUES
(1, 1, 1, 299.99),
(2, 3, 2, 19.99),
(3, 3, 1, 19.99),
(4, 5, 1, 89.99),
(5, 4, 1, 39.99),
(6, 2, 1, 89.99),
(6, 10, 2, 5.00),
(7, 4, 1, 39.99),
(8, 8, 1, 12.49),
(9, 7, 1, 15.00);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Payment VALUES
(1, 1, '2024-04-01', 299.99, 'Credit Card', 'Paid'),
(2, 2, '2024-04-02', 59.98, 'PayPal', 'Paid'),
(3, 3, '2024-04-03', 19.99, 'Credit Card', 'Paid'),
(4, 4, '2024-04-04', 89.99, 'Debit Card', 'Pending'),
(5, 5, '2024-04-05', 39.99, 'Credit Card', 'Refunded'),
(6, 6, '2024-04-06', 100.00, 'UPI', 'Paid'),
(7, 7, '2024-04-07', 50.00, 'Credit Card', 'Paid'),
(8, 8, '2024-04-08', 120.49, 'PayPal', 'Paid'),
(9, 9, '2024-04-09', 15.00, 'Cash on Delivery', 'Pending'),
(10, 10, '2024-04-10', 12.49, 'Credit Card', 'Paid');

SELECT * FROM Users WHERE address = 'New York';

SELECT P.product_id, P.name, C.category_name 
FROM Product P
JOIN Category C ON P.category_id = C.category_id
WHERE C.category_name = 'Electronics';

SELECT * FROM Orders WHERE status = 'Delivered';

SELECT O.order_id, U.name AS user_name, O.order_date, O.total_amount 
FROM Orders O
JOIN Users U ON O.user_id = U.user_id;

SELECT OI.order_id, P.name AS product_name, OI.quantity, OI.price
FROM Order_Items OI
JOIN Product P ON OI.product_id = P.product_id;

SELECT P.payment_id, U.name AS user_name, P.amount, P.payment_method, P.status 
FROM Payment P
JOIN Orders O ON P.order_id = O.order_id
JOIN Users U ON O.user_id = U.user_id;

SELECT U.name, COUNT(O.order_id) AS total_orders
FROM Users U
JOIN Orders O ON U.user_id = O.user_id
GROUP BY U.user_id;

SELECT SUM(total_amount) AS total_sales
FROM Orders
WHERE status = 'Delivered';

SELECT P.name, SUM(OI.quantity) AS total_sold
FROM Order_Items OI
JOIN Product P ON OI.product_id = P.product_id
GROUP BY P.product_id;

UPDATE Product 
SET stock_qty = stock_qty - 5 
WHERE name = 'Smartphone';

UPDATE Orders 
SET status = 'Delivered' 
WHERE order_id = 4;


SELECT DISTINCT U.name
FROM Payment P
JOIN Orders O ON P.order_id = O.order_id
JOIN Users U ON O.user_id = U.user_id
WHERE P.payment_method = 'PayPal';









