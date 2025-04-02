-- zadanie 1 --
SELECT COUNT(emp_no)
FROM dept_emp
WHERE from_date <= CURRENT_DATE() AND to_date >= CURRENT_DATE();

-- zadanie 2 --

SELECT  COUNT (DISTINCT title)
FROM titles;

-- zadanie 3 --

SELECT AVG(salary), STD(salary)
FROM salaries
WHERE from_date <= CURRENT_DATE() AND to_date >= CURRENT_DATE(); 