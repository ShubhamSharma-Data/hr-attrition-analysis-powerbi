-- HR Attrition Analysis: SQL queries (SQLite / DB Browser for SQLite)
-- Table: hr_attrition (IBM HR Analytics Employee Attrition dataset, 1,470 rows)

-- 1. Row count (expect 1470)
SELECT COUNT(*) AS total_rows FROM hr_attrition;

-- 2. Duplicate employees (expect no rows)
SELECT EmployeeNumber, COUNT(*) AS cnt
FROM hr_attrition
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- 3. Missing values in key columns (expect 0)
SELECT COUNT(*) AS missing_rows
FROM hr_attrition
WHERE Attrition IS NULL OR Attrition = ''
   OR Department IS NULL OR Department = ''
   OR MonthlyIncome IS NULL OR MonthlyIncome = '';

-- 4. Overall attrition rate
SELECT COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM hr_attrition;

-- 5. Attrition by department
SELECT Department,
       COUNT(*) AS headcount,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_cnt,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM hr_attrition
GROUP BY Department
ORDER BY attrition_pct DESC;

-- 6. Attrition by job role
SELECT JobRole,
       COUNT(*) AS headcount,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM hr_attrition
GROUP BY JobRole
ORDER BY attrition_pct DESC;

-- 7. Attrition by overtime
SELECT OverTime,
       COUNT(*) AS headcount,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM hr_attrition
GROUP BY OverTime;
