-- output the department that shows the department, first_name, salary, 
-- salary_in_department (highest salary or lowest salary)
-- On the departments table there should be two one for highest paid and 
-- one for lowest paid

-- examples

-- department |  first_name | salary | salary_in_department
-- --------------------------------------------------------
-- Automotive    Mill         150000   Highest salary
-- Automoive     Joe          50000    Lowest salary
-- etc...

SELECT department, first_name, e1.salary, 
(
	SELECT 
	CASE 
		WHEN e1.salary IN (SELECT MIN(salary) FROM employees e2 GROUP BY department) THEN 'LOWEST SALARY'
		WHEN e1.salary IN (SELECT MAX(salary) FROM employees e3 GROUP BY department) THEN 'HIGHEST SALARY'
	END
)
FROM employees e1
WHERE
(
	salary IN
		(
			(SELECT MIN(salary) FROM employees GROUP BY department)
		)
	OR 
	salary IN
		(
			(SELECT MAX(salary) FROM employees GROUP BY department)
		)
)
ORDER BY department

-- steps before 
-- get MAX salary from each department
SELECT department, MAX(salary)
FROM employees
GROUP BY department
ORDER BY department

-- get MIN salary from each department
SELECT department, MIN(salary)
FROM employees
GROUP BY department
ORDER BY department

-- tag name with each departments max salaries
SELECT department, first_name, salary
FROM employees
WHERE salary IN
(
	SELECT MAX(salary)
	FROM employees
	GROUP BY department
)
ORDER BY department

-- tag name with each departments min salaries
SELECT department, first_name, salary
FROM employees
WHERE salary IN
(
	SELECT MIN(salary)
	FROM employees
	GROUP BY department
)
ORDER BY department