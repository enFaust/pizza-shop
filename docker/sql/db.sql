--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1 (Debian 11.1-1.pgdg90+1)
-- Dumped by pg_dump version 11.1 (Debian 11.1-1.pgdg90+1)


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;
SET default_tablespace = '';
SET default_with_oids = false;

--Setup database
DROP DATABASE IF EXISTS pizza_shop;
CREATE DATABASE pizza_shop;
\c pizza_shop;

CREATE TABLE customers
(
    id           INT PRIMARY KEY,
    name         VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20)  NOT NULL,
    email        VARCHAR(255) NOT NULL
);

CREATE TABLE orders
(
    id          INT PRIMARY KEY,
    customer_id INT  NOT NULL,
    order_date  DATE NOT NULL,
    order_time  TIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

CREATE TABLE pizzas
(
    id          INT PRIMARY KEY,
    name        VARCHAR(255)   NOT NULL,
    description TEXT           NOT NULL,
    price       DECIMAL(10, 2) NOT NULL
);

CREATE TABLE toppings
(
    id    INT PRIMARY KEY,
    name  VARCHAR(255)   NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pizza_toppings
(
    id         INT PRIMARY KEY,
    pizza_id   INT NOT NULL,
    topping_id INT NOT NULL,
    FOREIGN KEY (pizza_id) REFERENCES pizzas (id),
    FOREIGN KEY (topping_id) REFERENCES toppings (id)
);

CREATE TABLE employees
(
    id           INT PRIMARY KEY,
    name         VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20)  NOT NULL,
    email        VARCHAR(255) NOT NULL,
    job_title    VARCHAR(255) NOT NULL
);

CREATE TABLE shifts
(
    id          INT PRIMARY KEY,
    employee_id INT  NOT NULL,
    start_time  TIME NOT NULL,
    end_time    TIME NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (id)
);

CREATE TABLE sales
(
    id       INT PRIMARY KEY,
    order_id INT            NOT NULL,
    pizza_id INT            NOT NULL,
    price    DECIMAL(10, 2) NOT NULL,
    quantity INT            NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (pizza_id) REFERENCES pizzas (id)
);

-- Data for Customers table
INSERT INTO customers (id, name, phone_number, email)
VALUES (1, 'John Smith', '555-1234', 'john.smith@example.com'),
       (2, 'Jane Doe', '555-5678', 'jane.doe@example.com'),
       (3, 'Bob Johnson', '555-9012', 'bob.johnson@example.com'),
       (4, 'Emily Brown', '555-3456', 'emily.brown@example.com'),
       (5, 'Mike Davis', '555-7890', 'mike.davis@example.com'),
       (6, 'Linda Wilson', '555-2345', 'linda.wilson@example.com'),
       (7, 'Chris Lee', '555-6789', 'chris.lee@example.com'),
       (8, 'Samantha Perez', '555-0123', 'samantha.perez@example.com'),
       (9, 'Mark Taylor', '555-4567', 'mark.taylor@example.com'),
       (10, 'Amy Garcia', '555-8901', 'amy.garcia@example.com');

-- Data for Orders table
INSERT INTO orders (id, customer_id, order_date, order_time)
VALUES (1, 1, '2023-02-13', '12:30:00'),
       (2, 1, '2023-02-13', '18:15:00'),
       (3, 2, '2023-02-13', '20:00:00'),
       (4, 3, '2023-02-12', '13:45:00'),
       (5, 4, '2023-02-12', '19:30:00'),
       (6, 5, '2023-02-11', '14:00:00'),
       (7, 6, '2023-02-10', '12:00:00'),
       (8, 7, '2023-02-09', '17:30:00'),
       (9, 8, '2023-02-08', '19:15:00'),
       (10, 9, '2023-02-07', '13:00:00');

-- Data for Pizzas table
INSERT INTO pizzas (id, name, description, price)
VALUES (1, 'Pepperoni', 'Classic pizza with pepperoni and mozzarella cheese', 12.99),
       (2, 'Margherita', 'Pizza with tomato sauce, fresh mozzarella cheese, and basil', 11.99),
       (3, 'Vegetarian', 'Pizza with mushrooms, onions, peppers, and black olives', 13.99),
       (4, 'Hawaiian', 'Pizza with ham, pineapple, and mozzarella cheese', 14.99),
       (5, 'Meat Lover''s', 'Pizza with pepperoni, sausage, ham, and bacon', 15.99),
       (6, 'Supreme', 'Pizza with pepperoni, sausage, mushrooms, onions, peppers, and black olives', 16.99),
       (7, 'BBQ Chicken', 'Pizza with BBQ sauce, chicken, and mozzarella cheese', 14.99),
       (8, 'Buffalo Chicken', 'Pizza with spicy buffalo sauce, chicken, and blue cheese', 14.99);

-- Data for Toppings table
INSERT INTO toppings (id, name, price)
VALUES (1, 'Pepperoni', 1.50),
       (2, 'Mushrooms', 1.00),
       (3, 'Onions', 0.75),
       (4, 'Sausage', 1.75),
       (5, 'Bacon', 1.50),
       (6, 'Extra cheese', 1.25),
       (7, 'Black olives', 1.00),
       (8, 'Green peppers', 0.75),
       (9, 'Pineapple', 1.25),
       (10, 'Spinach', 1.00);

-- Data for Pizza toppings table
INSERT INTO pizza_toppings (id, pizza_id, topping_id)
VALUES (1, 1, 1),
       (2, 1, 2),
       (3, 2, 3),
       (4, 2, 4),
       (5, 3, 1),
       (6, 3, 5),
       (7, 4, 2),
       (8, 4, 7),
       (9, 5, 3),
       (10, 5, 6);

-- Data for Employees table
INSERT INTO employees (id, name, phone_number, email, job_title)
VALUES (1, 'John Smith', '555-1234', 'jsmith@email.com', 'Manager'),
       (2, 'Jane Doe', '555-5678', 'jdoe@email.com', 'Server'),
       (3, 'Bob Johnson', '555-4321', 'bjohnson@email.com', 'Cook'),
       (4, 'Sarah Lee', '555-8765', 'slee@email.com', 'Delivery Driver'),
       (5, 'Mike Smith', '555-1122', 'msmith@email.com', 'Server'),
       (6, 'Kim Lee', '555-3344', 'klee@email.com', 'Cook'),
       (7, 'Alex Garcia', '555-5566', 'agarcia@email.com', 'Delivery Driver'),
       (8, 'Jamie Chen', '555-7788', 'jchen@email.com', 'Server'),
       (9, 'Matt Johnson', '555-9900', 'mjohnson@email.com', 'Cook'),
       (10, 'Samantha Lee', '555-3322', 'slee2@email.com', 'Delivery Driver');

-- Data for Shifts table
INSERT INTO shifts (id, employee_id, start_time, end_time)
VALUES (1, 1, '08:00:00', '16:00:00'),
       (2, 2, '16:00:00', '00:00:00'),
       (3, 3, '11:00:00', '19:00:00'),
       (4, 4, '13:00:00', '21:00:00'),
       (5, 5, '09:00:00', '17:00:00'),
       (6, 6, '16:00:00', '23:00:00'),
       (7, 7, '08:00:00', '16:00:00'),
       (8, 8, '09:00:00', '17:00:00'),
       (9, 9, '12:00:00', '20:00:00');

-- Data for Sales toppings table
INSERT INTO sales (id, order_id, pizza_id, price, quantity)
VALUES (1, 1, 1, 10.99, 2),
       (2, 1, 2, 12.99, 1),
       (3, 2, 1, 10.99, 1),
       (4, 2, 3, 13.99, 2),
       (5, 3, 2, 12.99, 2),
       (6, 3, 3, 13.99, 1),
       (7, 4, 1, 10.99, 3),
       (8, 4, 2, 12.99, 1),
       (9, 5, 1, 10.99, 2),
       (10, 5, 3, 13.99, 1);
