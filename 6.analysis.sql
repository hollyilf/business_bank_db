USE BUSINESS_BANK;

-- what is the gender of the boss of the bank? 

SELECT gender
FROM bank_employees
WHERE manager_id = employee_id;

-- what is the gender of the employees who perform the checks on new loan appplications? 

SELECT b.gender 
FROM bank_employees b 
WHERE b.employee_id
IN 
(SELECT employee_id_ec
FROM loan_application_employee_check);

-- How many male business owners are registered with the bank? 

SELECT gender, COUNT(gender) 
FROM business_owners 
GROUP BY gender
HAVING gender = 'male';

-- How many women business owners are registered with the bank? 

SELECT gender, COUNT(gender) 
FROM business_owners 
GROUP BY gender
HAVING gender = 'female';

-- Find all loan applications, the gender of the employee who checked it, the gender of the applicant, and whether it passed the trustworthiness check: 
SELECT  
t2.employee_check_id as check_id,
t2. trustworthiness_check, 
t1.gender as employee_gender, 
t4.gender as applicant_gender, 
t5.total_no_of_owners,
t3.loan_amount_requested,
t5.annual_turnover
FROM bank_employees t1
INNER JOIN loan_application_employee_check t2 
ON t1.employee_id = t2.employee_id_ec
INNER JOIN loan_applications t3
ON t3.application_id = t2.application_id_ec
INNER JOIN business_owners t4
ON t4.first_name = t3.first_name AND t4.last_name = t3.last_name AND t3.contact_email_address = t4.email_address 
INNER JOIN business_regulator t5
ON t5.business_reg_no = t3.business_reg_no_la;


