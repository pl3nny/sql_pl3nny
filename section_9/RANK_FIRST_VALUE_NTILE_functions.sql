
-- each employee is ranked by their salary in their given department

SELECT first_name, email, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees

-- can isolate a given rank

SELECT * FROM
(
SELECT first_name, email, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees
) a
WHERE RANK = 8


-- NTILE
-- will a given number of buckets
-- in this case it splits the salary into 5 different brackets
SELECT first_name, email, department, salary,
NTILE(5) OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees

-- FIRST_VALUE
-- will show the first salary for the given department
SELECT first_name, email, department, salary,
FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees

-- NTH_VALUE
SELECT first_name, email, department, salary,
NTH_VALUE(salary, 5) OVER(PARTITION BY department ORDER BY first_name ASC) nth_value
FROM employees