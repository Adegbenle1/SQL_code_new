use employees;
SELECT 
    first_name, last_name
FROM
    employees;
    select * from employees;
    select dept_no from departments;
    SELECT *from employees
    WHERE first_name = 'Denis' AND gender = 'M';
    SELECT * FROM employees
    WHERE first_name = 'Kellie' AND gender = 'F';
    SELECT *from employees
    WHERE first_name = 'Denis' OR first_name = 'Elvis';
    SELECT * FROM employees
    WHERE last_name = 'Denis' AND (gender = 'M' OR gender = 'F');
    SELECT * FROM employees
    WHERE gender = 'F' AND first_name ='Kellie' OR first_name='Aruna';
    SELECT * FROM employees
    WHERE first_name IN ('Denis', 'Elvis');
    SELECT * FROM employees
    WHERE first_name IN ('Denis', 'Elvis', 'Mark');
    SELECT * FROM employees
    WHERE first_name LIKE ('ar%');
    SELECT * FROM employees
    WHERE first_name LIKE ('%ar%');
    SELECT * FROM employees
    WHERE first_name LIKE ('%ar');
    SELECT * FROM employees
    WHERE first_name LIKE ('Mar_');
    SELECT * FROM employees
    WHERE first_name NOT LIKE ('%Mar%');
    SELECT * FROM employees
    WHERE first_name = 'Jack';
    use employees;
    SELECT * FROM employees
    WHERE first_name like('%Jack%');
    SELECT * FROM employees
    WHERE first_name LIKE ('Mar_');
    SELECT * FROM employees
    WHERE first_name LIKE ('Ma__');
    SELECT * FROM employees
    WHERE first_name NOT LIKE ('%Jack%');
    SELECT * FROM employees
    WHERE hire_date between '1990-01-01' AND '2000-01-01';
	SELECT * FROM employees
    WHERE hire_date NOT between '1990-01-01' AND '2000-01-01';
    SELECT * FROM salaries
    WHERE salary BETWEEN 66000 AND 70000;
    SELECT * FROM employees
    WHERE emp_no NOT BETWEEN 10004 AND 10012;
    SELECT * FROM departments
    WHERE dept_no between 'd003' and 'd006';
    SELECT * FROM employees
    WHERE first_name IS NOT NULL;
    SELECT * FROM employees
    WHERE first_name IS NULL;
    SELECT * FROM departments 
    WHERE dept_no is NOT NULL;
    SELECT * FROM departments 
    WHERE dept_no is NULL;
    SELECT * FROM employees
    WHERE first_name <> 'Mark';
    #same with this
    SELECT * FROM employees
    WHERE first_name != 'Mark';
    SELECT * FROM employees
    WHERE hire_date > '2000-01-01';
    SELECT * FROM employees
    WHERE hire_date >= '2000-01-01';
    SELECT * FROM employees
    WHERE hire_date < '1985-02-01';
    SELECT * FROM employees
    WHERE hire_date <= '1985-02-01';
    SELECT * FROM employees
    WHERE gender = 'F' AND hire_date>='2000-01-01';
    SELECT * FROM salaries
    WHERE salary > 150000;
    SELECT * FROM employees
    WHERE gender='M' OR gender = 'F'; # fulfilling of one condition is okay
	SELECT * FROM employees
    WHERE gender='M' AND gender = 'F'; # both condition must be fulfilled
    SELECT gender From employees;
    SELECT DISTINCT gender From employees; # this gives only distinct figure only
    SELECT hire_date FROM employees; #hire_date table will be shown
    SELECT 
    COUNT(emp_no)
FROM
    employees;
    SELECT 
    COUNT(first_name)
FROM
    employees;
	SELECT 
	COUNT(distinct first_name) # this shows names that are not shared
FROM
    employees;
    select count(salary >= 100000 ) from salaries;
    select count(DISTINCT emp_no) from dept_manager;
    #above two code can also be written
    select count(*) from salaries where salary>=100000;
    Select count(*) from dept_manager;
    SELECT * from employees ORDER BY first_name;# same with SELECT * from employees ORDER BY first_name ASC;
    SELECT * from employees ORDER BY first_name DESC;
    SELECT * from employees ORDER BY emp_no DESC;
    SELECT * from employees ORDER BY first_name, last_name ASC; 
    SELECT * from employees ORDER BY hire_date DESC;
    SELECT first_name FROM employees GROUP BY first_name; # same thing as SELECT DISTINCT first_name from employees;
    SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name; # select first_name will give the name and rest will group into number
    SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name
    ORDER BY first_name DESC;# this give output count in the table, use ALIASES To solve it as AS, check below
    SELECT first_name, COUNT(first_name) AS names_count FROM employees GROUP BY first_name;
