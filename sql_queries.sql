create database customers;
use customers;
create table customers(
customer_id INT,
name varchar(50),
age INT,
city varchar(50),
join_date date,
plan char(20)
);
Show tables;
SELECT * FROM customers;
SELECT COUNT(*) FROM customers;
select * from customers;
select count(*) from customers;
select count(*) from customers;
select count(*) from customers;
select * from customers
limit 10;

select city,count(*) AS total_customers
from customers
group by city;
select AVG(age) AS avg_age
from customers;
select name,city from customers
where plan='new';
select name,join_date
from customers
where join_date>2025-01-02;

create table products(
product_id INT,
product_name varchar(20),
category varchar(20),
price decimal(20,2)
);
create table orders(
order_id INT,
product_id INT,
customer_id INT,
order_date varchar(20),
quantity INT,
order_amount DECIMAL(10,2)
);
INSERT INTO products VALUES
(1,'Laptop','Electronics',55000),
(2,'Mobile','Electronics',25000),
(3,'Headphones','Electronics',2000),
(4,'Shoes','Fashion',3000),
(5,'T-Shirt','Fashion',800),
(6,'Watch','Accessories',5000),
(7,'Backpack','Accessories',1500),
(8,'Tablet','Electronics',20000),
(9,'Camera','Electronics',45000),
(10,'Keyboard','Electronics',1200);
select count(*) from products;
select count(*) from orders;

select c.name,p.product_name,o.order_amount 
from orders o 
join customers c on o.customer_id= c.customer_id
join products p on o.product_id= p.product_id;

select c.name,count(o.order_id) AS total_orders
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.name;

SELECT p.product_name, SUM(o.order_amount) AS total_revenue
FROM orders o
JOIN products p 
ON o.product_id = p.product_id
GROUP BY p.product_name;

select city,count(*) AS total_customers
from customers
group by city;

select c.name,sum(o.order_amount) AS total_spent
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.name
order by total_spent desc
limit 10;

select c.name, p.product_name, o.quantity, o.order_amount
from orders o
join customers c
on o.customer_id=c.customer_id
join products p
on o.product_id=p.product_id;

SELECT c.name, p.product_name, o.quantity, o.order_amount
FROM orders o 
JOIN customers c 
ON o.customer_id = c.customer_id
JOIN products p 
ON o.product_id = p.product_id;

USE customers;
SHOW TABLES;
SELECT COUNT(*) FROM customers;
use customers;
select count(*) from orders;
SELECT * FROM customers LIMIT 10;

#customers, what products they brought and orders amount.
select c.name, p.product_name,o.order_amount 
from orders o
join customers c on o.customer_id= c.customer_id
join  products p on o.product_id= p.product_id
limit 20;

#Shows highest paying customers.
select c.name , SUM(o.order_amount) AS total_spent
from customers c 
join orders o
on o.customer_id= c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 10;

# Shows which product earns the most money
select p.product_name, SUM(o.order_amount) AS total_revenue
from products p
join orders o
on p.product_id= o.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

#Shows highest revenue generating cities
select c.city, SUM(o.order_amount) AS total_revenue
from customers c
join orders o
on o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_revenue;

#Shows customers with more than 5 orders
select c.name, SUM(O.ORDER_ID) AS total_orders
from customers c
join orders o 
on c.customer_id= o.customer_id
GROUP BY c.name
HAVING total_orders > 5;

# Shows Customers bought which products and how much they spent 
SELECT c.name, p.product_name, o.quantity, o.order_amount
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id
JOIN products p customers
ON o.product_id = p.product_id;

use customers;

alter table customers
ADD PRIMARY KEY (customer_id);

ALTER TABLE PRODUCTS
ADD PRIMARY KEY(product_id);

ALTER TABLE ORDERS
ADD CONSTRAINT fk_customers
foreign key(customer_id)
references customers(customer_id);

ALTER TABLE ORDERS
ADD CONSTRAINT fk_products
foreign key(product_id)
references products(product_id);

