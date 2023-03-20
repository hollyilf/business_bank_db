/* Trigger for new loan applications 
The database will not accept applications where: 
- i) The loan amount requested is over £25,000
- ii) The terms and conditions have not been confirmed */ 

USE business_bank;

-- Creating the trigger

DELIMITER // 
CREATE TRIGGER new_application_requirements 
BEFORE INSERT ON loan_applications 
FOR EACH ROW 
BEGIN 
IF (NEW.loan_amount_requested > 25000.00 OR NEW.terms_and_conditions_accepted = 0)
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sorry, your application has not met our requirements';
END IF;
END;// 

DELIMITER ;

-- Try inserting a loan request for £30,000 with confirmed terms and conditions - will trigger the message 

INSERT INTO loan_applications 
(application_id, first_name, last_name, gender, business_name, business_reg_no_la, business_account_no_la, annual_turnover, loan_amount_requested, contact_email_address, terms_and_conditions_accepted)
VALUES 
(4, 'amelia', 'hasani', 'female', 'business accountant', 444, 111444, 30000.00, 30000.00, 'amelia@businessaccountant.com', 1);

-- -- Try inserting a loan request for £20,000 with unconfirmed terms and conditions - will trigger the message 

INSERT INTO loan_applications 
(application_id, first_name, last_name, gender, business_name, business_reg_no_la, business_account_no_la, annual_turnover, loan_amount_requested, contact_email_address, terms_and_conditions_accepted)
VALUES 
(4, 'amelia', 'hasani', 'female', 'business accountant', 444, 111444, 30000.00, 20000.00, 'amelia@businessaccountant.com', 0);

-- SELECT * FROM loan_applications;




