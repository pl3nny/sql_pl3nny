
-- CREATE VIEW saves the query with the given alias
-- note that views cannot have the data alterened it can only be viewed ...hence view

CREATE VIEW v_employee_information AS
SELECT first_name, email, e.department, salary, division, region, country
FROM employees e, departments d, regions r
WHERE 
e.region_id = r.region_id AND e.department = d.department


SELECT * FROM v_employee_information

SELECT first_name, department, region
FROM v_employee_information

-- inline view

SELECT * FROM (SELECT * FROM departments) a