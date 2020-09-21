-- Write a query where you only see unique data, but also show ID

CREATE table dupes (id integer, name varchar(10));

INSERT INTO dupes VALUES(1, 'FRANK');
INSERT INTO dupes VALUES(2, 'FRANK');
INSERT INTO dupes VALUES(3, 'ROBERT');
INSERT INTO dupes VALUES(4, 'ROBERT');
INSERT INTO dupes VALUES(5, 'SAM');
INSERT INTO dupes VALUES(6, 'FRANK');
INSERT INTO dupes VALUES(7, 'PETER');

SELECT * FROM dupes


-- answer
SELECT * FROM dupes
WHERE id IN 
	(
		SELECT MIN(id) 
		FROM dupes
		GROUP BY name
	)

-- Find the average salary in the company that excludes the max and min salaries i.e. outliers 
SELECT ROUND(AVG(salary)) FROM employees
WHERE salary NOT IN
(
	(SELECT MIN(salary) FROM employees),
	(SELECT MAX(salary) FROM employees)
)

-- has multiple subqueries seperated by commas