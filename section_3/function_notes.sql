-- UPPER and LOWER
-- UPPER will make all characters upper case
-- LOWER will make all characters lower case
SELECT UPPER(first_name), LOWER(department)
FROM employees;


-- LENGTH
-- will ouptut the number of characters in that data
SELECT LENGTH(first_name), LOWER(department)
FROM employees;

-- TRIM
-- cuts out empty space out outside of the character string
SELECT TRIM ('      HELLO THERE       ');
-- outout: HELLO THERE


-- concatenating columns data by using pipes " || "
-- add space or data will be grouped together with no space
SELECT first_name || ' ' || last_name
FROM employees


-- examples for boolean expressions
SELECT first_name || ' ' || last_name full_name, (salary > 140000) is_highly_paid
FROM employees
ORDER BY salary DESC
-- boolean expression (salary > 140000)
-- will output true or false as a column


-- examples
SELECT department, ('Clothing' IN (department))
FROM employees

SELECT department, (department like '%oth%') AS "other table last"
FROM employees

------------------------------------------------------------------

-- STRING FUNCTIONS

-- SUBSTRING, FROM, FOR, REPLACE, POSITION, COALESCE

-- strings start at position 1, not 0 like other programming languages
-- FROM: what position ie. index
-- FOR: how many characters to extract from the substring

-- example
SELECT SUBSTRING ('this is a test data' FROM 1 FOR 4)
-- output: this

SELECT SUBSTRING ('this is test data' FROM 9 FOR 4)
-- output: test

-- REPLACE (column, name, new name)
SELECT department, REPLACE(department, 'Clothing', 'Attire')
FROM departments

SELECT department, 
REPLACE(department, 'Clothing', 'Attire') modified_data,
department || ' Department' AS "Complete Department Name"
FROM departments


-- POSITION
-- get position of @ from employees emails

SELECT POSITION('@' IN email)
FROM employees

-- get domains from employee emails
SELECT SUBSTRING(email, POSITION('@' IN email))
FROM employees

-- example
SELECT SUBSTRING(email, POSITION('@' IN email) + 1) AS "Employee Email Domains"
FROM employees
WHERE email IS NOT NULL 

-- COALESCE
-- first arguement is the column
-- second what to replace NULL too

-- exmaple
SELECT COALESCE (email, 'NONE') AS email
FROM employees

-------------------------------------------------------------------

-- MAX, MIN, AVG, COUNT, SUM

-- returns highest paid from employees
SELECT MAX(salary)
FROM employees

-- returns lowest paid from employees
SELECT MIN(salary)
FROM employees

-- returns average from the data in the column

SELECT AVG(salary)
FROM employees

-- retuns the count associated with that table
-- examples
SELECT COUNT(employee_id)
FROM employees

-- does not count the employees that have null as email
SELECT COUNT(email)
FROM employees

-- get all count from all records
SELECT COUNT(*)
FROM employees

-- get sum of values in column
SELECT SUM(salary)
FROM employees

-- GROUP BY
SELECT COUNT(*), make
FROM cars
GROUP BY make