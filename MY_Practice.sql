#DATA DEFINITION LANGUAGE
CREATE DATABASE IF NOT EXISTS my_employees ;
USE my_employees;
CREATE TABLE IF NOT EXISTS m_employees (
    emp_no INT(12),
    birth_date DATE,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    gender ENUM('M', 'F'),
    hire_date DATE
);
SELECT * FROM m_employees;
ALTER TABLE m_employees ADD COLUMN address VARCHAR(225);
ALTER TABLE m_employees DROP COLUMN address;
DROP TABLE m_employees;
RENAME TABLE m_employees TO my_employees;
RENAME TABLE my_employees TO m_employees;
ALTER table m_employees rename COLUMN address TO emp_add;
TRUNCATE TABLE m_employees;

#DATA MANIPULATION LANGUAGE
INSERT INTO m_employees (emp_no, birth_date, gender) VALUES(1001, '2007-11-03', 'F');
INSERT INTO m_employees (emp_no, birth_date, gender) VALUES(1, '2007-11-03', 'M');
UPDATE m_employees SET birth_date = '2008-11-03' WHERE emp_no = 1;
CREATE table sales (purchase_number INT(12), date_purchase DATE);
INSERT INTO sales (purchase_number, date_purchase) values (1, '2017-10-11');
INSERT INTO sales (purchase_number, date_purchase) values (2, '2017-10-11');
UPDATE sales SET date_purchase = '2017-12-12' WHERE purchase_number = 1;
DELETE FROM sales WHERE purchase_number = 1;
DELETE FROM m_employees WHERE emp_no = 1;
UPDATE m_employees SET emp_no = 1002 WHERE gender = 'M';
SELECT * FROM m_employees;

#DATA CONTROL LANGUAGE(DCL) 
#GRANT complete OR PARTIAL ON my_employees.sales TO 'adeniyi# @'localhost';
#GRANT complete OR PARTIAL ON my_employees.sales TO 'adeniyi# @'localhost';
#Transaction Control Language;
Create Table IF NOT EXISTS Customers (customers INT(11), first_name VARCHAR(225),
 last_name VARCHAR(225), email_address VARCHAR(225), number_of_complaints INT(20));
 INSERT INTO customers (customer_id, first_name, last_name, email_address, number_of_complaints) 
 VALUES (1, 'John', 'McKinley', 
 'john.mackinly@gmail.com', 0), (2, 'Mcfarlane', 'Elizabeth', 'elizabeth.mackinly@gmail.com', 2);
 SELECT * FROM Customers;
 ALTER TABLE Customers RENAME COLUMN customers to customer_id;
 DELETE FROM Customers WHERE Customers = 1;
 INSERT INTO customers (customer_id, first_name, last_name, email_address, number_of_complaints) 
 VALUES (1, 'John', 'McKinley', 
 'john.mackinly@gmail.com', 0);
 SELECT * FROM Customers;
 UPDATE customers SET first_name = 'Johnson' WHERE customer_id = 1;
 COMMIT;
 UPDATE customers SET first_name = 'Johnson' WHERE customer_id = 2;
 SELECT * FROM customers;
 ROLLBACK;
 
 #Using database and Tables
 SELECT * FROM my_employees.customers;
  #CONSTRAINTS
  DROP TABLE customers;
  Create Table IF NOT EXISTS Customers (customers INT(11), first_name VARCHAR(225),
 last_name VARCHAR(225), email_address VARCHAR(225), number_of_complaints INT(20), PRIMARY KEY(customers));
 ALTER TABLE Customers RENAME COLUMN customers to customer_id;
 INSERT INTO customers (customer_id, first_name, last_name, email_address, number_of_complaints) 
 VALUES (1, 'John', 'McKinley', 
 'john.mackinly@gmail.com', 0), (2, 'Mcfarlane', 'Elizabeth', 'elizabeth.mackinly@gmail.com', 2);
 SELECT * FROM Customers;
 CREATE TABLE IF NOT EXISTS companies (company_id INT AUTO_INCREMENT, 
 headquarters_phone_numbers VARCHAR(225), company_name VARCHAR(225) NOT NULL, primary key (company_id));
 use employees;
 select * from employees.salaries;
 select * FROM employees WHERE first_name = 'Elvis';
 select * from employees WHERE first_name = 'Kellie' AND gender = 'F';
 select * from employees WHERE first_name = 'Kellie' OR first_name = 'Aruna';
 select * from employees WHERE gender = 'F' AND(first_name = 'Kellie' OR first_name = 'Aruna');
 select * from employees WHERE first_name IN ('Denis','Alvis');
 select * from employees WHERE first_name NOT IN ('JOhn','MArk', 'Jacob');
