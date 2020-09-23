-- columns gotta match before using UNION


-- UNION will stack both tables in the same column
SELECT department
FROM employees
UNION
SELECT department
FROM departments

-- UNION will get all the distinct records and stack them and eliminate the duplicates

-- UNION ALL does not eliminate duplicates
SELECT DISTINCT department
FROM employees
UNION ALL
SELECT department
FROM departments

-- EXCEPT takes the first result set removes any row that's found in the second result set
-- kinda like minus
SELECT DISTINCT department
FROM employees
EXCEPT
SELECT department
FROM departments


-- generate a report that gives the number of employees in each department and
-- at the end there should be a TOTAL with the total number of employees, in our case 1000
SELECT department, COUNT(employee_id) FROM employees
GROUP BY department
UNION ALL
SELECT 'Total', COUNT(employee_id) FROM employees