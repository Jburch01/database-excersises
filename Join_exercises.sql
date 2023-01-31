-- JOIN EXAMPLE DATABASE
	-- 1.
		USE join_example_db;
        SELECT * FROM roles, users;
	-- 2. 
		SELECT * FROM users
        JOIN  roles;
        
		SELECT users.name AS user_name, roles.name AS role_name
        FROM users
        LEFT JOIN roles ON users.role_id = roles.id;
        
		SELECT users.name AS user_name, roles.name AS role_name
        FROM users
        RIGHT JOIN roles ON users.role_id = roles.id;
        
-- EMPLOYEES DATABASE
	-- 1.
		USE employees;
	-- 2. 
		SELECT * FROM employees LIMIT 10;
        SELECT * FROM dept_manager;
        SELECT * FROM departments; 
        
        SELECT departments.dept_name, 
        CONCAT(employees.first_name, ' ', employees.last_name) AS Manager_name FROM employees 
        JOIN dept_manager ON dept_manager.emp_no = employees.emp_no 
        JOIN departments ON departments.dept_no = dept_manager.dept_no
        WHERE dept_manager.to_date LIKE '9999%';
        
	-- 3.
		SELECT departments.dept_name, 
        CONCAT(employees.first_name, ' ', employees.last_name) AS Manager_name FROM employees 
        JOIN dept_manager ON dept_manager.emp_no = employees.emp_no 
        JOIN departments ON departments.dept_no = dept_manager.dept_no
        WHERE employees.gender LIKE 'F%' AND dept_manager.to_date LIKE '9999%';
        
	-- 4.
		SELECT DISTINCT title FROM titles LIMIT 20;
        SELECT * FROM departments LIMIT 10;
        SELECT * FROM dept_emp LIMIT 10;
        
        SELECT titles.title, COUNT(*) AS Count FROM titles
        JOIN dept_emp ON dept_emp.emp_no = titles.emp_no
        JOIN departments ON dept_emp.dept_no = departments.dept_no
        WHERE departments.dept_name LIKE 'CUSTO%' AND dept_emp.to_date LIKE '9999%' AND titles.to_date LIKE '9999%'
        GROUP BY titles.title;
        
	-- 5.
		SELECT * FROM salaries LIMIT 10;
        SELECT * FROM employees LIMIT 10;
        SELECT DISTINCT title FROM titles LIMIT 20;
        SELECT * FROM departments LIMIT 10;
        SELECT * FROM dept_emp LIMIT 10;
        SELECT * FROM dept_manager LIMIT 10;
	
        
        SELECT departments.dept_name AS Department_Name, 
		CONCAT(employees.first_name, ' ', employees.last_name) AS Name,
        salaries.salary AS Salary 
        FROM employees
        JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
        JOIN salaries ON employees.emp_no = salaries.emp_no
        JOIN departments ON dept_manager.dept_no = departments.dept_no
        WHERE dept_manager.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%';
        
	-- 6.
		SELECT departments.dept_no, departments.dept_name, COUNT(*) AS num_employees 
        FROM employees
        JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
        JOIN departments ON dept_emp.dept_no = departments.dept_no
        WHERE dept_emp.to_date LIKE '9999%'
        GROUP BY dept_no
        ORDER BY dept_no;
        
	-- 7.
		SELECT departments.dept_name AS Dept_name, avg(salaries.salary) AS average_salary FROM salaries
        Join dept_emp ON salaries.emp_no = dept_emp.emp_no
        Join departments ON dept_emp.dept_no = departments.dept_no
        WHERE salaries.to_date LIKE '9999%' AND 
        dept_emp.to_date LIKE '9999%'
        GROUP BY departments.dept_name
        ORDER BY average_salary DESC LIMIT 1;
        
	-- 8. 
		SELECT first_name, last_name , salaries.salary , departments.dept_name , departments.dept_no FROM employees
        Join dept_emp ON employees.emp_no = dept_emp.emp_no
        Join departments ON dept_emp.dept_no = departments.dept_no
        Join salaries ON dept_emp.emp_no = salaries.emp_no
        Where (dept_emp.to_date LIKE  '9999%' AND 
        salaries.to_date LIKE '9999%' AND
        departments.dept_name = 'Marketing')
        ORDER BY salaries.salary  DESC LIMIT 1; 
        
	-- 9. 
		
        SELECT * FROM salaries LIMIT 10;
        SELECT * FROM employees LIMIT 10;
        SELECT DISTINCT title FROM titles LIMIT 20;
        SELECT * FROM departments LIMIT 10;
        SELECT * FROM dept_emp LIMIT 10;
        SELECT * FROM dept_manager LIMIT 10;
        
		SELECT first_name, last_name, salaries.salary AS Salary, departments.dept_name AS dept_name FROM employees
        Join salaries ON salaries.emp_no = employees.emp_no
        Join dept_manager ON dept_manager.emp_no = salaries.emp_no
        Join departments ON dept_manager.dept_no = departments.dept_no
        WHERE (dept_manager.to_date LIKE  '9999%' AND 
        salaries.to_date LIKE '9999%' AND
        dept_name = 'Marketing');
        
	-- 10.
		SELECT dept_name, round(avg(salaries.salary)) AS average_salary  FROM departments
        JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
        JOIN salaries ON dept_emp.emp_no = salaries.emp_no
        GROUP BY dept_name
        ORDER BY average_salary DESC;
        
	-- 11.
	
       
        
        
        
        
        
        
	
        
        
        
        
        
		
        
        
        
        
        
        
        
        
        
        
	
        
		
    
        
		
        
        
        

	
        
       
		
		