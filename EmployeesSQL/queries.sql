-- list the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	employees.emp_no,last_name,first_name,sex, salary
	
FROM
	employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no;	

-- List first name, last name, and hire date for employees who were hired in 1986.



SELECT first_name,last_name,hire_date FROM employees
WHERE EXTRACT(year FROM "hire_date") = 1986


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT 
	dept_manager.dept_no,dept_name,employees.emp_no,last_name,first_name
	
FROM
	employees
INNER JOIN dept_manager on employees.emp_no = dept_manager.emp_no
INNER JOIN departments on dept_manager.dept_no = departments.dept_no;


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	employees.emp_no,last_name,first_name,dept_name
FROM
	employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no



-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."


SELECT first_name, last_name,sex FROM employees
WHERE first_name LIKE 'Hercules' and last_name LIKE 'B%'
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	employees.emp_no,last_name,first_name,dept_name
FROM
	employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no

WHERE departments.dept_name LIKE 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	employees.emp_no,last_name,first_name,dept_name
FROM
	employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no

WHERE departments.dept_name LIKE 'Sales' or departments.dept_name LIKE 'Development';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.


SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name 
ORDER BY COUNT DESC