SELECT salary, COUNT(emp_no) AS emps_with_same_salary FROM salaries WHERE salary > 80000 GROUP BY salary ORDER BY salary; 
SELECT * FROM employees HAVING hire_date>= '2000-01-01'; # same as this SELECT * FROM employees WHERE hire_date>= '2000-01-01';
SELECT first_name, COUNT(first_name) AS names_count FROM employees GROUP BY first_name 
HAVING COUNT(first_name)>250 ORDER BY first_name;# HAVING with COUNT can be used as Aggregate function
use employees;
SELECT emp_no, AVG(salary) AS Average_salary FROM salaries GROUP BY emp_no HAVING AVG(salary)>120000 ORDER BY salary; # compare with below
SELECT *, AVG(salary) AS Average_salary FROM salaries WHERE salary>120000 GROUP BY emp_no ORDER BY emp_no;
#when using WHERE instead of HAVING, the output is larger bcos in the output we include individual contracts higher than 120,000 per year. 
#the output doesnot contain average salary values. Finally, using star* instead of emp_no extracts a list that contains all columns from the "salaries table" 
 SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;
 Select emp_no, COUNT(emp_no) AS emp_signed FROM dept_emp WHERE from_date>'2000-01-01' 
 GROUP BY emp_no HAVING COUNT(from_date)>1 ORDER BY emp_no;
 SELECT * FROM salaries; #note the maximum row in the interface but this can be lifted, GO to edit on the MENU,
 #preferences drop down sql editor, go to SQL execution and unclicked the Limit rows
 SELECT * FROM salaries ORDER BY salary ASC LIMIT 10; #this will give all of the employer
 SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;# this 
 SELECT * FROM salaries ORDER BY emp_no DESC LIMIT 10;# this gives emp no, by 10
 SELECT * FROM dept_emp LIMIT 100;
 # insert into and value work together
 SELECT * FROM employees LIMIT 10;
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES (999901, '1986-04-01', 'John', 'Smith', 'M','2011-01-01');
SELECT * FROM employees ORDER BY emp_no DESC LIMIT 10;
SELECT * FROM titles LIMIT 10;
INSERT INTO titles (emp_no, title, from_date)
VALUES (999903, 'Senior Engineer', '1997-10-01') ;# this has ON DELETE CASCADE, come back to it
SELECT * FROM departments LIMIT 10;
CREATE TABLE departments_dup ( dept_no CHAR(4) NOT NULL, dept_name VARCHAR(40) NOT NULL);
SELECT * FROM departments_dup; # to check table
INSERT INTO departments_dup (dept_no, dept_name) SELECT * FROM departments; # to enter data from one table to another table
CREATE TABLE Business_analyst(dept_no CHAR (4));
DROP TABLE Business_analyst;
CREATE TABLE Business_analyst(dept_no CHAR (4));
DROP TABLE Business_analyst;
CREATE TABLE business_analyst(dept_no CHAR (4));
INSERT INTO business_analyst(dept_no)
VALUES('d010');
SELECT * FROM business_analyst;
use employees;
SELECT * FROM employees WHERE emp_no = 999901;
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    gender = 'F',
    hire_date = '1990-12-31'
WHERE
    emp_no = 999901
    ;
SELECT * FROM employees WHERE emp_no = 999901;
SELECT * FROM departments_dup ORDER BY dept_no;
COMMIT; # the commit must be carefully executed because it is not reversible
UPDATE departments_dup SET dept_no = 'do11', dept_name ='Quality_Control';
SELECT * FROM departments_dup;
ROLLBACK;
COMMIT;
use employees;
COMMIT;
SELECT * FROM employees WHERE emp_no = 999901;
DELETE FROM employees WHERE emp_no= 999901;
SELECT * FROM employees WHERE emp_no = 999901;
ROLLBACK;
SELECT * FROM employees WHERE emp_no = 999901;
ROLLBACK;
ROLLBACK;
SELECT * FROM employees WHERE emp_no = 999901;
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    gender = 'F',
    hire_date = '1990-12-31'
