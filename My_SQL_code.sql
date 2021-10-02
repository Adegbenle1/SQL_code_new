CREATE TABLE sales(
purchase_number INT NOT NULL PRIMARY KEY auto_increment,
date_of_purchase DATE NOT NULL,
customer_id INT,
item_code VARCHAR(10) NOT NULL
);
CREATE TABLE Customers(
customer_id INT,
First_name VARCHAR(255) NOT NULL,
Last_name VARCHAR(255) NOT NULL,
Email_address VARCHAR(255),
Number_of_complaints INT
);
SELECT * FROM Customers;
SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Sales;
SELECT * FROM Sales;
DROP TABLE Sales;

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
	date_of_purchase DATE,
	customer_id INT,
	item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);
DROP TABLE Customers;
CREATE TABLE Customers
(
	customer_id INT,
    first_name VARCHAR(125),
    last_name VARCHAR(125),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY(customer_id)
    );
DROP TABLE items;

CREATE TABLE items
(
	item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR(255),
    company_name VARCHAR(255),
    PRIMARY KEY(item_code)
    );
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquaters_phone_numer INT(12),
    PRIMARY KEY(company_id)
);
DROP TABLE sales;
  CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
	date_of_purchase DATE,
	customer_id INT,
	item_code VARCHAR(10),
PRIMARY KEY (purchase_number),
FOREIGN KEY (Customer_id) REFERENCES customers(Customer_id)
);
DROP TABLE sales;

  CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
	date_of_purchase DATE,
	customer_id INT,
	item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);
ALTER TABLE Sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;
DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;
CREATE TABLE Customers
(
	customer_id INT,
    first_name VARCHAR(125),
    last_name VARCHAR(125),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY(customer_id),
    UNIQUE KEY (email_address)
    );
    DROP TABLE customers;
    CREATE TABLE Customers
(
	customer_id INT,
    first_name VARCHAR(125),
    last_name VARCHAR(125),
    email_address VARCHAR(255),
    gender CHAR(1),
    number_of_complaints INT
    );
    ALTER TABLE customers
    ADD UNIQUE KEY(email_address);
    ALTER TABLE customers
    DROP INDEX email_address;
    ALTER TABLE customers
    CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO Customers (first_name, last_name, gender)
VALUES ('Peter', 'Figarro', 'M')
;
SELECT * FROM customers;
INSERT INTO Customers (first_name, last_name, email_address, gender)
VALUES ('neyo', 'ade', 'adegbenleade@gmail.com' 'M');
ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(16),
    PRIMARY KEY(company_id)
);
ALTER TABLE companies
MODIFY column company_name VARCHAR(255) NULL;
ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;
INSERT INTO companies (headquarters_phone_number, comapny_name)
VALUES ('+01789798348', 'COMPANY A')
;
DROP TABLE companies;
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY(company_id)
);
ALTER TABLE companies
MODIFY column company_name VARCHAR(255) NULL;
ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;
INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+01789798348', 'company A')
;
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY(company_id)
);
INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+01789798348', 'company A')
DROP TABLE companies;
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY(company_id)
);
INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+01789798348', 'company A')
;
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(16),
    PRIMARY KEY(company_id)
);
ALTER TABLE companies
MODIFY column company_name VARCHAR(255) NULL;
ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;
INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+01789798348', 'COMPANY A')
;
DROP Table companies;
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(16),
    PRIMARY KEY(company_id)
);
ALTER TABLE companies
MODIFY column company_name VARCHAR(255) NULL;
ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;
INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+01789798348', 'COMPANY A')
;
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(16),
    PRIMARY KEY(company_id)
); 
DROP TABLE companies;  
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(16),
    PRIMARY KEY(company_id)
); 
DROP TABLE companies;
CREATE TABLE companies
(
	company_id INT(255) AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(16),
PRIMARY KEY(company_id)
); 
ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;
INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+01789798348', 'COMPANY A')
;
DROP TABLE companies;
CREATE TABLE companies
(
	company_id INT(255) AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(16),
PRIMARY KEY(company_id)
); 
ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;
INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+01789798348', 'COMPANY A')
;

    
    








