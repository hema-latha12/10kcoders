CREATE DATABASE trigger_assignment;
USE trigger_assignment;

CREATE TABLE Accounts (
    account_number INT PRIMARY KEY,
    balance DECIMAL(12,2) NOT NULL
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_number INT NOT NULL,
    transaction_type ENUM('CREDIT', 'DEBIT') NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    FOREIGN KEY (account_number)
        REFERENCES Accounts(account_number)
);

DELIMITER $$

CREATE TRIGGER account_balance_audit
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.balance > OLD.balance THEN

        INSERT INTO Transactions
            (account_number, transaction_type,
             amount, transaction_date)
        VALUES
            (NEW.account_number, 'CREDIT',
             NEW.balance - OLD.balance, NOW());

    ELSEIF NEW.balance < OLD.balance THEN

        INSERT INTO Transactions
            (account_number, transaction_type,
             amount, transaction_date)
        VALUES
            (NEW.account_number, 'DEBIT',
             OLD.balance - NEW.balance, NOW());

    END IF;
END $$

DELIMITER ;

INSERT INTO Accounts VALUES
(1001, 5000.00),
(1002, 8000.00);

-- Credit: balance increases by 2000
UPDATE Accounts
SET balance = 7000.00
WHERE account_number = 1001;

-- Debit: balance decreases by 1500
UPDATE Accounts
SET balance = 5500.00
WHERE account_number = 1001;

-- Verify transaction history
SELECT * FROM Transactions;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    quantity_sold INT NOT NULL,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);

DELIMITER $$

CREATE TRIGGER update_product_stock
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END $$

DELIMITER ;

INSERT INTO Products VALUES
(201, 'Laptop', 50),
(202, 'Mouse', 100);

-- Sell 5 laptops
INSERT INTO Sales (product_id, quantity_sold)
VALUES (201, 5);

-- Check stock
SELECT * FROM Products;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

DELIMITER $$

CREATE TRIGGER validate_employee_salary
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF NEW.salary <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Error: Salary must be greater than zero';
    END IF;
END $$

DELIMITER ;

INSERT INTO Employees
VALUES (301, 'Ravi', 30000);

-- Valid update
UPDATE Employees
SET salary = 35000
WHERE emp_id = 301;

-- Invalid update: should raise an error
UPDATE Employees
SET salary = 0
WHERE emp_id = 301;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    marks DECIMAL(5,2) NOT NULL
);

DELIMITER $$

CREATE TRIGGER validate_student_marks
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    IF NEW.marks < 0 OR NEW.marks > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Error: Marks must be between 0 and 100';
    END IF;
END $$

DELIMITER ;

-- Valid insert
INSERT INTO Students
VALUES (401, 'Sita', 85);

-- Invalid insert: should raise an error
INSERT INTO Students
VALUES (402, 'Raju', 120);

-- Check valid records
SELECT * FROM Students;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    employee_count INT NOT NULL DEFAULT 0
);

CREATE TABLE Employees1 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES Departments(dept_id)
);

DELIMITER $$

CREATE TRIGGER increment_employee_count
AFTER INSERT ON Employees1
FOR EACH ROW
BEGIN
    IF NEW.dept_id IS NOT NULL THEN
        UPDATE Departments
        SET employee_count = employee_count + 1
        WHERE dept_id = NEW.dept_id;
    END IF;
END $$

DELIMITER $$

CREATE TRIGGER decrement_employee_count
AFTER DELETE ON Employees1
FOR EACH ROW
BEGIN
    IF OLD.dept_id IS NOT NULL THEN
        UPDATE Departments
        SET employee_count = employee_count - 1
        WHERE dept_id = OLD.dept_id;
    END IF;
END $$

DELIMITER ;

INSERT INTO Departments
VALUES
(10, 'HR', 0),
(20, 'IT', 0);

-- Insert employees
INSERT INTO Employees1
    (emp_id, name, salary, dept_id)
VALUES
    (501, 'Arun', 30000, 10),
    (502, 'Priya', 40000, 10),
    (503, 'Kiran', 45000, 20);

-- Check department counts
SELECT * FROM Departments;

-- Delete an employee
DELETE FROM Employees1
WHERE emp_id = 501;

-- Check department counts again
SELECT * FROM Departments;
