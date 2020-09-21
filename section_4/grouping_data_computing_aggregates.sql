-- get total count of employees for each department

SELECT department, COUNT(*) AS "Number of Employees"
FROM employees
GROUP BY department

-- OR

SELECT department, COUNT(employee_id) AS "Number of Employees"
FROM employees
GROUP BY department


-- group by department and get number of employees, ave, min, max salary and 
-- ordered by descending order

SELECT department, COUNT (employee_id) AS total_number_employees, 
round(AVG(salary)) AS avg_salary, MIN(salary) AS min_salary, 
MAX(salary) AS max_salary
FROM employees
GROUP BY department
ORDER BY total_number_employees DESC


-- aggregated columns
-- columns must be aggregated before 
SELECT department, gender, COUNT(*)
FROM employees
GROUP BY department, gender
ORDER BY department

-- HAVING setting a condition when grouping 
SELECT department, COUNT(employee_id)
FROM employees
GROUP BY department
HAVING COUNT(employee_id) > 35
ORDER BY department

-- WHERE filters records, does not filter aggregated data
-- HAVING filters aggregated data i.e. GROUP BY data
SELECT gender, region_id,
MIN(salary) AS min_salary,
MAX(salary) AS max_salary,
round(AVG(salary)) AS avg_salary
FROM employees
GROUP BY gender, region_id
ORDER BY gender, region_id