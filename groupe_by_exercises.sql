-- 1.
	USE employees;
	SHOW CREATE TABLE titles;
	SELECT * FROM titles LIMIT 10;
-- 2. 
	SELECT DISTINCT title FROM titles; -- 7 distinct titles
-- 3. 
	SELECT last_name FROM employees
	WHERE last_name LIKE 'E%e'
	GROUP BY last_name;
-- 4. 
	SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees
    WHERE last_name LIKE 'E%e'
    GROUP BY full_name;
-- 5. 
	SELECT last_name FROM employees 
    WHERE last_name LIKE '%q%' AND 
    last_name NOT LIKE '%qu%'
    GROUP BY last_name; -- Chleq, Lindqvist, Qiwen
-- 6. 
	SELECT last_name, COUNT(*) FROM employees 
    WHERE last_name LIKE '%q%' AND 
    last_name NOT LIKE '%qu%'
    GROUP BY last_name;
-- 7.
	SELECT first_name, gender, COUNT(*) FROM employees
    WHERE first_name IN ('Irena', 'Vidya', 'Maya')
    GROUP BY first_name, gender
    ORDER BY first_name;
-- 8.
	SELECT DISTINCT lower(CONCAT(SUBSTR(first_name, 1, 1),
	SUBSTR(last_name, 1, 4),
	'_',
	SUBSTR(birth_date, 6, 2),
	SUBSTR(birth_date, 3 ,2)))
	AS user_name,
    COUNT(*) AS multi_occurrences
	FROM employees
    GROUP BY user_name;
   
-- 9. YES 6
	SELECT SUM(multi_occurrences) FROM (
	SELECT DISTINCT lower(CONCAT(SUBSTR(first_name, 1, 1),
	SUBSTR(last_name, 1, 4),
	'_',
	SUBSTR(birth_date, 6, 2),
	SUBSTR(birth_date, 3 ,2)))
	AS user_name,
    COUNT(*) AS multi_occurrences
	FROM employees
    GROUP BY user_name
    HAVING multi_occurrences > 1) AS multi_username_sum

	
    

