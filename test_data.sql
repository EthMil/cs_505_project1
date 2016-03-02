INSERT INTO roles(rname, security_level) VALUES('Engineering', 'E');
INSERT INTO roles(rname, security_level) VALUES('General','G');
INSERT INTO roles(rname, security_level) VALUES('Leadership', 'L');
INSERT INTO roles(rname, security_level) VALUES('Finances', 'F');
INSERT INTO roles(rname, security_level) VALUES('Security Officer', 'S');
INSERT INTO roles(rname, security_level) VALUES('Human Resources', 'H');
INSERT INTO roles(rname, security_level) VALUES('Human Resources/Engineering', 'HE');
INSERT INTO roles(rname, security_level) VALUES('Human Resources/Finances', 'HF');
INSERT INTO roles(rname, security_level) VALUES('Finances/Engineering', 'FE');

INSERT INTO employees(username, fname, lname, security_level) VALUES('efmi222', 'ethan', 'miller', 'S');
INSERT INTO employees(username, fname, lname, security_level) VALUES('zac', 'Zachary', 'Miller', 'H');
INSERT INTO employees(username, fname, lname, security_level) VALUES('candy', 'candace', 'moberly', 'F');


INSERT INTO projects(project_title, project_lead) VALUES('hoverboard', (select eid from employees where fname = 'ethan' and lname = 'miller'));
INSERT INTO projects(project_title, project_lead) VALUES('lossless compression algorithm', (select eid from employees where fname = 'Zac' and lname = 'Miller'));
INSERT INTO projects(project_title, project_lead, budget) VALUES('death ray', (select eid from employees where username = 'candy'),99999999.99);


INSERT INTO pay_info(eid, salary_employee, pay_rate) VALUES ((select eid from employees where username = 'efmi222'), 1, 100000.00);


INSERT INTO schedule(eid, start_time, end_time) VALUES((select eid from employees where username = 'zac'), '2016-02-21 09:00:0000', '2016-02-21 17:00:000');
INSERT INTO schedule(eid, start_time, end_time) VALUES((select eid from employees where username = 'efmi222'), '2016-02-21 10:00:0000', '2016-02-21 17:00:000');