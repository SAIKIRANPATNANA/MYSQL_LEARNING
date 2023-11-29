-- Active: 1700974372596@@127.0.0.1@3306@mayya
-- show DATABASES;
-- creating database;
CREATE DATABASE if not exists mayya;
-- creating tables:
CREATE TABLE if not exists student (
    student_id INT  PRIMARY KEY,
    name VARCHAR(20),
    subject VARCHAR(20)
);
CREATE TABLE if not exists student (
    student_id INT,
    name VARCHAR(20),
    subject VARCHAR(20),
    PRIMARY KEY(student_id)
);
DESCRIBE student;
-- DROP TABLE student;
ALTER TABLE student ADD gpa DECIMAL(3,2);
ALTER TABLE student DROP gpa;
-- creating data:
INSERT INTO mayya.student VALUES(1,'Sai','CSE');
INSERT INTO mayya.student VALUES(2,'Jack', 'Biology');
INSERT INTO mayya.student VALUES(3,'Kate', 'Sociology');
INSERT INTO mayya.student(student_id,name) VALUES(4,'Claire');
INSERT INTO mayya.student VALUES(5,'Sai', 'CSE');


SELECT * FROM mayya.student ;
-- constraints:
DROP TABLE student;
-- SELECT * FROM mayya.student ;
CREATE TABLE if not exists student (
    student_id INT  PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    subject VARCHAR(20) UNIQUE
);
SELECT * FROM mayya.student ;
INSERT INTO mayya.student VALUES(1,'Sai','CSE');
INSERT INTO mayya.student VALUES(2,'Jack', 'Biology');
-- INSERT INTO mayya.student VALUES(3,NULL,'CSE');
-- INSERT INTO mayya.student VALUES(4,'Jack', 'Biology');
INSERT INTO mayya.student VALUES(5,'Ratna', 'ECE');
DROP TABLE student;
CREATE TABLE if not exists student (
    student_id INT  PRIMARY KEY,
    name VARCHAR(20),
    subject VARCHAR(20) DEFAULT 'Undecided'
);
SELECT * FROM mayya.student ;
INSERT INTO mayya.student VALUES(1,'Sai','CSE');
INSERT INTO mayya.student(student_id,name) VALUES(2,'Jack');
INSERT INTO mayya.student VALUES(3,'Kate','CSE');
DROP TABLE student;
CREATE TABLE if not exists student (
    student_id INT  AUTO_INCREMENT,
    name VARCHAR(20),
    subject VARCHAR(20),
    PRIMARY KEY(student_id)
);
SELECT * FROM mayya.student ;
INSERT INTO mayya.student(name,subject) VALUES('Sai','CSE');
INSERT INTO mayya.student(name,subject) VALUES('Jack','Biology');
INSERT INTO mayya.student(name,subject) VALUES('Kate','CSE');
-- updating and deleting:
DROP TABLE student;
CREATE TABLE if not exists student (
    student_id INT,
    name VARCHAR(20),
    subject VARCHAR(20),
    PRIMARY KEY(student_id)
);
SELECT * FROM mayya.student;

INSERT INTO mayya.student VALUES(1,'Sai','CSE');
INSERT INTO mayya.student VALUES(2,'Jack', 'Biology');
INSERT INTO mayya.student VALUES(3,'Kate', 'Sociology');
INSERT INTO mayya.student VALUES(4,'Claire','Psychology')

UPDATE student 
SET subject = 'Bio'
WHERE subject = 'Biology';
SELECT * FROM student;
UPDATE student 
SET subject = 'Psyche'
WHERE subject = 'Psychology';
SELECT * FROM student;
UPDATE student 
SET subject = 'Biopsyche'
WHERE subject = 'Psyche' OR subject = 'Bio';
UPDATE student
SET subject = 'Undecided' , name='pra'
where student_id = 1

update student 
set subject = 'undecided';
select * from student;
delete from student
where student_id = 1;

delete from student 
where name = 'Jack' and subject='undecided';

select * from student;
delete from student;
-- basic queries:
select * from student;
drop table student;
sts student (
    student_id INT  AUTO_INCREMENT,
    name VARCHAR(20),
    subject VARCHAR(20),
    PRIMARY KCREATE TABLE if not exists student (
    student_id INT  AUTO_INCREMENT,
    name VARCHAR(20),
    subject VARCHAR(20),
    PRIMARY KEY(student_id)
);
INSERT INTO mayya.student VALUES(1,'Sai','CSE');
INSERT INTO mayya.student VALUES(2,'Jack', 'Biology');
INSERT INTO mayya.student VALUES(3,'Kate', 'Sociology');
INSERT INTO mayya.student VALUES(4,'Claire','Psychology');
INSERT INTO mayya.student VALUES(5,'Ratna', 'Biology');

select * from student;
select name from student;
select student.name from student;

select student.name from student order by name;
select student.name from student order by name desc;
select * from student order by student_id;
select student.student_id,student.name from student order by student_id asc;
select student_id, name from student order by student_id asc;
select * from student order by student_id desc;
SELECT * from student;
select * from student order by subject,student_id;
select * from student order by subject,student_id DESC;
select * from student order by student_id desc limit 2;

select * from student where subject = 'Biology';
select * from student where name = 'sai' or subject = 'Biology';

-- we can also use <,>,<=,>=,<>,and,or;
select * from student where student_id < 3;
select * from student where student_id = 3;
select * from student where student_id > 3;
select * from student where name in ('Sai','Kate','Ratna');
select * from student WHERE subject in ('Biology', 'Psychology') and student_id>=3;
select * from student;
drop table student;

-- company database into;

CREATE TABLE if not exists employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE if not exists branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE if not exists client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
) ;

