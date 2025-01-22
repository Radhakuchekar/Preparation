-- reference https://datalemur.com/questions/sql-second-highest-salary
-- Note here windowing is not used as we have to find 2nd salary of all employees and there is no need to do windowing
-- window functions will add Unnecessary Complexity
SELECT  max(salary) as second_highest_salary
FROM employee 
where salary < (select max(salary) from employee);


-- alternate way considering - Ditinct values of salary are under consideration
SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;