USE employees;
DESCRIBE employees;
SELECT * FROM employees;


SELECT first_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya'); -- 709
SELECT first_name FROM employees WHERE first_name = 'Irena'OR 'Vidya' OR 'Maya'; -- 241 
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') and gender = 'M'; -- 179973
SELECT * FROM employees WHERE last_name LIKE 'E%'; -- 7330
SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E'; -- 30723 starts and ends with E
SELECT * FROM employees WHERE last_name LIKE '%E'; -- ends with E
SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E'; -- 899 starts and ends with E

SELECT * FROM employees WHERE hire_date >= '1990-01-01' AND hire_date <= '1999-12-31';-- 135214

SELECT * FROM employees WHERE birth_date LIKE '%12-25%'; -- 842
SELECT * FROM employees WHERE birth_date LIKE '%12-25%'AND (hire_date >= '1990-01-01' AND hire_date <= '1999-12-31'); -- 362

SELECT * FROM employees WHERE last_name LIKE '%q%';-- 1873
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';-- 547



