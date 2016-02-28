DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles(
    rid bigint(20) not null auto_increment primary key,
    rname varchar(30) NOT NULL,
    rdesignation varchar(2) NOT NULL);
    
CREATE TABLE employees(
    eid bigint(20) not null auto_increment,
    username varchar(30) NOT NULL,
    fname varchar(30) NOT NULL,
    lname varchar(30) NOT NULL,
    rid bigint(20) NOT NULL,
    primary key(eid),
    foreign key(rid) references roles(rid));
    

CREATE TABLE projects(
    pid bigint(20) not null auto_increment,
    project_title varchar(200) NOT NULL,
    project_lead bigint(20) NOT NULL,
    projected_completion_date DATE DEFAULT NULL,
    budget decimal(9,2) DEFAULT NULL,
    primary key(pid),
    foreign key(project_lead) references employees(eid));