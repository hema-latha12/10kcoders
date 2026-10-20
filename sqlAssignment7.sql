-- 
--  SUBSCRIPTION MANAGEMENT SYSTEM  (MySQL)
--  Tables, sample data, queries, views, stored procedures, reports
-- 
 
DROP DATABASE IF EXISTS subscription_db;
CREATE DATABASE subscription_db;
USE subscription_db;
 
-- 
--  TABLES
--  
-- Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    registration_date DATE
);
 
-- Plans
CREATE TABLE Plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(100),
    price DECIMAL(10,2),
    duration_months INT,
    description VARCHAR(255)
);
 
-- Subscriptions
CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY,
    customer_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);
 
-- Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    subscription_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);
 
-- Usage_Details
CREATE TABLE Usage_Details (
    usage_id INT PRIMARY KEY,
    subscription_id INT,
    usage_date DATE,
    usage_amount INT,
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);
 
-- Discounts
CREATE TABLE Discounts (
    discount_id INT PRIMARY KEY,
    plan_id INT,
    discount_percentage DECIMAL(5,2),
    valid_from DATE,
    valid_to DATE,
    FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);
 
 
-- 
--  1. BASIC QUERIES
-- 
 
-- Q1. Insert sample data into all tables
INSERT INTO Customers VALUES
(1, 'Aarav Sharma',  'aarav@example.com',  '9876543210', '2023-05-10'),
(2, 'Diya Reddy',    'diya@example.com',   '9876543211', '2024-02-15'),
(3, 'Kabir Singh',   'kabir@example.com',  '9876543212', '2024-11-20'),
(4, 'Ananya Rao',    'ananya@example.com', '9876543213', '2025-01-12'),
(5, 'Rohan Mehta',   'rohan@example.com',  '9876543214', '2025-06-30'),
(6, 'Sneha Iyer',    'sneha@example.com',  '9876543215', '2025-09-14'),
(7, 'Vikram Nair',   'vikram@example.com', '9876543216', '2025-02-01'),
(8, 'Meera Das',     'meera@example.com',  '9876543217', '2026-05-05');
 
INSERT INTO Plans VALUES
(1, 'Basic',    299.00,  1,  'Basic monthly plan'),
(2, 'Standard', 499.00,  6,  'Standard half-yearly plan'),
(3, 'Premium',  799.00,  12, 'Premium yearly plan'),
(4, 'Plus',     1499.00, 3,  'Plus quarterly plan'),
(5, 'Ultimate', 2999.00, 12, 'Ultimate yearly plan');
 
INSERT INTO Subscriptions VALUES
(1, 1, 2, '2026-04-25', '2026-10-25', 'Active'),
(2, 2, 3, '2026-01-01', '2026-12-31', 'Active'),
(3, 3, 1, '2025-01-10', '2025-02-10', 'Expired'),
(4, 4, 4, '2026-03-01', '2026-06-01', 'Cancelled'),
(5, 5, 5, '2026-02-01', '2027-02-01', 'Active'),
(6, 1, 1, '2025-06-01', '2025-07-01', 'Expired'),
(7, 6, 1, '2026-10-01', '2026-11-01', 'Active'),
(8, 7, 3, '2025-03-01', '2026-03-01', 'Expired'),
(9, 6, 4, '2026-08-01', '2026-11-01', 'Active');
 
INSERT INTO Payments VALUES
(1,  1, 499.00,  '2026-04-25', 'UPI',         'Success'),
(2,  2, 799.00,  '2026-01-01', 'Credit Card', 'Success'),
(3,  3, 299.00,  '2025-01-10', 'Debit Card',  'Success'),
(4,  4, 1499.00, '2026-03-01', 'Net Banking', 'Success'),
(5,  5, 2999.00, '2026-02-01', 'Credit Card', 'Success'),
(6,  6, 299.00,  '2025-06-01', 'UPI',         'Success'),
(7,  7, 299.00,  '2026-10-01', 'UPI',         'Failed'),
(8,  8, 799.00,  '2025-03-01', 'Debit Card',  'Success'),
(9,  9, 1499.00, '2026-08-01', 'Credit Card', 'Success'),
(10, 7, 299.00,  '2026-10-02', 'UPI',         'Success');
 
