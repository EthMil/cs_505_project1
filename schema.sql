-- Flush all privileges for clean start
flush privileges;

DROP ROLE IF EXISTS E;
DROP ROLE IF EXISTS S;
DROP ROLE IF EXISTS H;
DROP ROLE IF EXISTS G;
DROP ROLE IF EXISTS L;
DROP ROLE IF EXISTS F;

DROP VIEW IF EXISTS L.general_info;
DROP VIEW IF EXISTS L.schedule;
DROP VIEW IF EXISTS L.pay_info;
DROP VIEW IF EXISTS L.projects;
DROP VIEW IF EXISTS L.employees;

DROP TABLE IF EXISTS G.general_info;
DROP TABLE IF EXISTS L.top_secret;
DROP TABLE IF EXISTS S.log;
DROP TABLE IF EXISTS H.schedule;
DROP TABLE IF EXISTS F.pay_info;
DROP TABLE IF EXISTS E.projects;
DROP TABLE IF EXISTS H.employees;

CREATE TABLE G.general_info(
       calendar_date timestamp default current_timestamp,
       daily_message varchar(30) default null);

    
CREATE TABLE H.employees(
       eid bigint(20) not null auto_increment,
       username varchar(30) DEFAULT NULL,
       fname varchar(30) NOT NULL,
       lname varchar(30) NOT NULL,
       primary key(eid)
       );


CREATE TABLE E.projects(
       pid bigint(20) not null auto_increment,
       project_title varchar(200) NOT NULL,
       project_lead varchar(30) DEFAULT NULL,
       projected_completion_date DATE DEFAULT NULL,
       budget decimal(9,2) DEFAULT NULL,
       primary key(pid));

       
CREATE TABLE F.pay_info(
       month_begin date not null,
       month_end date not null,
       income decimal(9,2) not null);


CREATE TABLE H.schedule(
       eid bigint(20) not null,
       start_time datetime,
       end_time datetime,
       primary key(eid),
       foreign key(eid) references H.employees(eid));


CREATE TABLE S.log(
       username varchar(30) NOT NULL,
       query varchar(600) NOT NULL,
       query_timestamp timestamp DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE L.top_secret(
       project_name varchar(500) NOT NULL,
       project_info varchar(30) NOT NULL,
       budget decimal(9,2) not null);


CREATE ROLE 'G';
GRANT SELECT, INSERT on G.* to G;
grant insert on S.* to G;

CREATE ROLE 'E';
GRANT G to E;
GRANT SELECT, INSERT on E.* to E;

CREATE ROLE 'F';
GRANT G TO F;
GRANT SELECT, INSERT on F.* to F;

CREATE ROLE 'H';
GRANT G TO H;
grant SELECT, INSERT on H.* to H;

CREATE ROLE 'L';
grant SELECT on L.* to L;
grant G to L;
GRANT F TO L;
GRANT H TO L;
GRANT E TO L;
grant insert on L.top_secret to L;

CREATE ROLE 'S';
grant H to S with admin option;
grant L to S with admin option;
grant F to S with admin option;
grant E to S with admin option;
grant G to S with admin option;
grant all on *.* to S with grant option;
