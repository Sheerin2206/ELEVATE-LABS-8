STORED PROCEDURE EXAMPLE

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

-- FUNCTION EXAMPLE

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

SELECT getSalary(2); 

DROP FUNCTION IF EXISTS getSalary;
