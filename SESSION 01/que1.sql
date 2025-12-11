-- 1. Create Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);
--G5-23BCS10117-VANSH KUMAR-SESSION 1
-- 2. Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(dept_id)
);

-- 3. Insert sample data
INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering');
--G5-23BCS10117-VANSH KUMAR-SESSION 1
INSERT INTO Employees VALUES
(101, 'Rahul Sharma', 55000, 1),
(102, 'Anita Verma', 60000, 2),
(103, 'Karan Singh', 75000, 3);

-- 4. Create a view
CREATE VIEW Employee_View AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.dept_id;
--G5-23BCS10117-VANSH KUMAR-SESSION 1
-- 5. Create a new role
CREATE ROLE Analyst;

-- 6. Grant SELECT on the view to the role
GRANT SELECT ON Employee_View TO Analyst;