select * from employees WHERE first_name LIKE ('Mark%'); 
select * from employees WHERE first_name LIKE 'Mark_'; 
select * from employees WHERE hire_date LIKE ('2000%');
select * from employees WHERE emp_no LIKE ('1000%');
select * from employees WHERE first_name LIKE ('%Jack%');
select * from employees WHERE first_name NOT LIKE ('%Jack%');
Select * from salaries WHERE salary between 66000 and 70000;
Select * from employees WHERE emp_no not between '10004' AND '10012';
select * from departments where dept_no between 'd003' AND 'd006';
select * from departments where dept_no is NOT NULL;
select * from employees where hire_date LIKE ('2000%') AND gender = 'F';
select * from salaries where salary >150000;
select DISTINCT hire_date from employees LIMIT 1000;
select COUNT(salary) from salaries where salary>=100000;
select COUNT(emp_no) from dept_manager;
select * from employees ORDER BY hire_date DESC;
use employees;
SELECT 
    salary, COUNT(emp_no) AS emp_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary , emp_no
ORDER BY salary ASC;
select emp_no, AVG(salary) from salaries GROUP BY emp_no HAVING AVG(salary)>120000 order by emp_no;
SELECT 
    emp_no, from_date
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;
select * FROM employees.dept_emp LIMIT 100;

#SQL INSERT STATEMENT
DROP TABLE business_analysis;
CREATE TABLE IF NOT EXISTS business_analysis(dept_no CHAR(4) NOT NULL, dept_name VARCHAR(225), PRIMARY KEY (dept_no));
INSERT INTO business_analysis(dept_no, dept_name) SELECT dept_no, dept_name FROM departments where dept_no = 'd010';
INSERT INTO departments (dept_no,dept_name) VALUES ('d010','Business_analysis');
SELECT * FROM departments_dup ORDER BY(dept_no) ASC;
DELETE FROM departments WHERE dept_no = 'd010'; 
ALTER TABLE departments_dup 
CHANGE dept_name dept_name VARCHAR (225) NULL;

 #JOIN
 select * from employees.departments_dup;
 DROP Table employees.departments_dup;
 CREATE TABLE IF NOT EXISTS departments_dup
 (dept_no CHAR(4) NULL, dept_name VARCHAR(225) NULL);
INSERT INTO departments_dup (dept_no, dept_name) Select dept_no, dept_name FROM departments;
Select * from departments_dup Order by(dept_no) ASC;
INSERT INTO departments_dup (dept_name) VALUES ('Public_Relations');
DELETE FROM departments_dup WHERE dept_no = 'd002';
INSERT INTO departments_dup (dept_no) VALUES ('d010'), ('d011');
DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (emp_no int(11) NOT NULL, dept_no CHAR(4) NULL, 
from_date DATE NOT NULL, to_date DATE NULL);
INSERT INTO dept_manager_dup select * from dept_manager;
Select * from dept_manager_dup;
INSERT INTO dept_manager_dup (emp_no,from_date) VALUES (999904, '2017-01-01'), (999905, '2017-01-01'),
(999906, '2017-01-01'),(999907, '2017-01-01');
DELETE FROM dept_manager_dup WHERE dept_no = 'd001';
INSERT INTO departments_dup (dept_name) VALUES ('public Relations');
SELECT e.emp_no,e.hire_date,e.first_name, e.last_name,dm.dept_no 
FROM employees e 
JOIN dept_manager dm ON e.emp_no = dm.emp_no;
SELECT * FROM departments_dup;
SELECT * FROM dept_manager_dup;

#LEFT JOIN
select e.emp_no, e.first_name,e.last_name, dm.dept_no,dm.from_date FROM dept_manager dm
LEFT JOIN employees e ON dm.emp_no = e.emp_no WHERE last_name = 'Markovitch' order by dept_no DESC, emp_no;
select e.emp_no, e.first_name,e.last_name, dm.dept_no,dm.from_date FROM employees e
LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no WHERE last_name = 'Markovitch' order by dept_no DESC, emp_no;
 
#JOIN AND WHERE
SELECT 
    e.hire_date, e.first_name, e.last_name, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
ORDER BY e.emp_no;
SELECT * FROM dept_manager;
SELECT dm.*,d.* FROM departments d CROSS JOIN dept_manager dm WHERE d.dept_no = 'd009' ORDER BY d.dept_no;# all employees
Select e.*,d.* FROM employees e CROSS JOIN departments d WHERE e.emp_no < 10010 ORDER BY d.dept_no; 
Select e.*,d.* FROM employees e CROSS JOIN departments d ORDER BY d.dept_no LIMIT 10; # not the same with above query

