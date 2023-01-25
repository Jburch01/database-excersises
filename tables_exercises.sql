SHOW CREATE DATABASE employees;
USE employees;
SHOW Tables;
DESCRIBE employees;
 -- int, date carchar(14), varchar(16), enum, and date
-- Which table(s) do you think contain a numeric type column? emp_no
-- Which table(s) do you think contain a string type column? first_name, last_name, gender
-- Which table(s) do you think contain a date type column? birth_date, hire-date
DESCRIBE departments;
DESCRIBE dept_emp;
SELECT * FROM dept_emp;
SELECT * FROM employees;
SELECT * FROM departments;


-- What is the relationship between the employees and the departments tables? Both have an emp_no. 
SHOW CREATE TABLE dept_manager;
