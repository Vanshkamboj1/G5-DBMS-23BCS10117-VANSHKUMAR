CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

CREATE TABLE Departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Asha', 10, 50000),
(2, 'Rohan', 10, 70000),
(3, 'Meera', 20, 40000),
(4, 'Kabir', 20, 55000),
(5, 'Isha', 30, 90000);

INSERT INTO Departments VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT');

WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY dept_id
),
cand AS (
    SELECT
        d.dept_name,
        e.emp_name,
        e.salary,
        ROUND(a.avg_salary,0) AS dept_avg_salary,
        ABS(e.salary - a.avg_salary) AS diff
    FROM Employees e
    JOIN Departments d ON e.dept_id = d.dept_id
    JOIN dept_avg a ON e.dept_id = a.dept_id
),
ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY dept_name ORDER BY diff ASC, salary DESC) AS rn
    FROM cand
)
SELECT dept_name, emp_name, salary, dept_avg_salary
FROM ranked
WHERE rn = 1
ORDER BY dept_name;
