SELECT 
    d.dept_name,
    COUNT(e.emp_id) AS num_employees,
    AVG(e.salary) AS avg_salary,
    CASE 
        WHEN COUNT(e.emp_id) = 0 THEN 'No Employees'
        WHEN AVG(e.salary) >= 60000 THEN 'High Avg'
        WHEN AVG(e.salary) BETWEEN 50000 AND 59999 THEN 'Medium Avg'
        WHEN AVG(e.salary) < 50000 THEN 'Low Avg'
    END AS salary_category
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY d.dept_name;
