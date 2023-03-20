CREATE DATABASE business_bank;
USE business_bank;

-- Create tables with Primary Keys 

-- Table 1 - Loan_Applications 
CREATE TABLE loan_applications (
   application_id INTEGER NOT NULL,
   first_name VARCHAR(55) NOT NULL,
   last_name VARCHAR(55) NOT NULL,
   gender VARCHAR(55), 
   business_name VARCHAR(55) NOT NULL,
   business_reg_no_la CHAR(3) NOT NULL, 
   business_account_no_la CHAR(8) NOT NULL, 
   annual_turnover DECIMAL(8,2) NOT NULL, 
   loan_amount_requested DECIMAL(8,2) NOT NULL, 
   contact_email_address VARCHAR(55) NOT NULL, 
   terms_and_conditions_accepted BOOLEAN NOT NULL,
   CONSTRAINT pk_loan_applications PRIMARY KEY (application_id)
);

-- Table 2 - Business_Accounts 
CREATE TABLE business_accounts (
    account_number CHAR(8) NOT NULL,
    sort_code CHAR(6) NOT NULL,
    business_reg_no_ba CHAR(3) NOT NULL,
    balance DECIMAL(15 , 2 ),
    set_up_conditions_met BOOLEAN,
    CONSTRAINT pk_business_accounts PRIMARY KEY (account_number)
);

-- Table 3 Business_Owners 
CREATE TABLE business_owners (
    owner_id INTEGER NOT NULL,
    first_name VARCHAR(55) NOT NULL,
    last_name VARCHAR(55) NOT NULL,
    gender VARCHAR(55),
    account_number_bo CHAR(8) NOT NULL,
    email_address VARCHAR(55),
    main_contact BOOLEAN,
    CONSTRAINT pk_business_owners PRIMARY KEY (owner_id)
);

-- Table 4 - Business_Regulator 
CREATE TABLE business_regulator (
    business_reg_no CHAR(3) NOT NULL,
    business_name VARCHAR(55) NOT NULL UNIQUE,
    industry VARCHAR(55) NOT NULL,
    annual_turnover DECIMAL(15 , 2 ),
    total_no_of_owners INTEGER NOT NULL,
    CONSTRAINT pk_business_regulator PRIMARY KEY (business_reg_no)
);

-- Table 5 - Bank_Employees 
CREATE TABLE bank_employees (
    employee_id INTEGER NOT NULL,
    first_name VARCHAR(55) NOT NULL,
    last_name VARCHAR(55) NOT NULL,
    job_title VARCHAR(55) NOT NULL,
    gender VARCHAR(55),
    salary DECIMAL(8 , 2 ) NOT NULL,
    manager_id INTEGER,
    CONSTRAINT pk_bank_employees PRIMARY KEY (employee_id)
);

-- Table 6 - Loan_Application_Employee_Check
CREATE TABLE loan_application_employee_check (
    employee_check_id INTEGER NOT NULL,
    employee_id_ec INTEGER NOT NULL,
    application_id_ec INTEGER NOT NULL UNIQUE,
    owner_check BOOLEAN,
    turnover_check BOOLEAN,
    trustworthiness_check BOOLEAN,
    CONSTRAINT pk_loan_application_employee_check PRIMARY KEY (employee_check_id)
);

-- Insert data into tables 

INSERT INTO business_regulator
(business_reg_no, business_name, industry, annual_turnover, total_no_of_owners) 
VALUES 
(000, 'bake cafe', 'hospitality', 5000, 2),
(111, 'cake cafe', 'hospitality', 5000, 2),
(222, 'coffee cafe', 'hospitality', 5000, 2),
(333, 'tea cafe', 'hospitality', 5000, 2),
(444, 'business accountant', 'financial services', 30000, 1),
(555, 'building builders',	'construction', 10000, 2),
(666, 'clothes shop', 'retail', 8000, 2),
(777, 'taxi driver', 'transport', 3000, 1),
(888, 'estate agent', 'real estate', 50000, 4),
(999, 'tech development', 'technology', 75000, 3)
;

INSERT INTO business_owners 
(owner_id, first_name, last_name, gender, account_number_bo, email_address, main_contact) 
VALUES 
(1, 'james', 'rodriguez', 'male', 111000, 'james@bakecafe.com',	1),
(2,	'david', 'smith', 'male', 111000, 'david@bakecafe.com',	0),
(3,	'maria', 'johnson', 'female', 111111, 'maria@cakecafe.com', 1),
(4,	'eliza', 'miller', 'female', 111111, 'eliza@cakecafe.com', 0),
(5,	'connor', 'moriner', 'male', 111222, 'conor@coffeecafe.com', 1),
(6,	'sally', 'andov', 'female',	111222,	'sally@coffeecafe.com',	0),
(7,	'jacob', 'jones', 'male', 111333, 'jacob@teacafe.com', 0),
(8,	'daria', 'santos', 'female', 111333, 'daria@teacafe.com', 1),
(9,	'amelia', 'hasani', 'female', 111444, 'amelia@businessaccountant.com', 1),
(10,'amar',	'martin', 'male', 111555, 'amar@buildingbuilders.com', 1),
(11, 'anna', 'keller', 'female', 111555, 'anna@buildingbuilders.com', 0),
(12, 'arthur', 'davies', 'male', 111666, 'arthur@clothesshop.com', 1),
(13, 'olivia', 'patel', 'female', 111666, 'olivia@clothesshop.com',	0),
(14, 'mohamed',	'murphy', 'male', 111777, 'mohamed@taxidriver.com',	1),
(15, 'mia',	'moss',	'female', 111888, 'mia@estateagent.com', 1),
(16, 'omar', 'edwards',	'male', 111888,	'omar@estateagent.com',	0),
(17, 'peter', 'petek',	'male', 111888,	'peter@estateagent.com', 0),
(18, 'emma', 'lopes', 'female', 111888,	'emma@estateagent.com',	0),
(19, 'chloe', 'mazur',	'female', 111999, 'chloe@techdevelopment.com', 1),
(20, 'grace', 'eriksen', 'female',	111999,	'grace@techdevelopment.com', 0),
(21, 'george',	'markov', 'male', 111999, 'george@techdevelopment.com',	0)
;