CREATE TABLE if not exists works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE if not exists branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- StamfordALTER TABLE student ADD gpa DECIMAL(3,2);
-- ALTER TABLE student DROP gpa;
-- -- creating data:
-- INSERT INTO mayya.student VALUES(1,'Sai','CSE');
-- INSERT INTO mayya.student VALUES(2,'Jack', 'Biology');
-- INSERT INTO mayya.student VALUES(3,'Kate', 'Sociology');
-- INSERT INTO mayya.student(student_id,name) VALUES(4,'Claire');
-- INSERT INTO mayya.student VALUES(5,'Sai', 'CSE');


-- SELECT * FROM mayya.student ;
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

select * from employee;
select * from client;
SELECT * from branch;
SELECT * from branch_supplier;
select * from employee;
select * from works_with;

-- more basic queries;
select * from employee;
SELECT * from branch;
select * from client;
select * from employee order by salary asc;
select * from employee order by salary DESC;
SELECT * from employee order by sex, first_name, last_name;
select* from employee limit 5;
select first_name,last_name from employee;
select first_name as forename, last_name as surname from employee;
select distinct sex from employee;
select DISTINCT branch_id from employee;
-- functions:
select COUNT(emp_id) from employee;
select count(super_id) from employee;
select COUNT(emp_id) from employee where birth_day>('1970-12-31') and sex='F';
select avg(salary) from employee;
select sum(salary) from employee;
select count(emp_id) from employee where sex = 'M';
select count(emp_id) from employee where sex = 'F';
select count(emp_id), sex from employee group by sex;
select emp_id,sum(total_sales) from works_with group by emp_id ;
select client_id,sum(total_sales) from works_with group by client_id ;
-- wildcards:
-- % ==> any number of characters and _ ==> for single character;
select * from client where client_name like '%LLC'; 
select * from branch_supplier;
select * from branch_supplier where supplier_name like '%lab%';
select * from employee; 
select * from employee where birth_day like '____-10-__';
select * from employee where birth_day like '_____10%';
select * from client;  
select * from client where client_name like '%school%';
-- Unions queries:
select  first_name as list from employee union select branch_name from branch;
select client_name as list from client union select supplier_name from branch_supplier; 
select salary as money from employee union select total_sales from works_with; 
-- Joins:
insert into branch values(4,'Buffalo',null,null);
select * from branch;
select employee.emp_id, employee.first_name, branch.branch_name from employee join branch on employee.emp_id = branch.mgr_id; 
select employee.emp_id, employee.first_name, branch.branch_name from employee left join branch on employee.emp_id = branch.mgr_id order by branch.branch_name desc; 
select employee.emp_id, employee.first_name, branch.branch_name from employee right join branch on employee.emp_id = branch.mgr_id; 
-- select employee.emp_id, employee.first_name, branch.branch_name from employee full join branch on employee.emp_id = branch.mgr_id; 
-- Nested Queries:
select * from employee;
select * from works_with;
select  client_id,sum(total_sales)  from works_with group by client_id;
select first_name,last_name from employee where emp_id in (select distinct emp_id from works_with where total_sales >=30000);
select *  from branch;
select * from client;
select client_name from client where branch_id in (select branch_id from branch where mgr_id in (select emp_id from employee where first_name like 'Michael' )); 

-- on delete;j
-- delete from employee WHERE emp_id = 102;
-- select * from employee;
-- select * from works_with;
-- delete from employee WHERE emp_id = 105;
-- select * from works_with;

-- Triggers:
-- DELIMITER $$
-- create 
--       trigger my_trigger1 before insert on employee
--       for each row begin 
--             insert into trigger_test values('added new row');
-- End $$
-- DELIMITER ;
-- delimiter $$
-- create trigger my_trigger2 before insert on employee for each row begin 
-- insert into trigger_test values('new.first_name');
-- end $$ 
-- DELIMITER ;
-- delimiter $$
-- create trigger my_trigger3 before insert on employee for each row begin 
-- if new.sex = 'M' then 
--     insert into trigger_test values('added male');
-- elseif new.sex = 'F' THEN
--     insert into trigger_test values('added female');
-- else 
--     insert into trigger_test values('added someother employee');
-- end if;
-- end $$ 
-- DELIMITER ;
--after <-> before;
-- insert / delete/ update;

