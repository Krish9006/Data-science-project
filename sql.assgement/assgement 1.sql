create database Salesdb;
use salesdb;
create table productlines(
productLine VARCHAR(50) PRIMARY KEY,
textDescription VARCHAR(4000),
htmlDescription MEDIUMTEXT,
image MEDIUMBLOB
);

create table products(
productCode VARCHAR(15) PRIMARY KEY,
productName VARCHAR(70) NOT NULL,
productLine VARCHAR(50), constraint fk_product FOREIGN KEY (productLine) REFERENCES productlines(productLine),
productScale VARCHAR(10) NOT NULL,
productVendor VARCHAR(50) NOT NULL,
productDescription TEXT NOT NULL,
quantityInStock SMALLINT NOT NULL,
buyPrice DECIMAL(10, 2) NOT NULL,
MSRP DECIMAL(10, 2) NOT NULL
);


create table orderdetails
(
	orderNumber INT , 
	productCode VARCHAR(15) , constraint fdgh foreign key (productCode) references products(productCode),
    quantityOrdered INT NOT NULL,
    priceEach DECIMAL(10, 2) NOT NULL,
    orderLineNumber SMALLINT NOT NULL,
    primary key(orderNumber,productCode)
);


CREATE TABLE employees (
    employeeNumber INT PRIMARY KEY,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    extension VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    officeCode VARCHAR(10), 
    reportsTo INT,
    jobTitle VARCHAR(50) NOT NULL,
    CONSTRAINT fk_emp FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber),
    constraint fk_office foreign  key (officeCode) references  offices(officeCode)
    
);

create table offices(
	officeCode VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressLine1 VARCHAR(50) NOT NULL,
    addressLine2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    postalCode VARCHAR(15) NOT NULL,
	territory VARCHAR(10) NOT NULL
);


create table customer
( 
customerNumber INT PRIMARY KEY,
customerName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
postalCode VARCHAR(15),
country VARCHAR(50) NOT NULL,
salesRepEmployeeNumber INT,
creditLimit DECIMAL(10, 2)
);

create table orderdetails(
orderNumber int,
productCode VARCHAR(15),
quantityOrdered INT NOT NULL,
priceEach DECIMAL(10, 2) NOT NULL,
orderLineNumber SMALLINT NOT NULL
);

create table payments
(
customerNumber INT, constraint fk_order2 FOREIGN KEY (customerNumber) REFERENCES customer(customerNumber),
checkNumber VARCHAR(50) PRIMARY KEY,
paymentDate DATE NOT NULL,
amount DECIMAL(10, 2) NOT NULL

);


create table orders( 
orderNumber INT PRIMARY KEY, constraint fk_order FOREIGN KEY (orderNumber) REFERENCES orderdetails(orderNumber),
orderDate DATE NOT NULL,
requiredDate DATE NOT NULL,
shippedDate DATE,
status VARCHAR(15) NOT NULL,
comments TEXT,
customerNumber INT, constraint fk_order1 FOREIGN KEY (customerNumber) REFERENCES customer(customerNumber)
);

