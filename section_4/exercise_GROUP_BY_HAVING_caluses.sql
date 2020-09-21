-- get number of duplicate first names from employees table

-- aggregated data filtered to only show employees with same first name
SELECT first_name, COUNT(*)
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY first_name


-- get unique department in employee table to simulate the query below
SELECT DISTINCT department
FROM employees

-- answer
SELECT department
FROM employees
GROUP BY department

-- get unique domain from employees and the count of those domains
SELECT SUBSTRING(email, POSITION('@' IN email) + 1) AS employee_email_domain_list, COUNT(email)
FROM employees
WHERE email IS NOT NULL
GROUP BY employee_email_domain_list
ORDER BY COUNT(email) DESC

-- show min, max, avg salary broken down by region and gender