#Join more than two tables in SQL
select e.first_name, e.last_name,e.hire_date, t.title,dm.from_date, d.dept_name 
FROM employees e JOIN dept_manager dm ON e.emp_no = dm.emp_no 
JOIN departments d ON dm.dept_no = d.dept_no
JOIN titles t ON t.emp_no = e.emp_no where t.title ='Manager' ORDER BY e.emp_no; 
SELECT e.gender, COUNT(dm.emp_no) FROM employees e 
JOIN dept_manager dm ON e.emp_no=dm.emp_no GROUP BY gender;

#SQL VIEWS
use employees_mod;
Drop View view_avaerage_salary;
create VIEW view_avarage_salary AS select ROUND(AVG(salary),2) FROM t_salaries s 
WHERE EXISTS(select * FROM t_dept_manager dm WHERE dm.emp_no = s.emp_no);
CREATE OR REPLACE VIEW v_manager_avg_salary AS SELECT ROUND(AVG(salary),2) 
FROM t_salaries s JOIN t_dept_manager m ON s.emp_no = m.emp_no;

#PROCEDURE
use employees_mod;
DROP procedure IF exists avg_salary;

DELIMITER $$ 
CREATE PROCEDURE avg_salary()
BEGIN
	SELECT 
		ROUND(AVG(salary),2) 
	FROM 
        t_salaries;
END$$ 
DELIMITER ;
CALL avg_salary;

#CALL PROCEDURE WITH AN OUTPUT FUNCTIONS
DELIMITER $$ 
CREATE PROCEDURE emp_info(in p_first_name VARCHAR(225), in p_last_name VARCHAR(225), out p_emp_no int)
BEGIN
	SELECT 
		e.emp_no
	INTO p_emp_no FROM employees e
	WHERE
        e.first_name = p_first_name AND e.last_name = p.last_name;
END$$ 
DELIMITER ;
CALL emp_info;

#USER DEFINED FUNCTIONS IN MY SQL
use employees_mod;
DELIMITER $$
create function emp_info(p_first_name VARCHAR(225), p_last_name VARCHAR(225)) 
RETURNS DECIMAL(10,2) 
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
DECLARE v_max_from_date date;
DECLARE v_salary decimal(10,2);
SELECT MAX(from_date)
INTO v_max_from_date FROM
t_employees e JOIN t_salaries s ON e.emp_no = s.emp_no
WHERE
e.first_name = p_first_name
AND e.last_name = p_last_name;
select 
s.salary
INTO v_salary FROM
employees e
JOIN 
salaries s ON e.emp_no = s.emp_no
WHERE 
e.first_name = p.first_name
AND e.last_name = p_last_name
AND s.from_date = v_max_from_date;
RETURN v_salary; 
END $$
DELIMITER ;
SELECT emp_info('Aruna','Journey');
 
 use employees_mod;
 /*TAsk: Create a visualization that provides a breakdown between the male and 
 female employees working in the company each year, starting from 1990 */
 SELECT 
    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no)
FROM
    t_employees e
        JOIN
    t_dept_emp d ON d.emp_no = e.emp_no
GROUP BY calendar_year , e.gender
HAVING calendar_year >= 1990;

/*TASK 2:- Compare the number of male managers to the number of female managers from
different departments for each year, starting from 1990*/
SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN 
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;

/*TASK 3:- Compare the average salary of female versus male employees in the entire company until year 2002, 
and add a filter allowing you to see that per each department*/
select e.gender, year(s.to_date) AS calendar_year, d.dept_name, ROUND(AVG(s.salary),2) AS salary 
from t_salaries s
JOIN t_employees e ON s.emp_no = e.emp_no 
JOIN t_dept_emp de ON de.emp_no = e.emp_no
JOIN t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no, e.gender, calendar_year HAVING calendar_year<=2002
ORDER BY d.dept_no;
/*TASK 4: Create an SQL stored procedure that will allow you to obtain the average male and female salary 
per department within a certain salary range. Let this range be defined by two values the user 
can insert when calling the procedure.Finally, visualize the obtained result-set in Tableau as a double bar chart.*/ 

DROP PROCEDURE IF EXISTS filter_salary;
DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT 
    e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender;
END$$

DELIMITER ;
CALL filter_salary(50000, 90000);

/*Find the average salary of the male and female employees in each department*/ 
use employees;
select e.gender, Round(avg(s.salary),2), d.dept_name
FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no
JOIN salaries s ON s.emp_no = e.emp_no
group by gender, dept_name;

/*Find the lowest department number encountered in the 'dept_emp' table. Then, find the highest department number.*/
select min(dept_no), max(dept_no) from dept_emp;
use employees;

