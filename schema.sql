-- DROP VIEW IF EXISTS 
DROP TABLE IF EXISTS log;
DROP TABLE IF EXISTS schedule;
DROP TABLE IF EXISTS pay_info;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles(
    rname varchar(30) NOT NULL,
    security_level varchar(2) NOT NULL PRIMARY KEY);
    
CREATE TABLE employees(
    eid bigint(20) not null auto_increment,
    username varchar(30) DEFAULT NULL,
    fname varchar(30) NOT NULL,
    lname varchar(30) NOT NULL,
    security_level varchar(2) NOT NULL,
    primary key(eid),
    foreign key(security_level) references roles(security_level)
    );
    

CREATE TABLE projects(
    pid bigint(20) not null auto_increment,
    project_title varchar(200) NOT NULL,
    project_lead bigint(20) DEFAULT NULL,
    projected_completion_date DATE DEFAULT NULL,
    budget decimal(9,2) DEFAULT NULL,
    primary key(pid),
    foreign key(project_lead) references employees(eid));
    
CREATE TABLE pay_info(
    eid bigint(20) not null,
    hourly_employee tinyint default 0,
    salary_employee tinyint default 0,
    pay_rate decimal(9,2) not null,
    primary key(eid),
    foreign key(eid) references employees(eid));
    
CREATE TABLE schedule(
    eid bigint(20) not null,
    start_time datetime,
    end_time datetime,
    primary key(eid),
    foreign key(eid) references employees(eid));
    
CREATE TABLE log(
    username varchar(30) NOT NULL,
    query varchar(600) NOT NULL,
    query_timestamp timestamp DEFAULT CURRENT_TIMESTAMP);
    
-- CREATE VI3