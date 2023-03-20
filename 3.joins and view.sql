USE business_bank;

/* The bank employees check the applications using SELECT statments with subqueries 
-- First check: does the business name, registration number, and annual turnover on the form match those listed with the Regulator? 
-- Second check: does the first name, last name, and account number match those listed with the bank? 
*/ 

-- Use this subquery to pull up relevant details from the business_regulator for all loan applicants 

SELECT business_reg_no, business_name, annual_turnover 
FROM business_regulator 
WHERE business_reg_no 
IN 
(SELECT business_reg_no_la 
FROM loan_applications)
ORDER BY business_reg_no;

-- Or specify by searching using the business_reg_no, for example: 

SELECT business_reg_no, business_name, annual_turnover 
FROM business_regulator 
WHERE business_reg_no 
IN 
(SELECT business_reg_no_la 
FROM loan_applications
WHERE business_reg_no_la = 222);

-- Use this subquery to pull up relevant details from business_owners table for all loan applicants 

SELECT first_name, last_name, account_number_bo 
FROM business_owners 
WHERE account_number_bo
IN 
(SELECT business_account_no_la 
FROM loan_applications)
ORDER BY account_number_bo;

-- Or specify by searching by last name, as the Business Regulator can contain multiple owners for some businesses 

SELECT first_name, last_name, account_number_bo 
FROM business_owners 
WHERE account_number_bo
IN 
(SELECT business_account_no_la 
FROM loan_applications
WHERE last_name = 'andov');

/* Compile all of this information into a view: */

CREATE VIEW vw_application_employee_check
AS 
SELECT DISTINCT t1.first_name, t1.last_name, t1.business_account_no_la as account_no, t1.business_name, t1.business_reg_no_la as business_reg_no, t1.annual_turnover
FROM loan_applications t1
JOIN business_owners B1 
ON 
t1.first_name = B1.first_name
JOIN business_owners B2
ON 
t1.last_name = B2.last_name
JOIN business_owners B3 
ON 
t1.business_account_no_la = B3.account_number_bo
JOIN business_regulator BR1
ON 
t1.business_name = BR1.business_name
JOIN business_regulator BR2
ON 
t1.business_reg_no_la = BR2.business_reg_no 
JOIN business_regulator BR3
ON 
t1.annual_turnover = BR3.annual_turnover; 

SELECT * FROM vw_application_employee_check
ORDER BY business_reg_no;