INSERT INTO business_accounts
(account_number, sort_code, business_reg_no_ba, balance, set_up_conditions_met)
VALUES 
(111000, 999999, 000, 300.00, 1),
(111111, 999999, 111, 300.00, 1),
(111222, 999999, 222, 300.00, 1),
(111333, 999999, 333, 300.00, 1),
(111444, 999999, 444, 2000.00, 1),
(111555, 999999, 555, 1000.00, 1),
(111666, 999999, 666, 1500.00, 1), 
(111777, 999999, 777, 200.00, 1),
(111888, 999999, 888, 400.00, 1),
(111999, 999999, 999, 3000.00, 1)
;

INSERT INTO bank_employees
(employee_id, first_name, last_name, job_title, gender, salary, manager_id)
VALUES 
(0, 'oliver', 'chen ', 'ceo', 'male', 100000.00, 0), 
(1, 'george', 'smith',  'senior staff manager', 'male', 75000.00, 0), 
(2, 'muhamed', 'jones',  'senior staff', 'male', 50000.00, 1),
(3, 'maryam ', 'cheng',  'senior staff', 'female', 40000.00, 1),
(4, 'jake', 'perez',  'staff manager', 'male', 45000.00, 1),
(5, 'ralph ', 'sanches',  'staff', 'male', 40000.00, 4),
(6, 'rowan', 'jin',  'staff', 'male', 40000.00, 4), 
(7, 'ibrahim', 'ferreira',  'junior staff manager', 'male', 35000.00, 4), 
(8, 'esme ', 'rayes',  'junior staff', 'female', 27000.00, 7), 
(9, 'lyla', 'abdul',  'junior staff', 'female', 27000.00, 7)
;

INSERT INTO loan_applications 
(application_id, first_name, last_name, gender, business_name, business_reg_no_la, business_account_no_la, annual_turnover, loan_amount_requested, contact_email_address, terms_and_conditions_accepted)
VALUES 
(0, 'james', 'rodriguez', 'male', 'bake cafe', 000, 111000, 5000.00, 10000.00, 'james@bakecafe.com', 1), 
(1, 'maria', 'johnson', 'female', 'cake cafe', 111, 111111, 5000.00, 10000.00, 'maria@cakecafe.com', 1), 
(2, 'connor', 'moriner', 'male', 'coffee cafe', 222, 111222, 5000.00, 10000.00, 'conor@coffeecafe.com', 1), 
(3, 'daria', 'santos', 'female', 'tea cafe', 333, 111333, 5000.00, 10000.00, 'daria@teacafe.com', 1)
; 

INSERT INTO loan_application_employee_check 
(employee_check_id, employee_id_ec, application_id_ec, owner_check, turnover_check, trustworthiness_check)
VALUES 
(0, 1, 0, 1, 1, 1), 
(1, 1, 1, 1, 1, 0), 
(2, 4, 2, 1, 1, 1), 
(3, 4, 3, 1, 1, 0);

-- Set foreign keys 

-- Loan_Applications 

ALTER TABLE loan_applications
ADD CONSTRAINT 
fk_business_reg_no_la
FOREIGN KEY(business_reg_no_la)
REFERENCES business_regulator (business_reg_no);

ALTER TABLE loan_applications
ADD CONSTRAINT 
fk_business_account_no_la
FOREIGN KEY(business_account_no_la)
REFERENCES business_accounts (account_number);

-- Business_Accounts 

ALTER TABLE business_accounts
ADD CONSTRAINT 
fk_business_reg_no_ba
FOREIGN KEY(business_reg_no_ba)
REFERENCES business_regulator (business_reg_no);

-- Businness_Owners 

ALTER TABLE business_owners
ADD CONSTRAINT 
fk_account_number_bo
FOREIGN KEY(account_number_bo)
REFERENCES business_accounts (account_number);

-- Loan_Application_Employee_Check 

ALTER TABLE loan_application_employee_check 
ADD CONSTRAINT 
fk_employee_id_ec
FOREIGN KEY(employee_id_ec)
REFERENCES bank_employees (employee_id);

ALTER TABLE loan_application_employee_check 
ADD CONSTRAINT 
fk_application_id_ec
FOREIGN KEY(application_id_ec)
REFERENCES loan_applications (application_id);












