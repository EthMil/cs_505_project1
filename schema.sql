DROP ROLE IF EXISTS E;
DROP ROLE IF EXISTS S;
DROP ROLE IF EXISTS H;
DROP ROLE IF EXISTS G;
DROP ROLE IF EXISTS L;
DROP ROLE IF EXISTS F;

DROP TABLE IF EXISTS top_secret;
DROP TABLE IF EXISTS log;
DROP TABLE IF EXISTS schedule;
DROP TABLE IF EXISTS pay_info;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS roles;

    
CREATE TABLE employees(
       eid bigint(20) not null auto_increment,
       username varchar(30) DEFAULT NULL,
       fname varchar(30) NOT NULL,
       lname varchar(30) NOT NULL,
       primary key(eid)
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

CREATE TABLE top_secret(
       project_name varchar(500) NOT NULL,
       project_info varchar(30) NOT NULL,
       budget decimal(9,2) not null);


CREATE ROLE 'E';
GRANT SELECT on efmi222.projects to E;
grant insert on efmi222.projects to E;

CREATE ROLE 'F';
GRANT select on efmi222.pay_info to F;
GRANT INSERT on efmi222.pay_info to F;

CREATE ROLE 'H';
grant select on efmi222.schedule to H;
grant insert on efmi222.schedule to H;

CREATE ROLE 'L';
grant select on efmi222.* to L;
grant insert on efmi222.top_secret to L;
       
CREATE ROLE 'S';
GRANT CREATE USER on *.* to S;
GRANT SELECT on efmi222.log to S;
GRANT E to S with admin option;
GRANT F to S with admin option;
GRANT H to S with admin option;
GRANT L to S with admin option;
