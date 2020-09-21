-- Assignment 5: Practice with Subqueries

-- The puzzles in this assignment will involve the tables you prepared in 
-- assignment 1. You'll be using subqueries to retrieve information to 
-- the problems in this assignment.

-- In this section you'll practice working with subqueries. The questions
-- that follow are based on the tables you created in assignemnt one. The
-- image displays 3 of those tables you can use to solve the problems in 
-- this section. Review these tables and understand how the data is related
-- before moving one. 

-- QUESTIONS:

-- 1. Is the students table directly related to the courses table? why or why not?

-- The students table is not directly related to the courses table. There doesn't
-- seem to be any data in both tables which both can relate too, with the exception
-- of the student enrollment table. 

-- 2. Using subqueries only, write a SQL stateent that returns the names of those 
-- students that are taking the courses Physics and US History.

-- NOTE: Do not jump ahead and use joins. I want you to solve this problems using
-- only what you've learned in this section.

SELECT student_name FROM students
WHERE student_no IN 
	(
		SELECT student_no FROM student_enrollment
		WHERE course_no IN 
		(
			SELECT course_no FROM courses
			WHERE course_title IN ('Physics', 'US History')
		)
	)

-- 3. Using subqueries only, write a query that returns the name of the student
-- that is taking the highest number of courses.

-- NOTE: Do not jump ahead and use joins. I want you to to solve this problem using
-- only what you've learned in this section

SELECT student_name FROM students
WHERE student_no IN
(
	SELECT student_no FROM 
	(
		SELECT student_no, COUNT(student_no) AS num_of_classes FROM student_enrollment
		GROUP BY student_no
		ORDER BY COUNT(student_no) DESC
		LIMIT 1
	) student_no_with_num_of_classes
)

-- 4. Answer TRUE or FALSE for the following statement:
-- Subqueries can be used in the FROM clause and the WHERE clause but cannot be
-- used in the SELECT clause.

-- False, they can be used in all those clauses

-- 5. Write a query to find the student that is the oldest. You are not allowed to
-- use LIMIT or the ORDER BY clause to solve this problem.

SELECT * FROM students
WHERE age IN
(
	SELECT MAX(age) FROM students
)