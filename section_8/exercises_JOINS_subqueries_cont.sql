-- show the first name, department, hire_date, country from the first and last employee hired
SELECT first_name, department, hire_date, country
FROM employees, regions
WHERE employees.region_id = regions.region_id
AND
hire_date IN 
(
	SELECT MAX(hire_date)
	FROM employees
	UNION
	SELECT MIN(hire_date)
	FROM employees
)
ORDER BY hire_date DESC
LIMIT 2

-- another way

SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r ON e.region_id = r.region_id
WHERE 
hire_date = (SELECT MIN(hire_date) FROM employees)
OR
hire_date = (SELECT MAX(hire_date) FROM employees)
LIMIT 2

-- antoher way

(SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r ON e.region_id = r.region_id
WHERE 
hire_date = (SELECT MIN(hire_date) FROM employees)
LIMIT 1 )
UNION
SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r ON e.region_id = r.region_id
WHERE 
hire_date = (SELECT MAX(hire_date) FROM employees)


-- get a report that records the the sum of the salary for every 90 days