WHERE
    emp_no = 999901
    ;
    SELECT * FROM employees WHERE emp_no = 999901;
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES (999901, '1986-04-01', 'John', 'Smith', 'M','2011-01-01');
SELECT * FROM employees WHERE emp_no = 999901;
COMMIT;
SELECT * FROM employees WHERE emp_no = 999901;
DELETE FROM employees WHERE emp_no= 999901;
SELECT * FROM employees WHERE emp_no = 999901;
ROLLBACK;
SELECT * FROM employees WHERE emp_no = 999901;
COMMIT;
DELETE FROM departments_dup;
ROLLBACK;
SELECT * FROM departments_dup;
use employees;
SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;
SELECT COUNT(salary) FROM salaries;
SELECT COUNT(from_date) FROM salaries;
SELECT COUNT(DISTINCT from_date) FROM salaries; # to show how many time the same from_date are encountered in the salaries
SELECT COUNT(*) FROM salaries; #* gives the all íncluding NULL in the table
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;
SELECT SUM(salary) FROM salaries; 
SELECT SUM(salary) FROM salaries WHERE from_date>'1997-01-01';
SELECT MAX(salary) from salaries;
SELECT MIN(salary) from salaries;
SELECT MAX(emp_no) from employees;
SELECT MIN(emp_no) from employees;
SELECT AVG(salary) from salaries;
SELECT AVG(salary) FROM salaries WHERE from_date>'1997-01-01'; # makesure the sting '' is used bcos it gives different answer
SELECT ROUND(AVG(salary),2) from salaries;
SELECT ROUND(AVG(salary),2) FROM salaries WHERE from_date>'1997-01-01';
CREATE TABLE departments_dup ( dept_no CHAR(4) NOT NULL, dept_name VARCHAR(40) NOT NULL);
SELECT * FROM departments_dup; # to check table
INSERT INTO departments_dup (dept_no, dept_name) SELECT * FROM departments;
SELECT * FROM departments_dup;
DROP TABLE departments_dup;
CREATE TABLE departments_dup ( dept_no CHAR(4) NOT NULL, dept_name VARCHAR(40) NOT NULL);
SELECT * FROM departments_dup; # to check table
INSERT INTO departments_dup (dept_no, dept_name) SELECT * FROM departments;
SELECT * FROM departments_dup;
SELECT * FROM departments_dup ORDER BY dept_no;
SELECT dept_no, IFNULL(dept_name,'Department name not provided') AS dept_name FROM departments_dup;
SELECT dept_no, COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager FROM departments_dup ORDER BY dept_no ASC;# check this on the video by updated the departments
SELECT * FROM departments_dup;
DROP TABLE departments_dup;
CREATE TABLE departments_dup ( dept_no CHAR(4), dept_name VARCHAR(40));
SELECT * FROM departments_dup;
DROP TABLE departments_dup;
CREATE TABLE departments_dup ( dept_no CHAR(4) NULL, dept_name VARCHAR(40) NULL);
SELECT * FROM departments_dup;
INSERT INTO departments_dup (dept_no, dept_name) SELECT * FROM departments;
INSERT INTO departments_dup (dept_name) VALUES ('PUBLIC RELATIONS');
DELETE FROM departments_dup WHERE dept_no = 'd002';
SELECT * FROM departments_dup;

SELECT * FROM dept_manager_dup ORDER BY dept_no;
INSERT INTO dept_manager_dup select * from dept_manager;
DELETE FROM dept_mananger_dup WHERE dept_no = 'd001';
SELECT * FROM dept_manager_dup ORDER BY dept_no;
DROP TABLE dept_manager_dup;

