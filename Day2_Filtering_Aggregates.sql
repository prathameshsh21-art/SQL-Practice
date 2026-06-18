-- =========================
-- Day 2: Filtering & Aggregates
-- =========================

CREATE TABLE student(
  roll_no INT PRIMARY KEY,
  student_name VARCHAR(50),
  marks INT NOT NULL,
  grade VARCHAR(1),
  city VARCHAR(35)
);

INSERT INTO student(roll_no,student_name,marks,grade,city)
VALUES
(101,'anil',73,'B','pune'),
(102,'bhumiuka',100,'A','beng'),
(103,'chetan',85,'B','hydrabad'),
(104,'dhruv',96,'A','mumbai'),
(105,'emanuel',12,'F','pune'),
(106,'fharan',82,'B','pune');

-- View Data
SELECT * FROM student;

-- DISTINCT
SELECT DISTINCT city FROM student;
SELECT DISTINCT grade FROM student;

-- WHERE Clause
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city = 'pune';

-- AND Operator
SELECT * FROM student
WHERE marks > 70 AND city = 'pune';

-- OR Operator
SELECT * FROM student
WHERE marks < 70 OR city = 'pune';

-- Arithmetic Operators
SELECT * FROM student WHERE marks + 10 >= 100;
SELECT * FROM student WHERE marks - 10 > 71;
SELECT * FROM student WHERE marks * 2 >= 150;
SELECT * FROM student WHERE marks / 2 != 50;

-- BETWEEN
SELECT * FROM student
WHERE marks BETWEEN 80 AND 90;

-- IN
SELECT * FROM student
WHERE city IN ('pune','beng','delhi');

-- NOT IN
SELECT * FROM student
WHERE city NOT IN ('pune','beng');

-- LIMIT
SELECT * FROM student
WHERE marks > 75
LIMIT 3;

-- ORDER BY + LIMIT
SELECT * FROM student
ORDER BY marks DESC
LIMIT 3;

SELECT * FROM student
ORDER BY marks ASC
LIMIT 1;

-- Aggregate Functions
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT COUNT(roll_no) FROM student;

-- ORDER BY
SELECT * FROM student
ORDER BY city DESC;

-- GROUP BY
SELECT city, COUNT(*)
FROM student
GROUP BY city;

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY AVG(marks) ASC;


-- =========================
-- Customer Table Practice
-- =========================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer VARCHAR(100) NOT NULL,
    mode VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO customers (customer_id, customer, mode, city) VALUES
(101, 'Olivia Barrett', 'Netbanking', 'Portland'),
(102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
(103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
(104, 'Liam Donovan', 'Netbanking', 'Denver'),
(105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
(106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
(107, 'Ava Patel', 'Debit Card', 'Phoenix'),
(108, 'Lucas Carter', 'Netbanking', 'Boston'),
(109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
(110, 'Jackson Brooks', 'Credit Card', 'Boston');

SELECT mode, COUNT(*)
FROM customers
GROUP BY mode;
