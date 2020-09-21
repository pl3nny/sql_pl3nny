-- example FROM clause; needs an alias in this case it's the letter 'a' 
--  or give it another name kinda like AS 'some name'
SELECT *
FROM (SELECT department FROM departments) a

-- exmaple using in SELECT clause
SELECT first_name, last_name, salary, (SELECT first_name FROM employees LIMIT 1)
FROM employees

-- returnt the salary that appears the most frequent
-- if there are multiple salaries that have the number of frequency then return
-- the highest salary

-- gotta give the subquery an 'Alias' alt name when using FROM

SELECT salary FROM (
	SELECT salary, count(*)
	FROM employees
	GROUP BY salary
	ORDER BY COUNT DESC, salary DESC
	LIMIT 1
	) a