CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    units INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name) VALUES
(1, 'Laptop'),
(2, 'Mobile'),
(3, 'Keyboard'),
(4, 'Headphones');

INSERT INTO Orders (order_id, product_id, units, order_date) VALUES
(101, 1, 40, '2020-02-05'),
(102, 1, 70, '2020-02-20'),
(103, 2, 20, '2020-02-10'),
(104, 2, 50, '2020-02-15'),
(105, 3, 100, '2020-02-25'),
(106, 4, 30, '2020-01-30'),
(107, 4, 80, '2020-02-12');

SELECT 
    p.product_name,
    SUM(o.units) AS total_units
FROM Products p
JOIN Orders o
    ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.units) >= 100;