CREATE TABLE dept_manager_dup(emp_no int(11) NOT NULL, dept_no char(4) NULL, 
from_date DATE NOT NULL, to_date date NULL);
INSERT INTO dept_manager_dup (emp_no, from_date) 
VALUES (999904, '2017-01-01'), (999905, '2017-01-01'),(999906,'2017-01-01'), (999907, '2017-01-01');
INSERT INTO dept_manager_dup select * from dept_manager;
DELETE FROM dept_mananger_dup WHERE dept_no = 'd001';
INSERT INTO departments_dup(dept_name) VALUES ('Public_Relations');
DELETE FROM departments_dup WHERE dept_no = 'd002';
SELECT * FROM dept_manager_dup ORDER BY dept_no;
DELETE FROM dept_manager_dup WHERE dept_no = 'd001';
SELECT * FROM dept_manager_dup ORDER BY dept_no;
SELECT * FROM departments_dup ORDER BY dept_no;
DELETE FROM departments_dup WHERE dept_name = 'Public_relations';
SELECT m.dept_no, m.emp_no, d.dept_name FROM dept_manager_dup m 
INNER JOIN departments_dup d ON m.dept_no = d.dept_no ORDER BY m.dept_no;
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date 
FROM employees e JOIN dept_manager dm ON e.emp_no = dm.emp_no;
SELECT m.dept_no, m.emp_no, d.dept_name # I prefer this method, write down 274 first and 273, this indicate the columns that will be joined 
FROM dept_manager_dup m INNER JOIN departments_dup d ON m.dept_no = d.dept_no 
GROUP BY m.dept_no ORDER BY m.dept_no; # INNER JOIN = JOIN,#GROUP BY m.dept_no is for the table to avoid duplicate, it is advised to use them 
# duplicate records
INSERT INTO dept_manager_dup
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');
INSERT INTO departments_dup
VALUES ('d009', 'Customer Services');
#Check dept_manager_dup and departments_dup
SELECT * FROM dept_manager_dup ORDER BY dept_no ASC;
SELECT * FROM departments_dup ORDER BY dept_no ASC;
DELETE FROM dept_manager_dup WHERE emp_no = '110228';
DELETE FROM departments_dup WHERE dept_no = 'd009';
SELECT * FROM departments_dup;
INSERT INTO dept_manager_dup
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');
INSERT INTO departments_dup
VALUES ('d009', 'Customer Services');
SELECT m.dept_no, m.emp_no, d.dept_name # I prefer this method, write down 274 first and 273, this indicate the columns that will be joined 
FROM dept_manager_dup m INNER JOIN departments_dup d ON m.dept_no = d.dept_no 
GROUP BY m.dept_no ORDER BY m.dept_no;
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN # LEFT JOIN = LEFT OUTER JOIN
     dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date #rem:dm.dept_no, dm.from_date to join from the other table  
FROM employees e LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no WHERE e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC, e.emp_no;
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
     dept_manager_dup m
        RIGHT JOIN 
     departments_dup d ON m.dept_no = d.dept_no
ORDER BY d.dept_no;
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
     departments_dup d
        LEFT JOIN 
     dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;
