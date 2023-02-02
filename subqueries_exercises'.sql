USE employees;
SELECT * FROM employees LIMIT 10;
SELECT *  FROM titles LIMIT 10;
SELECT * FROM dept_emp LIMIT 10;

-- 1. 
	SELECT * FROM employees WHERE
    hire_date = (
		SELECT hire_date 
        FROM employees
        WHERE emp_no = 101010);

-- 2.
	SELECT * FROM (
	SELECT title, first_name, employees.emp_no FROM employees 
	JOIN titles ON titles.emp_no = employees.emp_no
    JOIN dept_emp ON dept_emp.emp_no = titles.emp_no
    WHERE employees.first_name = 'Aamod' AND
    dept_emp.to_date LIKE '9999%') AS kdja;
    
-- 3. 
	SELECT * FROM 
    (Select COUNT(*) FROM dept_emp
    WHERE dept_emp.to_date 
    NOT LIKE '9999%')AS kd; -- 91479 
    
-- 4. 
	SELECT * FROM (
	SELECT departments.dept_name,gender,
        CONCAT(employees.first_name, ' ', employees.last_name) AS Manager_name FROM employees 
        JOIN dept_manager ON dept_manager.emp_no = employees.emp_no 
        JOIN departments ON departments.dept_no = dept_manager.dept_no
        WHERE employees.gender LIKE 'F%' AND dept_manager.to_date LIKE '9999%') as A;
	
-- 5.
	SELECT CONCAT(first_name, ' ', last_name) AS employee_name, salary FROM employees
	JOIN salaries ON salaries.emp_no = employees.emp_no
     WHERE salary >  (Select avg(salary) FROM salaries) AND
    salaries.to_date LIKE '9999%';
    
-- 6. 
	SELECT COUNT(*) FROM salaries
    WHERE salary >= (SELECT MAX(salary) FROM salaries 
    WHERE salaries.to_date LIKE '9999%') - 
    (SELECT stddev(salary) FROM salaries
	WHERE salaries.to_date LIKE '9999%')
    AND to_date LIKE '9999%'; 
    
   SELECT 83 / (select COUNT(*) FROM salaries 
    where salaries.to_date LIKE '9999%');
    

		
      
      
