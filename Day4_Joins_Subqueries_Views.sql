
-- Day 4: JOINS, SUBQUERIES & VIEWS


CREATE DATABASE day4;
USE day4;

-----------------
-- JOINS SETUP
-----------------
CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE course(
id INT PRIMARY KEY,
course_name VARCHAR(50)
);

INSERT INTO student VALUES
(101,'Anil'),
(102,'Bhumika'),
(103,'Chetan');

INSERT INTO course VALUES
(102,'Java'),
(103,'SQL'),
(104,'Python'),
(105,'C++');

--------------------------------------------
-- INNER JOIN
--------------------------------------------

SELECT *
FROM student s
INNER JOIN course c
ON s.id = c.id;

--------------------------------------------
-- LEFT JOIN
--------------------------------------------

SELECT *
FROM student s
LEFT JOIN course c
ON s.id = c.id;

---------------------------------------------
-- RIGHT JOIN
---------------------------------------------

SELECT *
FROM student s
RIGHT JOIN course c
ON s.id = c.id;

---------------------------------------------
-- FULL OUTER JOIN (Using UNION)
---------------------------------------------
SELECT *
FROM student s
LEFT JOIN course c
ON s.id = c.id

UNION

SELECT *
FROM student s
RIGHT JOIN course c
ON s.id = c.id;

---------------------------------------------
-- LEFT EXCLUSIVE JOIN
---------------------------------------------

SELECT *
FROM student s
LEFT JOIN course c
ON s.id = c.id
WHERE c.id IS NULL;

---------------------------------------------
-- RIGHT EXCLUSIVE JOIN
---------------------------------------------

SELECT *
FROM student s
RIGHT JOIN course c
ON s.id = c.id
WHERE s.id IS NULL;

---------------------------------------------
-- SELF JOIN
---------------------------------------------

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(20),
manager_id INT
);

INSERT INTO employee VALUES
(101,'ALICE',103),
(102,'ADAM',104),
(103,'CASEY',NULL),
(104,'DONALD',103);

SELECT a.name AS manager_name,
b.name AS employee_name
FROM employee a
JOIN employee b
ON a.id = b.manager_id;

---------------------------------------------
-- UNION
---------------------------------------------

SELECT id FROM student
UNION
SELECT id FROM course;

---------------------------------------------
-- SUBQUERIES
---------------------------------------------

CREATE TABLE student_marks(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT,
grade VARCHAR(2),
city VARCHAR(50)
);

INSERT INTO student_marks VALUES
(101,'anil',78,'C','Pune'),
(102,'bhumika',93,'A','Mumbai'),
(103,'chetan',85,'B','Mumbai'),
(104,'dhruv',96,'A','Delhi'),
(105,'emanuel',12,'F','Delhi'),
(106,'farah',82,'B','Delhi');

-- Students scoring above average

SELECT name, marks
FROM student_marks
WHERE marks >
(
SELECT AVG(marks)
FROM student_marks
);

-- Even Roll Numbers

SELECT name, rollno
FROM student_marks
WHERE rollno IN
(
SELECT rollno
FROM student_marks
WHERE rollno % 2 = 0
);

-- Maximum marks among Delhi students

SELECT MAX(marks)
FROM
(
SELECT *
FROM student_marks
WHERE city = 'Delhi'
) AS temp;

---------------------------------------------
-- VIEWS
---------------------------------------------
CREATE VIEW view1 AS
SELECT rollno, name, marks
FROM student_marks;

SELECT *
FROM view1
WHERE marks > 90;

DROP VIEW view1;

---------------------------------------------
-- End of Day 4
---------------------------------------------
