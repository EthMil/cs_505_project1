insert into general_info(daily_message) values('have a great day!');

INSERT INTO H.employees(username, fname, lname) VALUES('efmi222', 'ethan', 'miller');
INSERT INTO H.employees(username, fname, lname) VALUES('zac', 'Zachary', 'Miller');
INSERT INTO H.employees(username, fname, lname) VALUES('candy', 'candace', 'moberly');


INSERT INTO E.projects(project_title) VALUES('hoverboard');
INSERT INTO E.projects(project_title) VALUES('lossless compression algorithm');
INSERT INTO E.projects(project_title, budget) VALUES('death ray',99999999.99);


INSERT INTO H.schedule(eid, start_time, end_time) VALUES((select eid from H.employees where username = 'zac'), '2016-02-21 09:00:0000', '2016-02-21 17:00:000');
INSERT INTO H.schedule(eid, start_time, end_time) VALUES((select eid from H.employees where username = 'efmi222'), '2016-02-21 10:00:0000', '2016-02-21 17:00:000');


INSERT INTO F.pay_info(month_begin, month_end, income) VALUES('2016:02:01','2016:02:29',200000.00);
INSERT INTO F.pay_info(month_begin, month_end, income) VALUES('2016:03:01','2016:03:31',1209219.00);

INSERT INTO L.top_secret(project_name, project_info, budget) values('black hole generator', 'creates a black hole', 1000000000000.09);