INSERT INTO dept_manager_dup
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');
INSERT INTO departments_dup
VALUES ('d009', 'Customer Services');
SELECT * FROM dept_manager_dup ORDER BY emp_no;
SELECT m.dept_no, m.emp_no, d.dept_name # I prefer this method, write down 274 first and 273, this indicate the columns that will be joined 
FROM dept_manager_dup m INNER JOIN departments_dup d ON m.dept_no = d.dept_no 
ORDER BY m.dept_no;
# WHERE is used instead of JOIN, but is more time cosuming and it is assumed to be old.
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager m, departments_dup d
WHERE m.dept_no = d.dept_no ORDER BY m.dept_no;
SELECT e.first_name, e.last_name, dm.dept_no, e.hire_date #old syntax using WHERE
FROM employees e, dept_manager dm WHERE e.emp_no= dm.emp_no; 
SELECT e.first_name, e.last_name, dm.dept_no, e.hire_date  #New syntax using JOIN
FROM employees e JOIN dept_manager dm ON e.emp_no= dm.emp_no;
#JOIN AND WHERE can be used together, where WHERE will serve as conditional statement
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e JOIN salaries s ON e.emp_no = s.emp_no WHERE s.salary > 145000;
SET @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
SELECT e.first_name, e.last_name, e.hire_date, t.title
FROM employees e JOIN titles t ON e.emp_no = t.emp_no;
#Cross Join
SELECT dm.*, d.* FROM dept_manager dm CROSS JOIN departments d ORDER BY dm.emp_no, d.dept_no;# CROSS JOIN  is the best practice in this case
SELECT dm.*, d.* FROM dept_manager dm, departments d ORDER BY dm.emp_no, d.dept_no; # this is referred as old intax, and it has no CROSS JOIN
SELECT dm.*, d.* FROM dept_manager dm JOIN departments d ORDER BY dm.emp_no, d.dept_no; # Still the same answer with JOIN
SELECT e.*, d.* FROM departments d CROSS JOIN dept_manager dm 
JOIN employees e ON dm.emp_no = e.emp_no ORDER BY dm.emp_no, d.dept_no;
SELECT dm.*, d.* FROM departments d CROSS JOIN dept_manager dm WHERE d.dept_no='d009' ORDER BY d.dept_no;
SELECT e.*, d.* FROM employees e CROSS JOIN departments d WHERE e.emp_no<10011 ORDER BY e.emp_no;
use employees;
SELECT e.gender, AVG(s.salary) AS avaerage_salary
FROM employees e JOIN salaries s ON e.emp_no = s.emp_no GROUP BY gender;
SELECT e.first_name, e.last_name, e.hire_date,m.from_date,d.dept_name
FROM employees e JOIN dept_manager m ON e.emp_no= m.emp_no
JOIN departments d ON m.dept_no = d.dept_no;
SELECT e.first_name,e.last_name,e.hire_date, t.title,m.from_date, d.dept_name
FROM employees e JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no 
JOIN titles t ON e.emp_no = t.emp_no WHERE t.title = 'Manager';
SELECT d.dept_name, AVG(salary) AS average_salary
FROM departments d JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN salaries s ON m.emp_no = s.emp_no GROUP BY d.dept_name ORDER BY average_salary;
SELECT d.dept_name, AVG(salary) AS average_salary
FROM departments d JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN salaries s ON m.emp_no = s.emp_no 
GROUP BY d.dept_name HAVING average_salary>60000 ORDER BY average_salary;
SELECT e.gender, COUNT(dm.emp_no) AS gender_count
FROM employees e JOIN dept_manager dm ON e.emp_no = dm.emp_no GROUP BY e.gender;
CREATE TABLE employees_dup(emp_no INT(11), birth_date date, first_name VARCHAR (14), 
last_name VARCHAR(16), gender enum('M', 'F'), hire_date date);
INSERT INTO employees_dup SELECT e.* FROM employees e LIMIT 20;
INSERT INTO employees_dup VALUES (10001, '1953-09-02', 'Georgi','Facello', 'M', '1986-06-26');
SELECT * FROM employees_dup;
INSERT INTO employees_dup SELECT e.* FROM employees e LIMIT 20;
INSERT INTO employees_dup VALUES (10001, '1953-09-02', 'Georgi','Facello', 'M', '1986-06-26');
#UNION VS UNION ALL
SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date FROM employees e WHERE e.emp_no = 10001
UNION ALL SELECT
NULL AS emp_no, NULL AS first_name, NULL AS last_name, m.dept_no, m.from_date
FROM dept_manager m; # note:union all will union both duplicate in the table
SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date FROM employees e WHERE e.emp_no = 10001
UNION SELECT
NULL AS emp_no, NULL AS first_name, NULL AS last_name, m.dept_no, m.from_date
FROM dept_manager m; # note:union will not union the duplicate in the table
SELECT * FROM(SELECT e.emp_no, e.first_name,e.last_name, NULL AS dept_no, NULL AS from_date 
FROM employees e WHERE last_name = 'Denis' 
UNION SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name,dm.dept_no, dm.from_date FROM dept_manager dm)
as a ORDER BY -a.emp_no DESC; #-work in contrast of DESC which is asceding
SELECT * FROM dept_manager;
#SQL Subqueiries
SELECT e.first_name, e.last_name FROM employees e WHERE e.emp_no 
IN (SELECT dm.emp_no FROM dept_manager dm); #it will run the inner_most, follow by outer most
SELECT dm.emp_no FROM dept_manager dm;
SELECT * FROM dept_manager WHERE emp_no 
IN (SELECT emp_no FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');
SELECT * FROM employees e WHERE EXISTS
(SELECT * FROM titles t WHERE t.emp_no = e.emp_no AND title = 'Assistant Engineer');
SELECT 
        A.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A # this serves as SUBSET A
    UNION SELECT 
        B.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;
    #QUIZ on SELECT INNER SUBQUERIES' REDO 
    SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d;
    
CREATE TABLE emp_manager (emp_no INT(11) NOT NULL, dept_no CHAR(4) NULL, manager_no INT(11) NOT NULL);
INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
    #SELF JOIN
    SELECT * FROM emp_manager ORDER BY emp_manager.emp_no;
    SELECT e1.* FROM emp_manager e1 JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no WHERE e2.emp_no IN (SELECT manager_no FROM emp_manager);
    
    #VIEWS
    SELECT * FROM dept_emp;
    SELECT emp_no, from_date, to_date, COUNT(emp_no) AS Num 
    FROM dept_emp GROUP BY emp_no HAVING Num >1;
    CREATE OR REPLACE VIEW v_dept_dup_latest_date AS SELECT emp_no,MAX(from_date) AS from_date, 
    MAX(to_date) AS to_date FROM dept_emp GROUP BY emp_no;
    SELECT emp_no,MAX(from_date) AS from_date, 
    MAX(to_date) AS to_date FROM dept_emp GROUP BY emp_no;
    #QUIZ
    CREATE OR REPLACE VIEW v_manager_avg_salary AS 
    SELECT ROUND(AVG(salary),2) FROM salaries s JOIN dept_manager m ON s.emp_no = m.emp_no;
    
    #PROCEDURE
    DROP PROCEDURE IF EXISTS select_employees;
    DELIMITER $$
    CREATE PROCEDURE select_employees()
    BEGIN
    SELECT * FROM employees
    LIMIT 1000;
    END$$
	DELIMITER ;
    call employees.select_employees(); #stored_routine
    CALL select_employees();
    
    DELIMITER $$   # this does not run, check again
    CREATE PROCEDURE avg_salary()
    USE employees $$;
    BEGIN
    SELECT AVG(salary)
    FROM salaries;
    END$$
    DELIMITER ;
    CALL avg_salary;
    CALL avg_salary();
    CALL employees.avg_salary();
    CALL employees.avg_salary;
    DROP PROCEDURE select_employees; # example for dropping procedure, not run
   use employees;
   DROP PROCEDURE IF EXISTS emp_salary;
   DELIMITER $$
   USE emoloyees $$
   CREATE PROCEDURE emp_salary (IN p_emp_no INTEGER) # to find the employment number details in the table
   BEGIN SELECT
   e.first_name, e.last_name, s.salary, s.from_date, s.to_date
   FROM employees e
   JOIN
   salaries s ON e.emp_no = s.emp_no
   WHERE 
   e.emp_no = p_emp_no;
   END$$
   DELIMITER ;
    DELIMITER $$
   USE emoloyees $$
   CREATE PROCEDURE emp_avg_salary (IN p_emp_no INTEGER) # to find the employment number details in the table
   BEGIN 
   SELECT
   e.first_name, e.last_name, AVG(s.salary)
   FROM employees e
   JOIN
   salaries s ON e.emp_no = s.emp_no
   WHERE 
   e.emp_no = p_emp_no;
   END$$
   DELIMITER ;
   #STORED PROCEDURES WITH AN OUTPUT PARAMETER
       DELIMITER $$
   USE emoloyees $$
   CREATE PROCEDURE emp_avg_salary_out (IN p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2)) # to find the employment number details in the table
   BEGIN 
   SELECT
   AVG(s.salary)
   INTO p_avg_salary FROM employees e
   JOIN
   salaries s ON e.emp_no = s.emp_no
   WHERE 
   e.emp_no = p_emp_no;
   END$$
   DELIMITER ;
   DELIMITER $$
   #creating the queries that parameters first_name and last_name and returns employee no
   CREATE PROCEDURE emp_info(in p_first_name VARCHAR(225), in p_last_name VARCHAR(255), out p_emp_no INTEGER)
   BEGIN SELECT e.emp_no
   INTO p_emp_no FROM employees e
   WHERE e.first_name = p_first_name AND e.last_name = P_last_name;
   END$$
   DELIMITER ;
