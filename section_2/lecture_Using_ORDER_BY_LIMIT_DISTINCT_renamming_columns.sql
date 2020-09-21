-- Order data by descending 

SELECT *
FROM employees
ORDER BY department desc

-- 'desc' is used to order data in descending order
-- by default the ORDER BY will output data in ascending order
-- or type next to column 'asc'

SELECT *
FROM employees
ORDER BY department asc


-- DISTINCT will show unique data list

SELECT  DISTINCT department
FROM employees

-- LIMIT (some number) will get the first 10 records
-- FETCH FIRST # ROWS
-- ORDER BY 1 will organize data by ascending order

SELECT DISTINCT department
FROM employees
ORDER BY 1
FETCH FIRST 10 ROWS ONLY