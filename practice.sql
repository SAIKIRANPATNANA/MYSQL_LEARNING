-- Active: 1700974372596@@127.0.0.1@3306@mayya
create DATABASE mayya;
-- Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.
drop table country;
create table if not exists countries(
    country_id int,
    country_name varchar(100),
    region_id int,
    primary key(country_id)
);
select * from countries;
DESCRIBE countries;
-- . Write a SQL statement to create a simple table countries inc
luding columns country_id,country_name and region_id which is already exists.
create table if not exists dup_countries(
    country_id int,
    country_name varchar(100),
    region_id int,
    primary key(country_id)
);
DESCRIBE dup_countries;
-- Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries.
create table if not exists dup_countries2 as select * from countries;
DESCRIBE dup_countries2;
-- Write a SQL statement to create a table countries set a constraint NULL.
create table if not exists dup_countries3(
    country_id int not null,
    country_name varchar(100) not null,
    region_id int not null,
    primary key(country_id)
);
DESCRIBE dup_countries3;
--  Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
CREATE table if not exists jobs(job_id int, job_title VARCHAR(50), min_salar int, max_salary int, check(max_salary<=25000));

insert into jobs values(1,'Data Scientist', 2500000, 5000000);
DESCRIBE jobs;
-- Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.
create table if not exists countries3(country_id int, country_name VARCHAR(20), region_id int, check(country_name in ('India','China','Italy')));
create table if not exists countries4(country_id int, country_name VARCHAR(20) check(country_name in ('India','China','Italy')), region_id int);
insert into countries4 VALUES (1, 'India', 1);
insert into countries4 VALUES (2, 'Italy', 2);
insert into countries4 VALUES (1, 'Pakistan', 1);

insert into countries3 VALUES (1, 'India', 1);
insert into countries3 VALUES (1, 'Pakistan', 1);
insert into countries3 VALUES (1, 'China', 2);

-- Write a SQL statement to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion
create table if not exists countries5(country_id int UNIQUE, country_name VARCHAR(20), region_id int);
insert into countries5 VALUES (1, 'India', 1);
insert into countries5 VALUES (1, 'Italy', 1);

create table if not exists countries6(country_id int PRIMARY key, country_name VARCHAR(20), region_id int);

insert into countries6 VALUES (1, 'India', 1);
insert into countries5 VALUES (1, 'Italy', 1);

-- Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE table if not exists jobs1(job_id int PRIMARY key, job_title VARCHAR(50) DEFAULT '________', min_salary int DEFAULT 8000, max_salary int default NULL);
-- Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.
create table if not exists countries(
    country_id int,
    country_name VARCHAR(20),
    region_id int,
    primary key(country_id)
);
--  Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto incremented value.
create table if not exists countries2(
    country_id int unique AUTO_INCREMENT,
    country_name VARCHAR(20),
    region_id int,
    primary key(country_id)
);
-- Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique.
create table if not exists countries3(
    country_id int unique AUTO_INCREMENT,
    country_name VARCHAR(20),
    region_id int,
    primary key(country_id,region_id)
);
DESCRIBE countries3;
-- Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.
CREATE table if not exists jobs1(job_id int, job_title VARCHAR(50), min_salar int, max_salary int, PRIMARY key(job_id));
create table if not exists job_history(
    employee_id int PRIMARY key,
    start_date date,
    end_date date,
    job_id int,
    department_id int,
    Foreign Key (job_id) REFERENCES jobs1(job_id) on delete set null
);
DESCRIBE jobs1;
DESCRIBE job_history;
-- Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.
create table if not exists departments(
    department_id int,
    department_name varchar(50),
    manager_id int,
    location_id int,
    primary key(department_id,manager_id)
);
create table if not exists employees(
    employee_id int,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(30),
    phone_number int,
    hire_date date,
    job_id int,
    salary int,
    commission int,
    manager_id int,
    department_id int,
    PRIMARY key(employee_id),
    Foreign Key (department_id,manager_id) REFERENCES departments(department_id,manager_id) on delete cascade
);

-- 16. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables.

-- "A foreign key constraint is not required merely to join two tables. For storage engines other than InnoDB, it is possible when defining a column to use a REFERENCES tbl_name(col_name) clause, which has no actual effect, and serves only as a memo or comment to you that the column which you are currently defining is intended to refer to a column in another table." - Reference dev.mysql.com

