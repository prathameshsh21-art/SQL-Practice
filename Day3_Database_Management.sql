
-- Day 3: Database Management & Constraints
-- Topics:
-- HAVING, UPDATE, DELETE, ALTER TABLE,
-- FOREIGN KEY, CASCADE, TRUNCATE


CREATE DATABASE college;
USE college;

DROP TABLE IF EXISTS student;

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT,
    grade VARCHAR(2),
    city VARCHAR(50)
);

INSERT INTO student (rollno, name, marks, grade, city) VALUES
(101, 'anil', 78, 'C', 'Pune'),
(102, 'bhumika', 93, 'A', 'Mumbai'),
(103, 'chetan', 85, 'B', 'Mumbai'),
(104, 'dhruv', 96, 'A', 'Delhi'),
(105, 'emanuel', 12, 'F', 'Delhi'),
(106, 'farah', 82, 'B', 'Delhi');


-- HAVING Clause


SELECT city, COUNT(rollno)
FROM student
WHERE grade = 'A'
GROUP BY city
HAVING MAX(marks) > 90
ORDER BY city ASC;


-- UPDATE Operations

UPDATE student
SET grade = 'A'
WHERE marks BETWEEN 80 AND 90;

UPDATE student
SET marks = marks + 1;

UPDATE student
SET marks = 12, grade = 'F'
WHERE rollno = 105;


-- DELETE Operations

DELETE FROM student
WHERE marks < 30;


-- SQL Safe Updates

SET SQL_SAFE_UPDATES = 0;


-- ALTER TABLE Operations

ALTER TABLE student
ADD COLUMN age INT DEFAULT 21;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student
CHANGE COLUMN name full_name VARCHAR(50);

ALTER TABLE student
MODIFY COLUMN full_name VARCHAR(100);


-- Foreign Key & Cascade

CREATE TABLE dept (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id)
    REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO dept VALUES
(101, 'ENGLISH'),
(102, 'IT');

INSERT INTO teacher VALUES
(1, 'ALICE', 101),
(2, 'BOB', 102);

-- Test ON UPDATE CASCADE
UPDATE dept
SET id = 103
WHERE id = 102;


-- TRUNCATE TABLE

TRUNCATE TABLE student;


-- End of Day 3
