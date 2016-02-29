INSERT INTO roles(rname, rdesignation) VALUES('Engineering', 'E');
INSERT INTO roles(rname, rdesignation) VALUES('General','G');
INSERT INTO roles(rname, rdesignation) VALUES('Leadership', 'L');
INSERT INTO roles(rname, rdesignation) VALUES('Finances', 'F');
INSERT INTO roles(rname, rdesignation) VALUES('Security', 'S');
INSERT INTO roles(rname, rdesignation) VALUES('Human Resources', 'H');
INSERT INTO roles(rname, rdesignation) VALUES('Human Resources/Engineering', 'HE');
INSERT INTO roles(rname, rdesignation) VALUES('Human Resources/Finances', 'HF');
INSERT INTO roles(rname, rdesignation) VALUES('Finances/Engineering', 'FE');

INSERT INTO employees(username, fname, lname, rid) VALUES('efmi222', 'ethan', 'miller', 1);
INSERT INTO employees(username, fname, lname, rid) VALUES('Zac', 'Zachary', 'Miller', 6);
INSERT INTO employees(username, fname, lname, rid) VALUES('candy', 'candace', 'moberly', 3);


INSERT INTO projects(project_title, project_lead) VALUES('hoverboard', (select eid from employees where fname = 'ethan' and lname = 'miller'));
INSERT INTO projects(project_title, project_lead) VALUES('lossless compression algorithm', (select eid from employees where fname = 'Zac' and lname = 'Miller'));
INSERT INTO projects(project_title, project_lead, budget) VALUES('death ray', (select eid from employees where username = 'candy'),99999999.99);


INSERT INTO pay_info(eid, salary_employee, pay_rate) VALUES ((select eid from employees where username = 'efmi222'), 1, 100000.00);


INSERT INTO schedule(eid, start_time, end_time) VALUES((select eid from employees where username = 'Zac'), '2016-02-21 09:00:0000', '2016-02-21 17:00:000');