# uses of variables
SET @v_avg_salary = 0; # this can be equal to any number but it is the CONVENTION to use 0.
CALL employees.emp_avg_salary_out(11300,@v_avg_salary);
SELECT @v_avg_salary;
#Exercise on Variables
SET @v_emp_no = 0;
CALL emp_info('aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;

#USER DEFINE FUNCTIONS
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
READS SQL DATA # PUT this word if it does not run due to 1418
BEGIN 
DECLARE v_avg_salary DECIMAL(10,2);
SELECT
AVG(s.salary)
INTO v_avg_salary FROM employees e JOIN 
salaries s ON emp_no = s.emp_no
WHERE e.emp_no = p.emp_no;
RETURN v_avg_salary;
END$$
DELIMITER ;
SELECT f_emp_avg_salary(11300);

#QUiz on function
DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN 
DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);
SELECT
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
SELECT
    s.salary
    INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
    RETURN v_salary;
END$$
DELIMITER ;
SELECT EMP_INFO('Aruna', 'Journel');
# Function calling
SET @ v_emp_no = 11300;
SELECT emp_no, first_name, last_name, f_emp_avg_salary(@v_emp_no) AS avg_skoalary
FROM employees
WHERE emp_no = @v_emp_no;

#ADVANCED FUNCTION
DROP FUNCTION IF EXISTS f_emp_avg_salary;
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
READS SQL DATA # PUT this word if it does not run due to 1418
BEGIN 
DECLARE v_avg_salary DECIMAL(10,2);
BEGIN
DECLARE v_avg_salary DECIMAL(10,2); # local variables
END;
SELECT
AVG(s.salary)
INTO v_avg_salary FROM employees e JOIN 
salaries s ON emp_no = s.emp_no
WHERE e.emp_no = p.emp_no;
RETURN v_avg_salary;
END$$
DELIMITER ;
SELECT f_emp_avg_salary(11300);