INSERT INTO Usage_Details VALUES
(1,  1, '2026-05-01', 120),
(2,  1, '2026-06-01', 150),
(3,  2, '2026-02-01', 300),
(4,  2, '2026-03-01', 280),
(5,  3, '2025-01-20', 40),
(6,  4, '2026-04-01', 90),
(7,  5, '2026-03-01', 500),
(8,  5, '2026-04-01', 450),
(9,  6, '2025-06-15', 60),
(10, 7, '2026-10-10', 35),
(11, 8, '2025-06-01', 200),
(12, 9, '2026-09-01', 110);
 
INSERT INTO Discounts VALUES
(1, 1, 10.00, '2026-01-01', '2026-12-31'),
(2, 2, 15.00, '2026-06-01', '2026-12-31'),
(3, 3, 20.00, '2026-01-01', '2026-06-30'),
(4, 5, 25.00, '2026-09-01', '2026-12-31');
 
-- Q2. Display plans with price greater than 500
SELECT * FROM Plans WHERE price > 500;
 
-- Q3. Show all active subscriptions
SELECT * FROM Subscriptions WHERE status = 'Active';
 
-- Q4. List customers registered after 2024
SELECT * FROM Customers WHERE registration_date >= '2025-01-01';
 
-- Q5. Display subscriptions ending this month
SELECT * FROM Subscriptions
WHERE MONTH(end_date) = MONTH(CURDATE())
  AND YEAR(end_date)  = YEAR(CURDATE());
 
 
-- 
--  2. JOINS
-- 
 
-- Q1. Show customer names with their subscription plans
SELECT c.name AS customer_name, p.plan_name, s.start_date, s.end_date, s.status
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Plans p         ON s.plan_id = p.plan_id;
 
-- Q2. Display subscription details with payment information
SELECT s.subscription_id, s.start_date, s.end_date, s.status AS subscription_status,
       pay.payment_id, pay.amount, pay.payment_date, pay.payment_method,
       pay.status AS payment_status
FROM Subscriptions s
JOIN Payments pay ON s.subscription_id = pay.subscription_id;
 
-- Q3. Show plans with discount details
SELECT p.plan_id, p.plan_name, p.price,
       d.discount_percentage, d.valid_from, d.valid_to,
       ROUND(p.price - (p.price * d.discount_percentage / 100), 2) AS discounted_price
FROM Plans p
JOIN Discounts d ON p.plan_id = d.plan_id;
 
-- Q4. List usage details with customer names
SELECT c.name AS customer_name, u.subscription_id, u.usage_date, u.usage_amount
FROM Usage_Details u
JOIN Subscriptions s ON u.subscription_id = s.subscription_id
JOIN Customers c     ON s.customer_id = c.customer_id;
 
-- Q5. Show customers with their payment history
SELECT c.name AS customer_name, pay.payment_id, pay.amount,
       pay.payment_date, pay.payment_method, pay.status
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Payments pay    ON s.subscription_id = pay.subscription_id
ORDER BY c.name, pay.payment_date;
 
 
-- 
--  3. AGGREGATE FUNCTIONS
-- 
 
-- Q1. Count total number of subscriptions
SELECT COUNT(*) AS total_subscriptions FROM Subscriptions;
 
-- Q2. Find average plan price
SELECT ROUND(AVG(price), 2) AS average_plan_price FROM Plans;
 
-- Q3. Calculate total revenue from payments (successful payments only)
SELECT SUM(amount) AS total_revenue FROM Payments WHERE status = 'Success';
 
-- Q4. Count active vs expired subscriptions
SELECT status, COUNT(*) AS total
FROM Subscriptions
WHERE status IN ('Active', 'Expired')
GROUP BY status;
 
-- Q5. Find highest priced plan
SELECT MAX(price) AS highest_price FROM Plans;
-- (with plan details)
SELECT * FROM Plans WHERE price = (SELECT MAX(price) FROM Plans);
 
 
-- 
--  4. SUBQUERIES
-- 
 
-- Q1. Find customers with no subscriptions
SELECT * FROM Customers
WHERE customer_id NOT IN (SELECT customer_id FROM Subscriptions);
 
-- Q2. Find expired subscriptions
SELECT * FROM Subscriptions
WHERE subscription_id IN (SELECT subscription_id FROM Subscriptions WHERE status = 'Expired');
 
-- Q3. Show plans with price greater than average
SELECT * FROM Plans
WHERE price > (SELECT AVG(price) FROM Plans);
 
-- Q4. Find customers who spent more than average
SELECT c.customer_id, c.name, SUM(pay.amount) AS total_spent
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Payments pay    ON s.subscription_id = pay.subscription_id
WHERE pay.status = 'Success'
GROUP BY c.customer_id, c.name
HAVING SUM(pay.amount) > (
    SELECT AVG(customer_total) FROM (
        SELECT SUM(p2.amount) AS customer_total
        FROM Subscriptions s2
        JOIN Payments p2 ON s2.subscription_id = p2.subscription_id
        WHERE p2.status = 'Success'
        GROUP BY s2.customer_id
    ) AS totals
);
 
