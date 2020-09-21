-- example WHERE clause
SELECT *
FROM employees
WHERE department IN  (SELECT department FROM departments)


-- example FROM clause; needs an alias in this case it's the letter 'a' 
--  or give it another name kinda like AS 'some name'
SELECT *
FROM (SELECT department FROM departments) a

-- exmaple using in SELECT clause
SELECT first_name, last_name, salary, (SELECT first_name FROM employees LIMIT 1)
FROM employees

SELECT * FROM departments

-- get all the employees that work in the Electronics division
SELECT * FROM employees
WHERE department IN (SELECT department FROM departments WHERE division = 'Electronics')

-- get employees that work in asia or canada and make over $130K
SELECT * FROM employees
WHERE region_id IN (SELECT region_id FROM regions WHERE country = 'Asia' or country = 'Canada')
AND salary > 130000
ORDER BY region_id ASC

-- show the first name and department they work for and how much less they make from the highest
-- paid employee in the company

SELECT first_name, department, ((SELECT MAX(salary) FROM employees) - salary) AS diff_salary
FROM employees


-- answer
SELECT first_name, department, ((SELECT MAX(salary) FROM employees) - salary) AS diff_salary
FROM employees
WHERE region_id IN (SELECT region_id FROM regions WHERE country = 'Asia' or country = 'Canada')
ORDER BY diff_salary DESC

-- Write a quer that retuns all of those employees that work in the kids division AND
-- the dates at which those employees were hired is greater than all of the hire_dates
-- of employees who work in the maintenance department

SELECT * FROM departments

SELECT department
FROM departments
WHERE division = 'Kids'

SELECT * FROM employees
WHERE department IN (SELECT department FROM departments WHERE division = 'Kids')
AND
hire_date > ALL (SELECT hire_date FROM employees WHERE department = 'Maintenance')
ORDER BY department


-- returnt the salary that appears the most frequent
-- if there are multiple salaries that have the number of frequency then return
-- the highest salary


SELECT salary FROM (
	SELECT salary, count(*)
	FROM employees
	GROUP BY salary
	ORDER BY COUNT DESC, salary DESC
	LIMIT 1
	) a

-- other method

SELECT salary
FROM employees
GROUP BY salary
HAVING count(*)>= ALL (
	SELECT count(*) FROM employees GROUP BY salary)
ORDER BY salary DESC
LIMIT 1