#SESSION VARIABLE # by user defined and system
SET @s_var1 = 3;
SELECT @s_var1;

#GLOBAL VARIABLES # set by system
SET GLOBAL max_connection = 1000;  #this will ensure max people that can coonect the server is 1000
SET @@global.max_connections = 1; #this will ensure max people that can coonect the server is 1


#TRIGGER
DELIMITER $$

CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary int;
    
    SELECT 
		MAX(salary)
	INTO v_curr_salary FROM
		salaries
	WHERE
		emp_no = NEW.emp_no;

	IF v_curr_salary IS NOT NULL THEN
		UPDATE salaries 
		SET 
			to_date = SYSDATE()
		WHERE
			emp_no = NEW.emp_no and to_date = NEW.to_date;

		INSERT INTO salaries 
			VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
    END IF;
END $$

DELIMITER ;

# After you are sure you have understood how this query works, please execute it and then run the following INSERT statement.  
INSERT INTO dept_manager VALUES ('111534', 'd009', date_format(sysdate(), '%y-%m-%d'), '9999-01-01');

# SELECT the record of employee number 111534 in the ‘dept_manager’ table, and then in the ‘salaries’ table to see how the output was affected. 
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no = 111534;
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 111534;
    
    ##QUIZ SOLUTION ON TRIGGER
DELIMITER $$
CREATE TRIGGER trig_hire_date 
BEFORE INSERT ON employees FOR EACH ROW BEGIN
	IF NEW.hire_date>date_format(sysdate(), '%Y-%m-%d') 
THEN SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d'); 
	END IF; 
END$$
DELIMITER $$;

#INDEXES
SELECT * FROM employees WHERE hire_date > '2000-01-01';
CREATE INDEX i_hire_date ON employees(hire_date);
SELECT * FROM employee WHERE first_name = 'Georgi' AND last_name = 'Facello';
ALTER TABLE employees
DROP INDEX i_hire_date;
SELECT * FROM salaries WHERE salary > 89000;
use employees;

# CASE STATEMENT
SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;
    
    SELECT dm.emp_no, e.first_name,e.last_name, 
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE 
    WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'salary was raised by more than 30000'
	WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'salary was raised by more than 30000 
    but less than $30000'
    ELSE'salary was raised by less than $20,000'
    END AS salary_increase 
    FROM
    dept_manager dm JOIN employees e ON e.emp_no = dm.emp_no JOIN
    salaries s ON s.emp_no = dm.emp_no GROUP BY s.emp_no;
    
    #Exercise on CASE STATEMENT
    Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, and 
    last name of all employees with a number higher than 109990. Create a fourth column in the query, indicating whether
    this employee is also a manager, according to the data provided in the dept_manager table, 
    or a regular employee
    SELECT
    e.emp_no, e.first_name, e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;


    
    
    