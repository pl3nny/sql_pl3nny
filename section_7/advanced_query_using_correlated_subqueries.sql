SELECT first_name, salary
FROM employees
WHERE salary > (SELECT round(AVG(salary)) FROM employees)


-- avg sub query will run for every record in the initial query
-- query below gets the average salary for each department
SELECT first_name, salary
FROM employees e1
WHERE salary > (SELECT round(AVG(salary)) 
				FROM employees e2 WHERE e1.department = e2.department)

                
-- another example by setting a column as a corolated subquery
SELECT first_name, department, salary,
(
	SELECT round(AVG(salary))
	FROM employees e2
	WHERE e1.department = e2.department
) AS avg_department_salary

FROM employees e1

-- write a query that contains more than 30 employees per department 

SELECT e1.first_name, e1.department
FROM employees e1
WHERE e1.department IN 
(
	SELECT e2.department
	FROM employees e2
	GROUP BY e2.department
	HAVING COUNT(e2.employee_id) > 38
)
ORDER BY department

--  better solotion below as it only involves searching each department no not each employee


SELECT department FROM departments d
WHERE 38 < 
(
	SELECT COUNT(*) 
	FROM employees e
	WHERE d.department = e.department
)

-- Add another column with the highest paid employee from the departments in the previous
-- query

SELECT department, 
(
	SELECT MAX(salary)
	FROM employees e
	WHERE e.department = d.department
)
FROM departments d
WHERE 38 < 
(
	SELECT COUNT(*)
	FROM employees e
	WHERE d.department = e.department
)