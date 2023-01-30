USE employees;
DESCRIBE employees;
SELECT * FROM employees;


SELECT first_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya'); -- 709
SELECT first_name FROM employees WHERE first_name = 'Irena'OR 'Vidya' OR 'Maya'; -- 241 
SELECT * FROM employees WHERE first_name = ('Irena'OR 'Vidya' OR 'Maya') and gender = 'M'; -- 179973
SELECT * FROM employees WHERE last_name LIKE 'E%'; -- 7330
SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E'; -- 30723 starts and ends with E
SELECT * FROM employees WHERE last_name LIKE '%E'; -- ends with E
SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E'; -- 899 starts and ends with E

SELECT * FROM employees WHERE hire_date >= '1990-01-01' AND hire_date <= '1999-12-31';-- 135214

-- ORDER BY EXERCISES

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name; -- Irena Reutenaurer was first and Vidya Simmen was last
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name; -- Irena Action was first and Vidya Zweizig was last
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name; -- Irena Action was first and Maya Zyda was last
SELECT * FROM employees WHERE last_name LIKE 'E%e' ORDER BY emp_no; -- 899 emp_no = 10021 Ramzi Erde was first and emp_no = 499648 Tadahiro Erde was last
SELECT * FROM employees WHERE last_name LIKE 'E%e' ORDER BY hire_date DESC; -- 899, Teiji Eldridge was is newest Sergi Erde is oldest 
SELECT * FROM employees WHERE hire_date LIKE '199%' and birth_date LIKE '%12-25%' 
 ORDER BY birth_date, hire_date DESC; -- 362 Khun Bernini was oldest hired last 
 SELECT * FROM employees WHERE hire_date LIKE '199%' and birth_date LIKE '%12-25%' 
 ORDER BY birth_date DESC, hire_date DESC; -- Youngest hired first Douandi Pettis 
 
 -- FUNCTION EXERCISES
 USE employees;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees WHERE last_name LIKE 'e%E';
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name FROM employees WHERE last_name LIKE 'e%E';

SELECT DateDIFF(now(), hire_date) AS days_worked_for FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25%';

SELECT  min(salary), max(salary) FROM salaries
WHERE to_date = '9999-01-01';

SELECT lower(CONCAT(SUBSTR(first_name, 1, 1),
 SUBSTR(last_name, 1, 4),
 '_',
SUBSTR(birth_date, 6, 2),
SUBSTR(birth_date, 3 ,2)))
AS user_name,
first_name,
last_name,
birth_date 
FROM employees
LIMIT 10;





 
 
 