create DATABASE if not exists mayya;
use  mayya;
create table  if not exists departments(
    department_id decimal(4,0) PRIMARY key,
    department_name varchar(30),
    manager_id decimal(6,0),
    location_id decimal(4,0)
);
create table if not exists jobs(
    job_id varchar(10) primary key,
    job_title varchar(35),
    min_salary decimal(6,0),
    max_salary decimal(6,0)
);
create table if not exists employees(
    employee_id decimal(6,0) primary key,
    first_name varchar(20),
    last_name varchar(25),
    email varchar(25),
    phone_numbers varchar(20),
    hire_date date,
    job_id varchar(10),
    salary decimal(8,2),
    commission_pct decimal(2,2),
    manager_id decimal(6,0),
    department_id decimal(4,0),
    Foreign Key (job_id) REFERENCES jobs(job_id) on delete set null,
    Foreign Key (department_id) REFERENCES departments(department_id) on delete set null
);
describe employees;
-- Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON UPDATE CASCADE action allows you to perform cross-table update and ON DELETE RESTRICT action reject the deletion. The default action is ON DELETE RESTRICT.
-- Assume that the structure of the table jobs and InnoDB Engine have been used to create the table jobs.
CREATE TABLE IF NOT EXISTS jobs1 ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
)ENGINE=InnoDB;
describe jobs1;
create table if not exists employees(
    employee_id decimal(6,0) primary key,
    first_name varchar(20),
    last_name varchar(25),
    job_id varchar(10),
    salary decimal(8,2),
    Foreign Key (job_id) REFERENCES jobs1(job_id) on delete restrict
);
--  Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE CASCADE that lets you allow to delete records in the employees(child) table that refer to a record in the jobs(parent) table when the record in the parent table is deleted and the ON UPDATE RESTRICT actions reject any updates.

-- Assume that the structure of the table jobs and InnoDB Engine have been used to create the table jobs
CREATE TABLE IF NOT EXISTS jobs2 ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
);
create table if not exists employees(
    employee_id decimal(6,0) primary key,
    first_name varchar(20),
    last_name varchar(25),
    job_id varchar(10),
    salary decimal(8,2),
    Foreign Key (job_id) REFERENCES jobs2(job_id) on delete cascade on update RESTRICT
);

-- Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE SET NULL action will set the foreign key column values in the child table(employees) to NULL when the record in the parent table(jobs) is deleted, with a condition that the foreign key column in the child table must accept NULL values and the ON UPDATE SET NULL action resets the values in the rows in the child table(employees) to NULL values when the rows in the parent table(jobs) are updated.
CREATE TABLE IF NOT EXISTS jobs3 ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
);
create table if not exists employees(
    employee_id decimal(6,0) primary key,
    first_name varchar(20),
    last_name varchar(25),
    job_id varchar(10),
    salary decimal(8,2),
    Foreign Key (job_id) REFERENCES jobs3(job_id) on delete set null
);

--  Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE NO ACTION and the ON UPDATE NO ACTION actions will reject the deletion and any updates.
CREATE TABLE IF NOT EXISTS jobs4 ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
);
create table if not exists employees(
    employee_id decimal(6,0) primary key,
    first_name varchar(20),
    last_name varchar(25),
    job_id varchar(10),
    salary decimal(8,2),
    Foreign Key (job_id) REFERENCES jobs4(job_id) on delete no action on update no action
);
-- Write a SQL statement to insert a record with your own value into the table countries against each columns.
create table if not exists countries(
    country_id varchar (2),
    country_name VARCHAR(40),
    region_id decimal(10,0)
);

insert into countries values(2, 'India', 4859);
--  Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
create table if not exists countries(
    country_id varchar (2),
    country_name VARCHAR(40),
    region_id decimal(10,0)
);
insert into countries(country_id,country_name) values('3', 'Pakistan');
select * from countries;