/*TASK 3:Obtain a table containing the following three fields for all individuals whose employee number is not greater than 10040:
- employee number -the lowest department number among the departments where the employee has worked in (Hint: use a subquery to retrieve this value from the 'dept_emp' table)
- assign '110022' as 'manager' to all individuals whose employee number is lower than or equal to 10020, and '110039' to those whose number is between 10021 and 10040 inclusive*/
SELECT
    emp_no,
    (SELECT
            MIN(dept_no)
        FROM
            dept_emp de
        WHERE
            e.emp_no = de.emp_no) dept_no,
    CASE
        WHEN emp_no <= 10020 THEN '110022'
        ELSE '110039'
    END AS manager
FROM
    employees e
WHERE
    emp_no <= 10040;
    
/*TASK 4: Retrieve a list of all employees that have been hired in 2000*/
SELECT 
    *
FROM
    employees
WHERE
    YEAR(hire_date) = 2000;
    
/*TASK 5: Retrieve a list of all employees from the ‘titles’ table who are engineers.
Repeat the exercise, this time retrieving a list of all employees from the ‘titles’ table who are senior engineers*/
select * from titles where title like ('%engineer%');
select * from titles where title like ('senior Engineer');

/*Create a procedure that asks you to insert an employee number and that will obtain an output containing the same number, 
as well as the number and name of the last department the employee has worked in.*/
DELIMITER $$
CREATE PROCEDURE last_dept (in p_emp_no integer)
BEGIN
SELECT
    e.emp_no, d.dept_no, d.dept_name
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    e.emp_no = p_emp_no
        AND de.from_date = (SELECT
            MAX(from_date)
        FROM
            dept_emp
        WHERE
            emp_no = p_emp_no);
END$$
DELIMITER ;

call employees.last_dept(10010);

/*TASK 7:How many contracts have been registered in the ‘salaries’ 
table with duration of more than one year and of value higher than or equal to $100,000?*/
select COUNT(*) from salaries where salary > 100000 AND DATEDIFF (to_date, from_date)>365;

/*TASK 8:-Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set the hire date to 
equal the current date. Format the output appropriately (YY-mm-dd). Extra challenge: You can try to declare a new variable 
called 'today' which stores today's data, and then use it in your trigger!*/

DROP TRIGGER IF EXISTS trig_hire_date;

DELIMITER $$
CREATE TRIGGER trig_hire_date
BEFORE INSERT ON employees
 
FOR EACH ROW
BEGIN 
    DECLARE today date;
    SELECT date_format(sysdate(), '%Y-%m-%d') INTO today;
 
	IF NEW.hire_date > today THEN
		SET NEW.hire_date = today;
	END IF;
END $$
 
DELIMITER ;

/*TASK 9:Define a function that retrieves the largest contract salary value of an employee. 
Apply it to employee number 11356*/
DROP FUNCTION IF EXISTS f_highest_salary;
DELIMITER $$
CREATE FUNCTION f_highest_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_highest_salary DECIMAL(10,2);
SELECT
    MAX(s.salary)
INTO v_highest_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
RETURN v_highest_salary;
END$$
DELIMITER ;

/*TASK 9B:- In addition, what is the lowest contract salary value of the same employee? 
You may want to create a new function that to obtain the result*/
DROP FUNCTION IF EXISTS f_lowest_salary;
DELIMITER $$
CREATE FUNCTION f_lowest_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_lowest_salary DECIMAL(10,2);
SELECT
    MIN(s.salary)
INTO v_lowest_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
RETURN v_lowest_salary;
END$$
DELIMITER ;
SELECT f_lowest_salary(11356);

/*Based on the previous exercise, you can now try to create a third function that also accepts a second parameter. 
Let this parameter be a character sequence. Evaluate if its value is 'min' or 'max' and based on that retrieve either the 
lowest or the highest salary, respectively (using the same logic and code structure from Exercise 9).
If the inserted value is any string value different from ‘min’ or ‘max’, let the function return the difference 
between the highest and the lowest salary of that employee.*/

DELIMITER $$
CREATE FUNCTION f_salary (p_emp_no INTEGER, p_min_or_max varchar(10)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

DECLARE v_salary_info DECIMAL(10,2);

SELECT
    CASE
        WHEN p_min_or_max = 'min' THEN MIN(s.salary)
        WHEN p_min_or_max = 'max' THEN MAX(s.salary)
        ELSE MAX(s.salary) - MIN(s.salary)
    END AS salary_info
INTO v_salary_info FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
RETURN v_salary_info;
END$$
DELIMITER ;

select employees.f_salary(11356, 'min');
select employees.f_salary(11356, 'max');
select employees.f_salary(11356, 'maxxx');