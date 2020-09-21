-- Return the first_name and email of females that work
-- in the tools deparment having a salary greater than
-- 110000

SELECT first_name, email
FROM employees
WHERE department ='Tools'
AND salary > 110000
AND gender ='F';


-- Return the firs_name and hire_date of those employees
-- who earn more than 165,000 as well as those employees
-- that work in the sports department and also happen to
-- be men

SELECT first_name, hire_date
FROM employees
WHERE salary > 165000
OR (department = 'Sports' AND gender = 'M')

-- Return the first_name and hire_date of those employees
-- who were hired during Jan 1st 2002 and Jan 1st 2004

SELECT first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2002-01-01' AND '2004-01-01'            

-- Return the male employees who work in the automotive
-- department and earn more than 40,000 and less than 
-- 100,000 as well as females that work in the toys 
-- department

SELECT *
FROM employees
WHERE salary > 40000 AND salary < 100000
AND department = 'Automotive'
AND gender = 'M'
OR (gender = 'F' AND department = 'Toys')