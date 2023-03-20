-- Final check: personal judgement: bank employees must decide if the applicant appears trustworthy 

-- Create function: if any one of the checks is not met the application will be rejected

DELIMITER // 
CREATE FUNCTION application_status(
owner_check BOOLEAN, 
turnover_check BOOLEAN, 
trustworthiness_check BOOLEAN ) 
RETURNS VARCHAR(55) 
DETERMINISTIC 
BEGIN 
DECLARE loan_status VARCHAR(20); 
IF owner_check = 1 
AND turnover_check = 1 
AND trustworthiness_check = 1
THEN SET loan_status = 'Approved'; 
ELSE SET loan_status = 'Rejected';
END IF;
RETURN (loan_status);
END //

DELIMITER ;

-- View the table: 

SELECT * FROM loan_application_employee_check;

-- Run the function: 

SELECT *, application_status(owner_check, turnover_check, trustworthiness_check) FROM Loan_Application_Employee_Check;






