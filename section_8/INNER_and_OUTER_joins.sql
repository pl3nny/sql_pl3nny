-- create a report that gives first_name, email, division
-- no null data in email column

SELECT * FROM employees

SELECT first_name,
(
	CASE WHEN email IS NULL THEN 'no email' ELSE email END
)	
, division
FROM employees, departments
WHERE employees.department = departments.department
ORDER BY division

-- get a roport that gives the country and the total amount of employees 
-- employed in that country

SELECT country, COUNT(employee_id)
FROM regions, employees
WHERE employees.region_id = regions.region_id
GROUP BY country

-- joining tables
SELECT first_name, country
FROM employees INNER JOIN regions
ON employees.region_id = regions.region_id

-- another example
SELECT first_name, email, division
FROM employees INNER JOIN departments
ON employees.department = departments.department

-- another example
SELECT first_name, email, division
FROM employees INNER JOIN departments
ON employees.department = departments.department
WHERE email IS NOT NULL

-- adding more than 2 tables
SELECT first_name, email, division, country
FROM employees INNER JOIN departments
ON employees.department = departments.department
-- adding a 3rd table
INNER JOIN regions 
ON employees.region_id = regions.region_id
WHERE email IS NOT NULL

-- --------------------------------------------

-- 3 more departments than departments table
SELECT DISTINCT department FROM employees
-- 27 departments

-- has 3 less departments than employees table
SELECT DISTINCT department FROM departments
-- 24 departments

SELECT distinct employees.department, departments.department
FROM employees INNER JOIN departments ON employees.department = departments.department


-- LEFT JOIN get all the data from the left table 
-- RIGHT JOIN get all the data from the right table


-- LEFT JOIN
SELECT distinct employees.department, departments.department
FROM employees LEFT JOIN departments ON employees.department = departments.department

-- RIGHT JOIN
SELECT distinct employees.department, departments.department
FROM employees RIGHT JOIN departments ON employees.department = departments.department


-- exercise
-- display the departments that are not in the departments table from employees table

SELECT distinct employees.department employees_department, departments.department departments_department
FROM employees LEFT JOIN departments ON employees.department = departments.department
WHERE departments.department IS NULL


-- FULL OUTER JOIN gives all the data from both tables


-- FULL OUTER JOIN
SELECT distinct employees.department employees_department, departments.department departments_department
FROM employees FULL OUTER JOIN departments ON employees.department = departments.department