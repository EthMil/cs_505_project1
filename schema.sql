CREATE TABLE roles(
    rname varchar(25) NOT NULL,
    rdesignation varchar(2) NOT NULL,
    PRIMARY KEY(rdesignation));
    
CREATE TABLE employees(
    username varchar(25) NOT NULL,
    fname varchar(25) NOT NULL,
    lname varchar(25) NOT NULL,
    rdesignation varchar(2) NOT NULL,
    password varchar(25) NOT NULL,
    salary  numeric(15,2) NOT NULL,
    PRIMARY KEY(username),
    FOREIGN KEY(rdesignation) REFERENCES roles(rdesignation));