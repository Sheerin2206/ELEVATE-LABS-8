Stored Procedures and User-Defined Functions (UDFs) in MySQL used to perform reusable database operations on the employees and salary tables.
 
 Stored Procedure: getsalarydetails
 Purpose:
 Fetches the employee name and salary amount for a given employee ID.

Syntax:

DELIMITER //
CREATE PROCEDURE getsalarydetails(IN empID INT)
BEGIN   
    SELECT e.emp_name, s.salary_amnt    
    FROM employees e  
    JOIN salary s ON e.emp_id = s.emp_id    
    WHERE e.emp_id = empID;
END //
DELIMITER ;

CALL getsalarydetails(2);

DROP PROCEDURE IF EXISTS getsalarydetails;

Function: getSalary
Purpose:
Returns the salary amount for a given employee ID.

 Syntax:

DELIMITER //
CREATE FUNCTION getSalary(empID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE empSal INT;
SELECT salary_amnt INTO empSal 
    FROM salary 
    WHERE emp_id = empID;
RETURN empSal;
END //
DELIMITER ;

SELECT getSalary(3);

DROP FUNCTION IF EXISTS getSalary;
