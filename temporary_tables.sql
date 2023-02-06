Show databases;
USE oneil_2105;

create temporary table my_numbers
(
n int unsigned not null,
name varchar(20) not null
)
;

-- VIEW table That I created
SELECT * FROM my_numbers;

-- INSERT DATA into my table

insert into my_numbers(n, name)
values('1', 'a') , ('2', 'b'), ('3', 'c'), ('4', 'd'), ('5', 'e');

-- verify that data was inserted
SELECT * FROM my_numbers;

-- UPDATE values in temp table
update my_numbers 
set name = 'BIG'
where n >= 4
;

-- DELETE values form temp table

delete from my_numbers 
where n = 2;

-- TEMP TABLE EXERCISES

USE employees;
SELECT * FROM employees LIMIT 10;
SELECT * FROM dept_emp LIMIT 10;
SELECT * FROM salaries LIMIT 10;
SELECT * FROM departments;

-- 1.
	SELECT first_name, last_name, dept_name FROM employees
    join dept_emp USING (emp_no)
    join departments USING (dept_no)
    WHERE dept_emp.to_date > NOW();

	create temporary table oneil_2105.employees_with_departments AS
    (
    SELECT first_name, last_name, dept_name FROM employees
    join dept_emp USING (emp_no)
    join departments USING (dept_no)
    WHERE dept_emp.to_date > NOW()
    );
    
    SELECT * FROM oneil_2105.employees_with_departments LIMIT 10;
   -- A.
		SELECT CONCAT(first_name, ' ', last_name) FROM employees;
   
		Alter Table oneil_2105.employees_with_departments
        ADD full_name VARCHAR(100);
    
-- B. 
	UPDATE oneil_2105.employees_with_departments
    SET full_name = CONCAT(first_name, ' ', last_name);
    
-- C.
	Alter Table oneil_2105.employees_with_departments
    Drop column first_name,
    Drop column last_name;
    
    drop table oneil_2105.employees_with_departments;
    
 -- D.
	-- Using SELECTs and JOINS with subqueries
    
-- 2.
 USE sakila;
 SHOW tables;
 SELECT * FROM payment;
 
 create temporary table oneil_2105.payments_copy AS
 (
 SELECT * FROM payment
 );
 
 Select * FROM oneil_2105.payments_copy LIMIT 10;
 ALTER TABLE oneil_2105.payments_copy MODIFY COLUMN amount decimal(7, 2);
 UPDATE oneil_2105.payments_copy
SET amount = round(amount * 100);
ALTER TABLE oneil_2105.payments_copy MODIFY COLUMN amount int;
 SELECT * FROM oneil_2105.payments_copy LIMIT 10;
 
 DESCRIBE oneil_2105.payments_copy;

-- 3. 
USE employees;
	
SELECT dept_name, avg(salary) AS Average_Salary FROM dept_emp
 JOIN departments USING (dept_no)
 JOIN salaries USING (emp_no)
 WHERE dept_emp.to_date > now() AND
 salaries.to_date > now()
 GROUP BY dept_name;
    
    
	 create temporary table oneil_2105.employees_copy AS
 (
 SELECT dept_name, avg(salary) AS Average_Salary FROM dept_emp
 JOIN departments USING (dept_no)
 JOIN salaries USING (emp_no)
 WHERE dept_emp.to_date > now() AND
 salaries.to_date > now()
 GROUP BY dept_name
 );
	
Select avg(salary) From salaries 
where to_date > now();

Select stddev(salary) From salaries
where to_date > now();

Select * FROM oneil_2105.employees_copy;
ALTER TABLE oneil_2105.employees_copy
ADD Z_SCORE float;

UPDATE oneil_2105.employees_copy 
SET Z_Score = ROUND((Average_Salary -
 (
Select avg(salary) From employees.salaries 
where to_date > now()
))

/

(
Select stddev(salary) From employees.salaries
where to_date > now()
), 2)
;

SELECT * FROM  oneil_2105.employees_copy;
    