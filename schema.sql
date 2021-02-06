-- Delete tables
DROP TABLE IF EXISTS salaries; 
DROP TABLE IF EXISTS dept_emp; 
DROP TABLE IF EXISTS dept_manager; 
DROP TABLE IF EXISTS employees; 
DROP TABLE IF EXISTS titles; 
DROP TABLE IF EXISTS departments; 

-- Create departments table 
CREATE TABLE departments (
	dept_no VARCHAR (10) NOT NULL PRIMARY KEY,
	dept_name VARCHAR (30) NOT NULL);

-- Create titles table 
CREATE TABLE titles (
	title_id VARCHAR (10) NOT NULL PRIMARY KEY,
	title VARCHAR (30) NOT NULL);

-- Create employees table 
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR (10) NOT NULL,
	birth_date DATE NOT NULL, 
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	sex VARCHAR (10) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id));
	
-- Create dept_manager table 
CREATE TABLE dept_manager (
	dept_no VARCHAR (10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),	
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (dept_no, emp_no));

-- Create dept_emp table 
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	dept_no VARCHAR (10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  	PRIMARY KEY (emp_no, dept_no));
	
-- Create salaries table 
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),	
	salary INT NOT NULL);

-- Set date format
SET DateStyle TO MDY; 

-- Import departments.csv to table
copy departments from 'C:\Users\Owner\SQL-Challenge\EmployeeSQL\data\departments.csv'
DELIMITER ','
CSV HEADER;

-- Import titles.csv to table
copy titles from 'C:\Users\Owner\SQL-Challenge\EmployeeSQL\data\titles.csv'
DELIMITER ','
CSV HEADER;

-- Import employees.csv to table
copy employees from 'C:\Users\Owner\SQL-Challenge\EmployeeSQL\data\employees.csv'
DELIMITER ','
CSV HEADER;

-- Import dept_manager.csv to table
copy dept_manager from 'C:\Users\Owner\SQL-Challenge\EmployeeSQL\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;

-- Import dept_emp.csv to table
copy dept_emp from 'C:\Users\Owner\SQL-Challenge\EmployeeSQL\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

-- Import salaries.csv to table
copy salaries from 'C:\Users\Owner\SQL-Challenge\EmployeeSQL\data\salaries.csv'
DELIMITER ','
CSV HEADER;