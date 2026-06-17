-- Day 1: SQL Basics

-- Create Student Table
CREATE TABLE student(
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT NOT NULL
);

-- Insert Data
INSERT INTO student VALUES(1,'PRATHAMESH',21);
INSERT INTO student(id,age) VALUES(2,23);
INSERT INTO student VALUES(3,'ALICE',23);

-- Display Data
SELECT * FROM student;

-- Create Employee Table
CREATE TABLE employee(
  id INT PRIMARY KEY,
  name VARCHAR(15),
  salary INT NOT NULL
);

-- Insert Data
INSERT INTO employee VALUES(1,'adam',25000);
INSERT INTO employee VALUES(2,'bob',30000);
INSERT INTO employee VALUES(3,'casey',40000);

-- Display Data
SELECT * FROM employee;
