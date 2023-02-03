USE employees;
SELECT * FROM employees LIMIT 10;
SELECT * FROM dept_emp LIMIT 10;
SELECT * FROM salaries LIMIT 10;
SELECT * FROM departments;


-- 1. 
	SELECT CONCAT(first_name, ' ', last_name) AS employee_name, 
    dept_no, hire_date AS 'start_date', to_date AS 'end_date',
     IF(to_date = '9999-01-01', 1 , 0) AS is_current_employee FROM dept_emp
	JOIN employees USING(emp_no) ;
   
-- 2. 
	SELECT last_name, 
    CASE 
    WHEN SUBSTR(last_name, 1, 1) BETWEEN 'A' AND 'H' THEN 'A-H'
    WHEN SUBSTR(last_name, 1, 1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
    WHEN SUBSTR(last_name, 1, 1) BETWEEN 'R' AND 'Z' THEN 'R-Z'
    ELSE 'NOT IN THE ALPHABET!'
    END AS 'alpha-group'
    FROM employees;
  
-- 3.
	SELECT 
    COUNT(IF(birth_date LIKE '195%', 1, NULL)) AS '1950s', 
	COUNT(IF(birth_date LIKE '196%',1 , NULL)) AS '1960s'
    FROM employees;
  
  -- DOESN'T WORK
  
  -- SELECT birth_date, 
  --  COUNT(CASE WHEN birth_date LIKE '195%' THEN '1950s'), 
  --  COUNT(CASE WHEN birth_date LIKE '196%' THEN '1960s')
    
 --   AS Decade_Born
  --  FROM employees
 -- GROUP BY birth_date;
    
   -- SELECT birth_date,
    -- IF(birth_date LIKE '195%', 1, 0) AS '1950s', 
	-- IF(birth_date LIKE '196%',1 , 0) AS '1960s'
    -- FROM employees;
  
	
-- 4.
	SELECT 
    
    AVG(CASE WHEN departments.dept_name = 'Research' OR departments.dept_name = 'Development' THEN salaries.salary ELSE NULL END) AS 'average_R&D',
    AVG(CASE WHEN departments.dept_name = 'Sales' OR departments.dept_name = 'Marketing' THEN salaries.salary ELSE NULL END) AS 'average_Sales&Marketing',
    AVG(CASE WHEN departments.dept_name = 'Production' OR departments.dept_name = 'Quality Management' THEN salaries.salary ELSE NULL END) AS 'average_Prod_QM',
	AVG(CASE WHEN departments.dept_name = 'Finance' OR departments.dept_name = 'Human Resources' THEN salaries.salary ELSE NULL END) AS 'average_Finance&HR',
	AVG(CASE WHEN departments.dept_name = 'Customer Service' THEN salaries.salary ELSE NULL END) AS 'average_CustomerService'
    FROM departments
	JOIN dept_emp USING (dept_no)
	JOIN salaries USING (emp_no)
	WHERE dept_emp.to_date > NOW() AND salaries.to_date > NOW()


    
    
    
    
    
	

    