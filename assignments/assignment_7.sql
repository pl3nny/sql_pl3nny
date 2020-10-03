-- Assignment 7: Advanced Problems using Joins, Grouping and Subqueries

-- The problems in this assignment section get even more challenging.You'll acquire practice
-- using JOINS and working with subqueries. You will also be tested on your knowledge of
-- correlated subqueries. Take as long as you need to work through this section.

-- The questions that follow will be related to the tables that you created in assignment one.
-- Query those tables and try to figure out how the data is related. 

--  Those tables are:
--  students, courses, student_enrollment, professors, and teach.

-- The following problems are related to these.

-- QUESTIONS

-- 1. Are the tables student_enrollement and professors direcly related to each other?
-- why or why not?

-- They are not directly related, as they do not have matching data

-- 2. Write a query that shows the student's name, the courses the student is taking and the 
-- professors that teach that course.

SELECT s.student_name, c.course_title, p.last_name
FROM students s, courses c, professors p

-- 3. If you execute the query from the prevoius answer, you'll notice the student_name and
-- the course_no is being repeated. Why is this happening?

-- the tables are multiplying with other expanding the number of records
-- 6*5*10 = 300 records

-- 4. In question 3 you discovered why there is repeating data. How can we eliminiate this
-- redundancy? Let's say we only care to see a single professor teaching a course and we
-- don't care for all the other professors that teach the particular course. Write a query
-- that will accomplish this so that every record is distinct.

-- HINT: Using the DISTINCT keywork will not help

SELECT 
student_name,
(SELECT course_title FROM courses WHERE enrolled.course_no = courses.course_no), 
enrolled.last_name
FROM
(
	SELECT student_no, se.course_no, last_name
	FROM student_enrollment se INNER JOIN teach t
	ON se.course_no = t.course_no
) enrolled INNER JOIN students 
ON students.student_no = enrolled.student_no
WHERE enrolled.last_name = 'Chong'

-- 5. Why aare correlated subqueries slower than non-correlated subqueries and joins?

-- correlated subqueries run for every record

-- 6. In the video lectures, we've been discussing the employees table and the department table.
-- Considering those tables, write a query that returns employees whose salary is above
-- average for their given department.

SELECT employee_id, first_name, department, salary
FROM employees e1
WHERE salary > 
(
	SELECT round(AVG(salary)) FROM employees e2 
	WHERE e1.department = e2.department
)

-- 7. Write a query that returns ALL the students as well as any courses they may or may 
-- not be taking



