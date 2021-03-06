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
#UC10
UPDATE employee_payroll SET     name = 'Terisa'WHERE    id=1;
UPDATE employee_payroll SET     Department = 'Sales'WHERE    name='Terisa';
insert into employee_payroll(name,Department, gender, basic_pay, Deductions, taxable_pay, tax, net_pay, start)
values ('Terisa','Marketing','F',3000000,1000000,2000000,500000,1500000,'2018-12-11');
#UC11
alter table employee_payroll rename to Employee;
create table emp_Dep(
     DepId int not null auto_increment,
     id int unsigned not null,
     depName varchar(150) not null,
     primary key (DepId),
     foreign key (id) references Employee(id)
     );
 create table emp_Payroll(
     PayrollId int not null auto_increment,
     id int unsigned not null,
     basic_pay double not null,
     Deductions double not null,
     taxable_pay double not null,
     tax double not null,
     net_pay double not null,
     primary key (PayrollId),
     foreign key (id) references Employee(id)
     );

 create table PhoneNo(
     PhoneId int not null auto_increment,
     id int unsigned not null ,
     Phone_No varchar(150) not null,
     primary key (PhoneId),
     foreign key (id) references Employee(id)
     );
 alter table Employee
     drop column basic_pay,
     drop column Deductions,
     drop column  taxable_pay,
     drop column  tax,
     drop column  net_pay;
#UC12
select Employee.id, Employee.name, PhoneNo.Phone_No, employee.Address, emp_Dep.depName, employee.gender,
     emp_Payroll.basic_pay,emp_Payroll.Deductions, emp_Payroll.taxable_pay, emp_Payroll.tax, emp_Payroll.net_pay, Employee.start
     from Employee
     inner join PhoneNo on Employee.id =PhoneNo.id
     inner join emp_Dep on Employee.id = emp_Dep.id
     inner join emp_Payroll on Employee.id = emp_Payroll.id;

