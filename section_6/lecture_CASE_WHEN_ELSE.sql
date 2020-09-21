-- conditional statements and expressions

SELECT first_name, salary,
CASE
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 AND salary < 160000 THEN 'PAID WELL'
    ELSE 'EXECUTIVE'
END
FROM employees
ORDER BY salary DESC