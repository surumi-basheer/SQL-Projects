create database online_shoppings;
use online_shoppings;
create table products(product_id int primary key,Name varchar(150),stock int,category varchar(250));
create table customers(customer_id int primary key,Name varchar(150),Email varchar(200),phone varchar(250));
create table orders(order_id int primary key,customer_id int, foreign key(customer_id) references customers(customer_id),orderdate date default (current_date),totalamount int); 
create table order_details(orderdetail_id int,order_id int,foreign key(order_id) references orders(order_id),product_id int,foreign key (product_id) references products(product_id),quantity int);
insert into products(product_id,Name,stock,category) values (1, 'Laptop', 25, 'Electronics'),
(2, 'Smartphone', 40, 'Electronics'),
(3, 'Headphones', 60, 'Accessories'),
(4, 'Keyboard', 35, 'Accessories'),
(5, 'Mouse', 50, 'Accessories'),
(6, 'Office Chair', 15, 'Furniture'),
(7, 'Desk Lamp', 30, 'Furniture'),
(8, 'Notebook', 100, 'Stationery'),
(9, 'Pen Pack', 200, 'Stationery'),
(10, 'Water Bottle', 45, 'Home & Kitchen');
insert into customers(customer_id,name,Email,phone) VALUES
(1, 'John Doe', 'john.doe@email.com', '+1-987-654-3210'),
(2, 'Jane Smith', 'jane.smith@email.com', '+1-912-345-6789'),
(3, 'Michael Brown', 'michael.brown@email.com', '+44-7700-900123'),
(4, 'Emily Davis', 'emily.davis@email.com', '+91-90123-45678'),
(5, 'Daniel Wilson', 'daniel.wilson@email.com', '+61-412-345-678'),
(6, 'Sophia Taylor', 'sophia.taylor@email.com', '+1-934-567-8123'),
(7, 'David Anderson', 'david.anderson@email.com', '+49-151-2345678'),
(8, 'Olivia Thomas', 'olivia.thomas@email.com', '+33-612-345-678'),
(9, 'James Martinez', 'james.martinez@email.com', '+34-678-123-456'),
(10, 'Emma Johnson', 'emma.johnson@email.com', '+81-90-1234-5678');
INSERT INTO orders (order_id, customer_id, orderdate, totalamount) VALUES
(101, 1, '2025-12-01', 1850.50),
(102, 2, '2025-12-02', 2750.00),
(103, 3, '2025-12-03', 3200.75),
(104, 4, '2025-12-04', 4100.00),
(105, 5, '2025-12-05', 1500.25),
(106, 6, '2025-12-06', 2950.00),
(107, 7, '2025-12-07', 3650.40),
(108, 8, '2025-12-08', 4800.00),
(109, 9, '2025-12-09', 2150.10),
(110, 10, '2025-12-10', 5250.00);
INSERT INTO order_details (orderdetail_id, order_id, product_id, quantity) VALUES
(1, 101, 1, 2),
(2, 101, 2, 1),
(3, 102, 3, 4),
(4, 102, 4, 2),
(5, 103, 5, 3),
(6, 103, 6, 1),
(7, 104, 7, 5),
(8, 104, 8, 2),
(9, 105, 9, 6),
(10, 105, 10, 1);
select p.product_id,p.Name,od.quantity from products as p inner join order_details as od on p.product_id = od.product_id order by quantity desc limit 5;                                                                                                                                                                                                                                                                                                    
select order_id,customer_id,orderdate from orders where orderdate > current_date - interval 30 day;
select sum(totalamount) from orders;