#UC1
CREATE DATABASE payroll_service;
show databases;
use payroll_service;
#UC2
SELECT DATABASE();
CREATE TABLE employee_payroll (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    salary DOUBLE NOT NULL,
    start DATE NOT NULL,
    PRIMARY KEY (id)
);
DESCRIBE employee_payroll;
#UC3
INSERT INTO employee_payroll ( name, salary, start) VALUES
    ( 'Leena', 750000.00, '2020-09-16'),
    ( 'Clev', 650000.00, '2020-08-10'),
    ( 'Alex', 950000.00, '2020-06-10');
#UC4
SELECT 
    *
FROM
    employee_payroll;
#UC5
SELECT 
    salary
FROM
    employee_payroll
WHERE
    name = 'Leena';
SELECT 
    *
FROM
    employee_payroll;
SELECT 
    *
FROM
    employee_payroll
WHERE
    start BETWEEN CAST('2020-08-01' AS DATE) AND DATE(NOW());     #UC5
#UC6
ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
DESCRIBE employee_payroll;
UPDATE employee_payroll 
SET 
    gender = 'F'
WHERE
    name = 'Leena';
SELECT 
    *
FROM
    employee_payroll;
UPDATE employee_payroll 
SET 
    gender = 'M'
WHERE
    name = 'Alex' OR name = 'Clev';
SELECT 
    *
FROM
    employee_payroll;
SELECT 
    AVG(salary)
FROM
    employee_payroll
WHERE
    gender = 'M'
GROUP BY gender;
#UC7
SELECT 
    AVG(salary)
FROM
    employee_payroll
GROUP BY gender;
SELECT 
    gender, AVG(salary)
FROM
    employee_payroll
GROUP BY gender;
SELECT 
    gender, COUNT(name)
FROM
    employee_payroll
GROUP BY gender;
SELECT 
    gender, AVG(salary)
FROM
    employee_payroll
GROUP BY gender;
SELECT 
    gender, SUM(salary)
FROM
    employee_payroll
GROUP BY gender;
#UC8
ALTER TABLE employee_payroll ADD Phone_No varchar(150) AFTER name;
ALTER TABLE employee_payroll ADD Address varchar(150) AFTER Phone_No;
ALTER TABLE employee_payroll ADD Department varchar(150) NOT NULL AFTER Address;
ALTER TABLE employee_payroll ALTER Address SET Default 'ABC';
#UC9
alter table employee_payroll rename column salary to basic_pay;
alter table employee_payroll add Deductions Double not null after basic_pay;
alter table employee_payroll add taxable_pay Double not null after Deductions;
alter table employee_payroll add tax Double not null after taxable_pay;
alter table employee_payroll add net_pay Double not null after tax;
