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