-- Q5. Show subscriptions with highest usage
SELECT subscription_id, SUM(usage_amount) AS total_usage
FROM Usage_Details
GROUP BY subscription_id
HAVING SUM(usage_amount) = (
    SELECT MAX(total_usage) FROM (
        SELECT SUM(usage_amount) AS total_usage
        FROM Usage_Details
        GROUP BY subscription_id
    ) AS t
);
 
 
-- 
--  5. UPDATES & DELETES
-- 
 
-- Q1. Update subscription status
UPDATE Subscriptions
SET status = 'Expired'
WHERE end_date < CURDATE() AND status = 'Active';
 
-- Q2. Change customer email
UPDATE Customers
SET email = 'aarav.sharma@newmail.com'
WHERE customer_id = 1;
 
-- Q3. Update plan price
UPDATE Plans
SET price = 549.00
WHERE plan_id = 2;
 
-- NOTE: The two DELETE examples below are wrapped in a transaction and
-- ROLLED BACK so your sample data stays intact for the views/reports.
-- Change ROLLBACK to COMMIT if you really want to delete the rows.
START TRANSACTION;
 
-- Q4. Delete expired subscriptions
-- (child rows in Payments and Usage_Details must be deleted first because of foreign keys)
DELETE FROM Payments
WHERE subscription_id IN (SELECT subscription_id FROM Subscriptions WHERE status = 'Expired');
 
DELETE FROM Usage_Details
WHERE subscription_id IN (SELECT subscription_id FROM Subscriptions WHERE status = 'Expired');
 
DELETE FROM Subscriptions WHERE status = 'Expired';
 
-- Q5. Delete customers with no subscriptions
DELETE FROM Customers
WHERE customer_id NOT IN (SELECT customer_id FROM Subscriptions);
 
ROLLBACK;
 
 
-- 
--  6. VIEWS
-- 
 
-- Q1. View to display customer subscriptions
CREATE OR REPLACE VIEW vw_customer_subscriptions AS
SELECT c.customer_id, c.name AS customer_name, p.plan_name,
       s.subscription_id, s.start_date, s.end_date, s.status
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Plans p         ON s.plan_id = p.plan_id;
 
-- Q2. View for payment history
CREATE OR REPLACE VIEW vw_payment_history AS
SELECT pay.payment_id, c.name AS customer_name, s.subscription_id,
       pay.amount, pay.payment_date, pay.payment_method, pay.status
FROM Payments pay
JOIN Subscriptions s ON pay.subscription_id = s.subscription_id
JOIN Customers c     ON s.customer_id = c.customer_id;
 
-- Q3. View showing active subscriptions
CREATE OR REPLACE VIEW vw_active_subscriptions AS
SELECT s.subscription_id, c.name AS customer_name, p.plan_name,
       s.start_date, s.end_date
FROM Subscriptions s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Plans p     ON s.plan_id = p.plan_id
WHERE s.status = 'Active';
 
-- Q4. View for plan details with discounts
CREATE OR REPLACE VIEW vw_plan_discounts AS
SELECT p.plan_id, p.plan_name, p.price, p.duration_months,
       d.discount_percentage, d.valid_from, d.valid_to,
       ROUND(p.price - (p.price * IFNULL(d.discount_percentage, 0) / 100), 2) AS discounted_price
FROM Plans p
LEFT JOIN Discounts d ON p.plan_id = d.plan_id;
 
-- Q5. View showing customer spending
CREATE OR REPLACE VIEW vw_customer_spending AS
SELECT c.customer_id, c.name AS customer_name,
       IFNULL(SUM(CASE WHEN pay.status = 'Success' THEN pay.amount END), 0) AS total_spent
FROM Customers c
LEFT JOIN Subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN Payments pay    ON s.subscription_id = pay.subscription_id
GROUP BY c.customer_id, c.name;
 
-- Test the views
SELECT * FROM vw_customer_subscriptions;
SELECT * FROM vw_payment_history;
SELECT * FROM vw_active_subscriptions;
SELECT * FROM vw_plan_discounts;
SELECT * FROM vw_customer_spending;
 
 
-- 
--  7. STORED PROCEDURES
-- 
 
DELIMITER $$
 
