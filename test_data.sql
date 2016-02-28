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


INSERT INTO projects(project_title, project_lead) VALUES('hoverboard', (select eid from employees where fname = 'ethan' and lname = 'miller'));