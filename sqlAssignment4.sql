CREATE DATABASE employee_audit_db;

USE employee_audit_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    department_id INT
);

CREATE TABLE salary_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    operation ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by VARCHAR(100)
);

DELIMITER $$

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO salary_audit
        (emp_id, old_salary, new_salary,
         operation, changed_at, changed_by)
    VALUES
        (NEW.emp_id, NULL, NEW.salary,
         'INSERT', NOW(), CURRENT_USER());
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER after_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NOT (OLD.salary <=> NEW.salary) THEN
        INSERT INTO salary_audit
            (emp_id, old_salary, new_salary,
             operation, changed_at, changed_by)
        VALUES
            (NEW.emp_id, OLD.salary, NEW.salary,
             'UPDATE', NOW(), CURRENT_USER());
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO salary_audit
        (emp_id, old_salary, new_salary,
         operation, changed_at, changed_by)
    VALUES
        (OLD.emp_id, OLD.salary, NULL,
         'DELETE', NOW(), CURRENT_USER());
END $$

DELIMITER ;


INSERT INTO employees
    (emp_id, first_name, last_name, salary, department_id)
VALUES
    (101, 'Ravi', 'Kumar', 30000, 10),
    (102, 'Sita', 'Devi', 40000, 20),
    (103, 'Raju', 'Reddy', 35000, 10);
    
UPDATE employees
SET salary = 35000
WHERE emp_id = 101;

DELETE FROM employees
WHERE emp_id = 102;

SELECT
    audit_id,
    emp_id,
    old_salary,
    new_salary,
    operation,
    changed_at,
    changed_by
FROM salary_audit
ORDER BY audit_id;

