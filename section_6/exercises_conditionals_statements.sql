-- get total counts of each salary category in query below

SELECT first_name, salary,
CASE
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 AND salary < 160000 THEN 'PAID WELL'
    WHEN salary > 160000 THEN 'EXECUTIVE'
	ELSE 'UNPAID'
END AS category
FROM employees
ORDER BY salary DESC

-- answer

SELECT category, COUNT(category)
FROM 
(
	SELECT first_name, salary,
	CASE
		WHEN salary < 100000 THEN 'UNDER PAID'
		WHEN salary > 100000 AND salary < 160000 THEN 'PAID WELL'
		WHEN salary > 160000 THEN 'EXECUTIVE'
		ELSE 'UNPAID'
	END AS category
	FROM employees
	ORDER BY salary DESC
) category_count
GROUP BY category
ORDER BY COUNT(category) DESC

-- same question as above but have the categories as columns using conditionals
--  CASE, THEN, END

SELECT 
SUM ( CASE WHEN salary < 100000 THEN 1 ELSE 0 END) AS "UNDER PAID",
SUM ( CASE WHEN salary > 100000 AND salary < 160000 THEN 1 ELSE 0 END) AS "PAID WELL",
SUM ( CASE WHEN salary > 160000 THEN 1 ELSE 0 END) AS "EXECUTIVE"
FROM employees

-- Do the same with this query like the example above

SELECT department, COUNT(*)
FROM employees
WHERE department IN ('Sports', 'Tools', 'Clothing', 'Computers')
GROUP BY department

-- do work below
SELECT
SUM ( CASE WHEN department = 'Tools' THEN 1 ELSE 0 END) AS Tools,
SUM ( CASE WHEN department = 'Sports' THEN 1 ELSE 0 END) AS Sports,
SUM ( CASE WHEN department = 'Clothing' THEN 1 ELSE 0 END) AS Clothing,
SUM ( CASE WHEN department = 'Computers' THEN 1 ELSE 0 END) AS Computers
FROM employees


-- do the same with employees and output what regions they are like in the previoius
-- examples

SELECT first_name,
( CASE WHEN region_id = 1 THEN (SELECT country FROM regions WHERE region_id = 1) ELSE NULL END ) AS region_1,
( CASE WHEN region_id = 2 THEN (SELECT country FROM regions WHERE region_id = 2) ELSE NULL END ) AS region_2,
( CASE WHEN region_id = 3 THEN (SELECT country FROM regions WHERE region_id = 3) ELSE NULL END ) AS region_3,
( CASE WHEN region_id = 4 THEN (SELECT country FROM regions WHERE region_id = 4) ELSE NULL END ) AS region_4,
( CASE WHEN region_id = 5 THEN (SELECT country FROM regions WHERE region_id = 5) ELSE NULL END ) AS region_5,
( CASE WHEN region_id = 6 THEN (SELECT country FROM regions WHERE region_id = 6) ELSE NULL END ) AS region_6,
( CASE WHEN region_id = 7 THEN (SELECT country FROM regions WHERE region_id = 7) ELSE NULL END ) AS region_7
FROM employees

-- generate a report with the number of employees in each country

SELECT
COUNT(a.region_1) + COUNT(a.region_2) + COUNT(a.region_3) AS "United State",
COUNT(a.region_5) + COUNT(a.region_5) AS "Asia",
COUNT(a.region_6) + COUNT(a.region_7) AS "Canada"
FROM
(
	SELECT first_name,
	( CASE WHEN region_id = 1 THEN (SELECT country FROM regions WHERE region_id = 1) ELSE NULL END ) AS region_1,
	( CASE WHEN region_id = 2 THEN (SELECT country FROM regions WHERE region_id = 2) ELSE NULL END ) AS region_2,
	( CASE WHEN region_id = 3 THEN (SELECT country FROM regions WHERE region_id = 3) ELSE NULL END ) AS region_3,
	( CASE WHEN region_id = 4 THEN (SELECT country FROM regions WHERE region_id = 4) ELSE NULL END ) AS region_4,
	( CASE WHEN region_id = 5 THEN (SELECT country FROM regions WHERE region_id = 5) ELSE NULL END ) AS region_5,
	( CASE WHEN region_id = 6 THEN (SELECT country FROM regions WHERE region_id = 6) ELSE NULL END ) AS region_6,
	( CASE WHEN region_id = 7 THEN (SELECT country FROM regions WHERE region_id = 7) ELSE NULL END ) AS region_7
	FROM employees 
) a