-- 1. Insert New Customer (name, email, phone, registration_date)
CREATE PROCEDURE sp_insert_customer(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(15),
    IN p_registration_date DATE
)
BEGIN
    DECLARE v_new_id INT;
    SELECT IFNULL(MAX(customer_id), 0) + 1 INTO v_new_id FROM Customers;
 
    INSERT INTO Customers (customer_id, name, email, phone, registration_date)
    VALUES (v_new_id, p_name, p_email, p_phone, p_registration_date);
END$$
 
-- 2. Create Subscription (customer_id, plan_id, start_date)
CREATE PROCEDURE sp_create_subscription(
    IN p_customer_id INT,
    IN p_plan_id INT,
    IN p_start_date DATE
)
BEGIN
    DECLARE v_new_id INT;
    DECLARE v_duration INT;
 
    SELECT duration_months INTO v_duration FROM Plans WHERE plan_id = p_plan_id;
    SELECT IFNULL(MAX(subscription_id), 0) + 1 INTO v_new_id FROM Subscriptions;
 
    INSERT INTO Subscriptions (subscription_id, customer_id, plan_id, start_date, end_date, status)
    VALUES (v_new_id, p_customer_id, p_plan_id, p_start_date,
            DATE_ADD(p_start_date, INTERVAL v_duration MONTH), 'Active');
END$$
 
-- 3. Get Customer Subscriptions (customer_id)
CREATE PROCEDURE sp_get_customer_subscriptions(IN p_customer_id INT)
BEGIN
    SELECT s.subscription_id, p.plan_name, s.start_date, s.end_date, s.status
    FROM Subscriptions s
    JOIN Plans p ON s.plan_id = p.plan_id
    WHERE s.customer_id = p_customer_id;
END$$
 
-- 4. Calculate Total Revenue
CREATE PROCEDURE sp_calculate_total_revenue(OUT p_total_revenue DECIMAL(12,2))
BEGIN
    SELECT IFNULL(SUM(amount), 0) INTO p_total_revenue
    FROM Payments
    WHERE status = 'Success';
END$$
 
-- 5. List Plans by Price Range (min_price, max_price)
CREATE PROCEDURE sp_list_plans_by_price(
    IN p_min_price DECIMAL(10,2),
    IN p_max_price DECIMAL(10,2)
)
BEGIN
    SELECT * FROM Plans
    WHERE price BETWEEN p_min_price AND p_max_price
    ORDER BY price;
END$$
 
DELIMITER ;
 
-- Test the procedures
CALL sp_insert_customer('Test User', 'test@example.com', '9999999999', CURDATE());
CALL sp_create_subscription(2, 1, CURDATE());
CALL sp_get_customer_subscriptions(1);
CALL sp_calculate_total_revenue(@revenue);
SELECT @revenue AS total_revenue;
CALL sp_list_plans_by_price(300, 1500);
 
 
-- 
--  8. REPORTS / ANALYSIS
-- 
 
-- Q1. Top 5 most popular plans
SELECT p.plan_id, p.plan_name, COUNT(s.subscription_id) AS total_subscriptions
FROM Plans p
JOIN Subscriptions s ON p.plan_id = s.plan_id
GROUP BY p.plan_id, p.plan_name
ORDER BY total_subscriptions DESC
LIMIT 5;
 
-- Q2. Customers with highest spending
SELECT c.customer_id, c.name, SUM(pay.amount) AS total_spent
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
JOIN Payments pay    ON s.subscription_id = pay.subscription_id
WHERE pay.status = 'Success'
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;
 
-- Q3. Monthly revenue report
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month,
       SUM(amount) AS monthly_revenue
FROM Payments
WHERE status = 'Success'
GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY month;
 
-- Q4. Plan-wise subscription count
SELECT p.plan_name, COUNT(s.subscription_id) AS subscription_count
FROM Plans p
LEFT JOIN Subscriptions s ON p.plan_id = s.plan_id
GROUP BY p.plan_id, p.plan_name
ORDER BY subscription_count DESC;
 
-- Q5. Subscription churn analysis (active vs cancelled)
SELECT status,
       COUNT(*) AS total,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Subscriptions), 2) AS percentage
FROM Subscriptions
GROUP BY status;
 
-- Churn rate = cancelled / (active + cancelled)
SELECT ROUND(
         SUM(status = 'Cancelled') * 100.0 /
         NULLIF(SUM(status IN ('Active', 'Cancelled')), 0), 2
       ) AS churn_rate_percent
FROM Subscriptions;