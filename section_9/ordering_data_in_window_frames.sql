-- adding each row to the new column running_total_of_salaries
-- with the OVER clause

SELECT first_name, hire_date, salary, 
SUM(salary) OVER(ORDER BY hire_date 
				 RANGE BETWEEN UNBOUNDED PRECEDING 
				 AND CURRENT ROW) AS running_total_of_salaries
FROM employees
ORDER BY hire_date

-- RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW is default when using ORDER BY inside OVER
-- CLAUSE

SELECT first_name, hire_date, salary, 
SUM(salary) OVER(ORDER BY hire_date) AS running_total_of_salaries
FROM employees
ORDER BY hire_date

-- get a running total for each row in a given department

SELECT first_name, hire_date, department, salary, 
SUM(salary) OVER(PARTITION BY department ORDER BY hire_date) AS running_total_of_salaries
FROM employees
ORDER BY hire_date

-- adds up the last 3 rows ROWS BETWEEN 3 PRECEDING AND CURRENT ROW

SELECT first_name, hire_date, department, salary, 
SUM(salary) OVER(ORDER BY hire_date ROWS BETWEEN 3 PRECEDING AND CURRENT ROW)
FROM employees
