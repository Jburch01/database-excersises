USE employees;

SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;
SELECT * FROM employees WHERE hire_date LIKE '199%' and birth_date LIKE '%12-25%' ORDER BY hire_date LIMIT 5;
-- Alseim Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup

SELECT * FROM employees LIMIT 5 OFFSET 45; -- limit is to have 5 per page Offset is the number skipped and the page number is the limit times the OFFSET  
