SELECT first_name, department, 
(SELECT COUNT(*) FROM employees e2 WHERE e1.department = e2.department)
FROM employees e1


-- OVER(PARTITION BY )allows to isolate a column from a table for a less expensive query search

SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department)
FROM employees

-- another exmaple with total number of employees in department and regions

SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department) AS num_in_dept,
region_id,
COUNT(*) OVER(PARTITION BY region_id) AS num_in_region
FROM employees


SELECT first_name, department, COUNT(*) OVER()
FROM employees
WHERE region_id = 3

-- first thing that gets looked at is the 
-- 1. FROM CLAUSE
-- 2. WHERE CLAUSE
-- 3. SELECT LIST