-- 3. Write a SQL statement to create duplicate of countries table named country_new with all structure and data.
create table if not exists country_new as select * from countries;
-- Write a SQL statement to insert NULL values against region_id column for a row of countries table.
create table if not exists countries(
    country_id varchar (2),
    country_name VARCHAR(40),
    region_id decimal(10,0)
);
insert into countries values('10','India', NULL);
-- Write a SQL statement to insert 3 rows by a single insert statement.
create table if not exists countries1(
    country_id varchar (2),
    country_name VARCHAR(40),
    region_id decimal(10,0)
);
insert into countries1 values('10','India', 143),('11','Pakistan',341),('12','China',431);
-- Write a SQL statement insert rows from country_new table to countries table.
create table if not exists country_new2(
    country_id varchar (2),
    country_name VARCHAR(40),
    region_id decimal(10,0)
);
insert into country_new2 values('01', 'India',1001),('02','USA',1007),('03','UK',1003);
create table if not exists country3(
    country_id varchar (2),
    country_name VARCHAR(40),
    region_id decimal(10,0)
);
insert into country3 select * from country_new2;
select * from country3;
create table if not exists countries(
    country_id varchar (2),
    country_name VARCHAR(40),
    region_id decimal(10,0)
);
insert into countries values('01', 'India',1001),('02','USA',1007),('03','UK',1003);
select * from countries;
create table if not exists country_new1 as select * from countries;
select * from country_new1;
--  Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) , 
MIN_SALARY decimal(6,0) , 
MAX_SALARY decimal(6,0)
);
insert into jobs values('231','DATA SCIENTIST', 250000, 500000);
insert into jobs values('231','DATA SCIENTIST', 250000, 500000);

--  Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
create table if not exists countries1(
    country_id varchar (2),
    country_name VARCHAR(40),
    region_id decimal(10,0),
    PRIMARY KEY(country_id,region_id)
);
insert into countries1(country_id,country_name) values(29, 'India');
-- Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.
create table if not exists countries2(
    country_id int AUTO_INCREMENT,
    country_name VARCHAR(40),
    region_id decimal(10,0),
    PRIMARY KEY(country_id)
);
insert into countries2(country_name, region_id) VALUES('India',143);
insert into countries2(country_name, region_id) values('Pakistan', 341);
select * from countries2;
-- Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.
create table if not exists countries4(
    country_id int AUTO_INCREMENT,
    country_name VARCHAR(40) not null DEFAULT 'N/A',
    region_id decimal(10,0),
    PRIMARY KEY(country_id)
);
insert into countries4(region_id) values(143);
select * from countries4;
-- . Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.
CREATE TABLE IF NOT EXISTS jobs2 ( 
JOB_ID integer PRIMARY KEY, 
JOB_TITLE varchar(35) , 
MIN_SALARY decimal(6,0) , 
MAX_SALARY decimal(6,0)
);
create table if not exists job_history(
    job_id int PRIMARY key,
    employee_id int,
    department_id int,
    Foreign Key (job_id) REFERENCES jobs2(job_id)
);
select * from job_history;
describe job_history; 

--  Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.
CREATE table if not exists departments5(
    department_id int,
    department_name VARCHAR(50),
    manager_id int not null , 
    location_id int,
    primary key(department_id, manager_id)
);
create table if not exists employees4(
    employee_id int PRIMARY key,
    first_name VARCHAR(20),
    last_name varchar(20),
    job_id int,
    salary  decimal(6,0),
    manager_id int not null ,
    department_id int not null ,
    Foreign Key (department_id) REFERENCES departments5(department_id) on delete cascade,
    Foreign Key (manager_id) REFERENCES departments5(manager_id) on delete cascade
);

--  Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.
CREATE TABLE IF NOT EXISTS jobs3( 
job_id int PRIMARY KEY, 
job_title varchar(35), 
min_salary decimal(6,0) , 
max_salary decimal(6,0)
);
CREATE table if not exists departments6(
    department_id int not null,
    department_name VARCHAR(50),
    manager_id int not null , 
    location_id int not null,
    primary key(department_id)
);
create table if not exists employees5(
    employee_id int PRIMARY key,
    first_name VARCHAR(20),
    last_name varchar(20),
    job_id int,
    salary  decimal(6,0),
    manager_id int not null ,
    department_id int not null ,
    Foreign Key (department_id) REFERENCES departments6(department_id) on delete cascade,
    Foreign Key (job_id) REFERENCES jobs3gi(job_id) on delete cascade
);



