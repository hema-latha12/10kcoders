CREATE DATABASE trigger_assignment;
USE trigger_assignment;

CREATE TABLE Accounts1 (
    account_number INT PRIMARY KEY,
    balance DECIMAL(12,2) NOT NULL
);

CREATE TABLE Transactions1 (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_number INT NOT NULL,
    transaction_type ENUM('CREDIT', 'DEBIT') NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    FOREIGN KEY (account_number)
        REFERENCES Accounts1(account_number)
);

DELIMITER $$

CREATE TRIGGER account_balance_audit1
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.balance > OLD.balance THEN
        INSERT INTO Transactions1
            (account_number, transaction_type, amount, transaction_date)
        VALUES
            (NEW.account_number, 'CREDIT',
             ABS(NEW.balance - OLD.balance), NOW());

    ELSEIF NEW.balance < OLD.balance THEN
        INSERT INTO Transactions1
            (account_number, transaction_type, amount, transaction_date)
        VALUES
            (NEW.account_number, 'DEBIT',
             ABS(NEW.balance - OLD.balance), NOW());
    END IF;
END $$

DELIMITER ;

INSERT INTO Accounts1 VALUES
(1001, 5000.00),
(1002, 8000.00);

-- CREDIT
UPDATE Accounts1
SET balance = 7000.00
WHERE account_number = 1001;

-- DEBIT
UPDATE Accounts1
SET balance = 5500.00
WHERE account_number = 1001;

SELECT * FROM Transactions1;

CREATE TABLE Products1 (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE Sales1 (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    quantity_sold INT NOT NULL,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id)
        REFERENCES Products1(product_id)
);

DELIMITER $$

CREATE TRIGGER update_product_stock1
AFTER INSERT ON Sales1
FOR EACH ROW
BEGIN
    UPDATE Products1
    SET stock_quantity = stock_quantity - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END $$

DELIMITER ;

INSERT INTO Products1 VALUES
(201, 'Laptop', 50),
(202, 'Mouse', 100);

INSERT INTO Sales1 (product_id, quantity_sold)
VALUES (201, 5);

SELECT * FROM Products1;

CREATE TABLE Departments1 (
    dept_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    employee_count INT NOT NULL DEFAULT 0
);

CREATE TABLE Employees3 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES Departments1(dept_id)
);

DELIMITER $$

CREATE TRIGGER validate_employee_salary1
BEFORE UPDATE ON Employees3
FOR EACH ROW
BEGIN
    IF NEW.salary <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Error: Salary must be greater than zero';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER increment_employee_count1
AFTER INSERT ON Employees3
FOR EACH ROW
BEGIN
    IF NEW.dept_id IS NOT NULL THEN
        UPDATE Departments1
        SET employee_count = employee_count + 1
        WHERE dept_id = NEW.dept_id;
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER decrement_employee_count1
AFTER DELETE ON Employees3
FOR EACH ROW
BEGIN
    IF OLD.dept_id IS NOT NULL THEN
        UPDATE Departments1
        SET employee_count = employee_count - 1
        WHERE dept_id = OLD.dept_id;
    END IF;
END $$

DELIMITER ;

INSERT INTO Departments1 (dept_id, name, employee_count)
VALUES
(10, 'HR', 0),
(20, 'IT', 0);

-- Insert employees
INSERT INTO Employees3 (emp_id, name, salary, dept_id)
VALUES
(301, 'Ravi', 30000, 10),
(302, 'Sita', 40000, 10),
(303, 'Raju', 45000, 20);

-- Check employee counts
SELECT * FROM Departments1;

-- Valid update
UPDATE Employees3
SET salary = 35000
WHERE emp_id = 301;

-- Invalid update: raises an error
UPDATE Employees3
SET salary = 0
WHERE emp_id = 301;

DELETE FROM Employees3
WHERE emp_id = 301;

SELECT * FROM Departments1;

CREATE TABLE Students2 (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    marks DECIMAL(5,2) NOT NULL
);

DELIMITER $$

CREATE TRIGGER validate_student_marks1
BEFORE INSERT ON Students2
FOR EACH ROW
BEGIN
    IF NEW.marks < 0 OR NEW.marks > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Error: Marks must be between 0 and 100';
    END IF;
END $$

DELIMITER ;

-- Valid insertion
INSERT INTO Students2
VALUES (401, 'Priya', 85);

-- Invalid insertion: raises an error
INSERT INTO Students2
VALUES (402, 'Kiran', 120);

SELECT * FROM Students;

SELECT * FROM Accounts;
SELECT * FROM Transactions;

SELECT * FROM Products;
SELECT * FROM Sales;

SELECT * FROM Employees;
SELECT * FROM Departments;

SELECT * FROM Students;