USE business_bank;

-- Create an insert stored procedure for new loan applications, as this would be an online form 

select * from loan_applications;

DELIMITER // 

CREATE PROCEDURE new_loan_application(
IN application_id INT, 
IN first_name VARCHAR(55), 
IN last_name VARCHAR(55), 
IN gender VARCHAR(55), 
IN business_name VARCHAR(55), 
IN business_reg_no_la CHAR(3), 
IN business_account_no_la CHAR(8), 
IN annual_turnover DECIMAL(8,2), 
IN loan_amount_requested DECIMAL(8,2), 
IN contact_email_address VARCHAR(55), 
IN terms_and_conditions_accepted BOOLEAN)

BEGIN 
INSERT INTO Loan_Applications(application_id, first_name, last_name, gender, business_name, business_reg_no_la, business_account_no_la, annual_turnover, loan_amount_requested, contact_email_address, terms_and_conditions_accepted)
VALUES (application_id, first_name, last_name, gender, business_name, business_reg_no_la, business_account_no_la, annual_turnover, loan_amount_requested, contact_email_address, terms_and_conditions_accepted);
END//

DELIMITER ;

-- Call the procedure to insert a new loan application for £20,000 with confirmed terms and conditions 

CALL new_loan_application(4, 'amelia', 'hasani', 'female', 'business accountant', 444, 111444, 40000.00, 20000.00, 'amelia@businessaccountant.com', 1);

SELECT * FROM loan_applications;



