-- Assignment 7: Advanced Problems using Joins, Grouping and Subqueries

-- The problems in this assignment section get even more challenging.You'll acquire practice
-- using JOINS and working with subqueries. You will also be tested on your knowledge of
-- correlated subqueries. Take as long as you need to work through this section.

-- The questions that follow will be related to the tables that you created in assignment one.
-- Query those tables and try to figure out how the data is related. 

--  Those tables are:
--  students, courses, student_enrollment, professors, and teach.

-- The following problems are related to these.

SELECT * FROM students -- student_no | student_name | age
SELECT * FROM student_enrollment -- student_no | course_no
SELECT * FROM teach -- last_name | course_no
SELECT * FROM courses -- course_no | course_title | credits
SELECT * FROM professors -- last_name | department | salary | hire_date

-- QUESTIONS

-- 1. Are the tables student_enrollement and professors direcly related to each other?
-- why or why not?

-- They are not directly related, as they do not have matching data

-- 2. Write a query that shows the student's name, the courses the student is taking and the 
-- professors that teach that course.

SELECT s.student_name, se.course_no, t.last_name
FROM students s 
INNER JOIN student_enrollment se
ON s.student_no = se.student_no
INNER JOIN teach t
ON se.course_no = t.course_no
INNER JOIN professors p
ON t.last_name = p.last_name
ORDER BY s.student_name

-- 3. If you execute the query from the prevoius answer, you'll notice the student_name and
-- the course_no is being repeated. Why is this happening?

-- multple professors are teaching some of the same subjects as the other professors which
-- is causing some of the students to show as repeated rows

-- 4. In question 3 you discovered why there is repeating data. How can we eliminiate this
-- redundancy? Let's say we only care to see a single professor teaching a course and we
-- don't care for all the other professors that teach the particular course. Write a query
-- that will accomplish this so that every record is distinct.

-- HINT: Using the DISTINCT keywork will not help


-- before learning you can use INNER JOIN more than once in the same query
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

-- AFTER LEARNING 

SELECT student_name, course_no, MIN(last_name)
FROM 
(
	SELECT s.student_name, se.course_no, t.last_name
	FROM students s 
	INNER JOIN student_enrollment se
	ON s.student_no = se.student_no
	INNER JOIN teach t
	ON se.course_no = t.course_no
	INNER JOIN professors p
	ON t.last_name = p.last_name
	ORDER BY s.student_name, se.course_no
) a
GROUP BY student_name, course_no
ORDER BY student_name, course_no

-- 5. Why are correlated subqueries slower than non-correlated subqueries and joins?

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



