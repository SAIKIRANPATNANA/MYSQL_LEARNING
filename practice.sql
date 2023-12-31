-- Active: 1700974372596@@127.0.0.1@3306
-- creating tables:
create DATABASE mayya;
use mayya;
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
-- Inserting data:
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
-- updating tables:

DROP TABLE IF EXISTS regions;
CREATE TABLE regions (
 REGION_ID decimal(5,0) NOT NULL PRIMARY KEY,
  REGION_NAME varchar(25) DEFAULT NULL
);


DROP TABLE IF EXISTS countries;
CREATE TABLE countries     (
  COUNTRY_ID varchar(2) NOT NULL,
  COUNTRY_NAME varchar(40) DEFAULT NULL,
  REGION_ID decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (COUNTRY_ID),
  KEY COUNTR_REG_FK (REGION_ID)
) ;


DROP TABLE IF EXISTS locations;
CREATE TABLE locations (
  LOCATION_ID decimal(4,0) NOT NULL DEFAULT 0,
  STREET_ADDRESS varchar(40) DEFAULT NULL,
  POSTAL_CODE varchar(12) DEFAULT NULL,
  CITY varchar(30) NOT NULL,
  STATE_PROVINCE varchar(25) DEFAULT NULL,
  COUNTRY_ID varchar(2) DEFAULT NULL,
  PRIMARY KEY (LOCATION_ID),
  KEY LOC_CITY_IX (CITY),
  KEY LOC_COUNTRY_IX (COUNTRY_ID),
  KEY LOC_STATE_PROVINCE_IX (STATE_PROVINCE)
);


DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs (
  JOB_ID varchar(10) NOT NULL DEFAULT '',
  JOB_TITLE varchar(35) NOT NULL,
  MIN_SALARY decimal(6,0) DEFAULT NULL,
  MAX_SALARY decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (JOB_ID)
) ;


DROP TABLE IF EXISTS job_history;
CREATE TABLE job_history (
  EMPLOYEE_ID decimal(6,0) NOT NULL,
  START_DATE date NOT NULL,
  END_DATE date NOT NULL,
  JOB_ID varchar(10) NOT NULL,
  DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (EMPLOYEE_ID,START_DATE),
  KEY JHIST_DEPARTMENT_IX (DEPARTMENT_ID),
  KEY JHIST_EMPLOYEE_IX (EMPLOYEE_ID),
  KEY JHIST_JOB_IX (JOB_ID)
);


DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
  DEPARTMENT_ID decimal(4,0) NOT NULL DEFAULT '0',
  DEPARTMENT_NAME varchar(30) NOT NULL,
  MANAGER_ID decimal(6,0) DEFAULT NULL,
  LOCATION_ID decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (DEPARTMENT_ID),
  KEY DEPT_MGR_FK (MANAGER_ID),
  KEY DEPT_LOCATION_IX (LOCATION_ID)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
 EMPLOYEE_ID decimal(6,0) NOT NULL DEFAULT '0',
 FIRST_NAME varchar(20) DEFAULT NULL,
 LAST_NAME varchar(25) NOT NULL,
 EMAIL varchar(25) NOT NULL,
 PHONE_NUMBER varchar(20) DEFAULT NULL,
 HIRE_DATE date NOT NULL,
 JOB_ID varchar(10) NOT NULL,
 SALARY decimal(8,2) DEFAULT NULL,
 COMMISSION_PCT decimal(2,2) DEFAULT NULL,
 MANAGER_ID decimal(6,0) DEFAULT NULL,
 DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
 PRIMARY KEY (EMPLOYEE_ID),
 KEY EMP_DEPARTMENT_IX (DEPARTMENT_ID),
 KEY EMP_JOB_IX (JOB_ID),
 KEY EMP_MANAGER_IX (MANAGER_ID),
 KEY EMP_NAME_IX (LAST_NAME,FIRST_NAME)
);


INSERT INTO regions VALUES (1,'Europe\r'),(2,'Americas\r'),(3,'Asia\r'),(4,'Middle East and Africa\r');

INSERT INTO countries VALUES ('AR','Argentina',2),
('AU','Australia',3),
('BE','Belgium',1),
('BR','Brazil',2),
('CA','Canada',2),
('CH','Switzerland',1),
('CN','China',3),
('DE','Germany',1),
('DK','Denmark',1),
('EG','Egypt',4),
('FR','France',1),
('HK','HongKong',3),
('IL','Israel',4),
('IN','India',3),
('IT','Italy',1),
('JP','Japan',3),
('KW','Kuwait',4),
('MX','Mexico',2),
('NG','Nigeria',4),
('NL','Netherlands',1),
('SG','Singapore',3),
('UK','United Kingdom',1),
('US','United States of America',2),
('ZM','Zambia',4),('ZW','Zimbabwe',4);


INSERT INTO locations VALUES (1000,'1297 Via Cola di Rie','989','Roma','','IT'),
(1100,'93091 Calle della Testa','10934','Venice','','IT'),
(1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP'),
(1300,'9450 Kamiya-cho','6823','Hiroshima','','JP'),
(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),
(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),
(1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US'),
(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),
(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),
(1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),
(2000,'40-5-12 Laogianggen','190518','Beijing','','CN'),
(2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN'),
(2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU'),
(2300,'198 Clementi North','540198','Singapore','','SG'),
(2400,'8204 Arthur St','','London','','UK'),
(2500,'Magdalen Centre',' The Oxford ','OX9 9ZB','Oxford','Ox'),
(2600,'9702 Chester Road','9629850293','Stretford','Manchester','UK'),
(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'),
(2800,'Rua Frei Caneca 1360','01307-002','Sao Paulo','Sao Paulo','BR'),
(2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH'),
(3000,'Murtenstrasse 921','3095','Bern','BE','CH'),
(3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL'),
(3200,'Mariano Escobedo 9991','11932','Mexico City','\"Distrito Federal','\"');

INSERT INTO jobs VALUES ('AD_PRES','President',20000,40000),
('AD_VP','Administration Vice President',15000,30000),
('AD_ASST','Administration Assistant',3000,6000),
('FI_MGR','Finance Manager',8200,16000),
('FI_ACCOUNT','Accountant',4200,9000),
('AC_MGR','Accounting Manager',8200,16000),
('AC_ACCOUNT','Public Accountant',4200,9000),
('SA_MAN','Sales Manager',10000,20000),
('SA_REP','Sales Representative',6000,12000),
('PU_MAN','Purchasing Manager',8000,15000),
('PU_CLERK','Purchasing Clerk',2500,5500),
('ST_MAN','Stock Manager',5500,8500),
('ST_CLERK','Stock Clerk',2000,5000),
('SH_CLERK','Shipping Clerk',2500,5500),
('IT_PROG','Programmer',4000,10000),
('MK_MAN','Marketing Manager',9000,15000),
('MK_REP','Marketing Representative',4000,9000),
('HR_REP','Human Resources Representative',4000,9000),
('PR_REP','Public Relations Representative',4500,10500);

INSERT INTO job_history VALUES (102,'1993-01-13','1998-07-24','IT_PROG',60),
(101,'1989-09-21','1993-10-27','AC_ACCOUNT',110),
(101,'1993-10-28','1997-03-15','AC_MGR',110),
(201,'1996-02-17','1999-12-19','MK_REP',20),
(114,'1998-03-24','1999-12-31','ST_CLERK',50),
(122,'1999-01-01','1999-12-31','ST_CLERK',50),
(200,'1987-09-17','1993-06-17','AD_ASST',90),
(176,'1998-03-24','1998-12-31','SA_REP',80),
(176,'1999-01-01','1999-12-31','SA_MAN',80),
(200,'1994-07-01','1998-12-31','AC_ACCOUNT',90),
(0,'0000-00-00','0000-00-00','',0);

INSERT INTO departments VALUES (10,'Administration',200,1700),
(20,'Marketing',201,1800),(30,'Purchasing',114,1700),
(40,'Human Resources',203,2400),(50,'Shipping',121,1500),
(60,'IT',103,1400),(70,'Public Relations',204,2700),
(80,'Sales',145,2500),(90,'Executive',100,1700),
(100,'Finance',108,1700),(110,'Accounting',205,1700),
(120,'Treasury',0,1700),(130,'Corporate Tax',0,1700),
(140,'Control And Credit',0,1700),(150,'Shareholder Services',0,1700),
(160,'Benefits',0,1700),(170,'Manufacturing',0,1700),
(180,'Construction',0,1700),(190,'Contracting',0,1700),
(200,'Operations',0,1700),(210,'IT Support',0,1700),
(220,'NOC',0,1700),(230,'IT Helpdesk',0,1700),
(240,'Government Sales',0,1700),(250,'Retail Sales',0,1700),
(260,'Recruiting',0,1700),(270,'Payroll',0,1700);

INSERT INTO employees VALUES (100,'Steven','King','SKING','515.123.4567','1987-06-17','AD_PRES',24000.00,0.00,0,90),
(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1987-06-18','AD_VP',17000.00,0.00,100,90),
(102,'Lex','De Haan','LDEHAAN','515.123.4569','1987-06-19','AD_VP',17000.00,0.00,100,90),
(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1987-06-20','IT_PROG',9000.00,0.00,102,60),
(104,'Bruce','Ernst','BERNST','590.423.4568','1987-06-21','IT_PROG',6000.00,0.00,103,60),
(105,'David','Austin','DAUSTIN','590.423.4569','1987-06-22','IT_PROG',4800.00,0.00,103,60),
(106,'Valli','Pataballa','VPATABAL','590.423.4560','1987-06-23','IT_PROG',4800.00,0.00,103,60),
(107,'Diana','Lorentz','DLORENTZ','590.423.5567','1987-06-24','IT_PROG',4200.00,0.00,103,60),
(108,'Nancy','Greenberg','NGREENBE','515.124.4569','1987-06-25','FI_MGR',12000.00,0.00,101,100),
(109,'Daniel','Faviet','DFAVIET','515.124.4169','1987-06-26','FI_ACCOUNT',9000.00,0.00,108,100),
(110,'John','Chen','JCHEN','515.124.4269','1987-06-27','FI_ACCOUNT',8200.00,0.00,108,100),
(111,'Ismael','Sciarra','ISCIARRA','515.124.4369','1987-06-28','FI_ACCOUNT',7700.00,0.00,108,100),
(112,'Jose Manuel','Urman','JMURMAN','515.124.4469','1987-06-29','FI_ACCOUNT',7800.00,0.00,108,100),
(113,'Luis','Popp','LPOPP','515.124.4567','1987-06-30','FI_ACCOUNT',6900.00,0.00,108,100),
(114,'Den','Raphaely','DRAPHEAL','515.127.4561','1987-07-01','PU_MAN',11000.00,0.00,100,30),
(115,'Alexander','Khoo','AKHOO','515.127.4562','1987-07-02','PU_CLERK',3100.00,0.00,114,30),
(116,'Shelli','Baida','SBAIDA','515.127.4563','1987-07-03','PU_CLERK',2900.00,0.00,114,30),
(117,'Sigal','Tobias','STOBIAS','515.127.4564','1987-07-04','PU_CLERK',2800.00,0.00,114,30),
(118,'Guy','Himuro','GHIMURO','515.127.4565','1987-07-05','PU_CLERK',2600.00,0.00,114,30),
(119,'Karen','Colmenares','KCOLMENA','515.127.4566','1987-07-06','PU_CLERK',2500.00,0.00,114,30),
(120,'Matthew','Weiss','MWEISS','650.123.1234','1987-07-07','ST_MAN',8000.00,0.00,100,50),
(121,'Adam','Fripp','AFRIPP','650.123.2234','1987-07-08','ST_MAN',8200.00,0.00,100,50),
(122,'Payam','Kaufling','PKAUFLIN','650.123.3234','1987-07-09','ST_MAN',7900.00,0.00,100,50),
(123,'Shanta','Vollman','SVOLLMAN','650.123.4234','1987-07-10','ST_MAN',6500.00,0.00,100,50),
(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','1987-07-11','ST_MAN',5800.00,0.00,100,50),
(125,'Julia','Nayer','JNAYER','650.124.1214','1987-07-12','ST_CLERK',3200.00,0.00,120,50),
(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','1987-07-13','ST_CLERK',2700.00,0.00,120,50),
(127,'James','Landry','JLANDRY','650.124.1334','1987-07-14','ST_CLERK',2400.00,0.00,120,50),
(128,'Steven','Markle','SMARKLE','650.124.1434','1987-07-15','ST_CLERK',2200.00,0.00,120,50),
(129,'Laura','Bissot','LBISSOT','650.124.5234','1987-07-16','ST_CLERK',3300.00,0.00,121,50),
(130,'Mozhe','Atkinson','MATKINSO','650.124.6234','1987-07-17','ST_CLERK',2800.00,0.00,121,50),
(131,'James','Marlow','JAMRLOW','650.124.7234','1987-07-18','ST_CLERK',2500.00,0.00,121,50),
(132,'TJ','Olson','TJOLSON','650.124.8234','1987-07-19','ST_CLERK',2100.00,0.00,121,50),
(133,'Jason','Mallin','JMALLIN','650.127.1934','1987-07-20','ST_CLERK',3300.00,0.00,122,50),
(134,'Michael','Rogers','MROGERS','650.127.1834','1987-07-21','ST_CLERK',2900.00,0.00,122,50),
(135,'Ki','Gee','KGEE','650.127.1734','1987-07-22','ST_CLERK',2400.00,0.00,122,50),
(136,'Hazel','Philtanker','HPHILTAN','650.127.1634','1987-07-23','ST_CLERK',2200.00,0.00,122,50),
(137,'Renske','Ladwig','RLADWIG','650.121.1234','1987-07-24','ST_CLERK',3600.00,0.00,123,50),
(138,'Stephen','Stiles','SSTILES','650.121.2034','1987-07-25','ST_CLERK',3200.00,0.00,123,50),
(139,'John','Seo','JSEO','650.121.2019','1987-07-26','ST_CLERK',2700.00,0.00,123,50),
(140,'Joshua','Patel','JPATEL','650.121.1834','1987-07-27','ST_CLERK',2500.00,0.00,123,50),
(141,'Trenna','Rajs','TRAJS','650.121.8009','1987-07-28','ST_CLERK',3500.00,0.00,124,50),
(142,'Curtis','Davies','CDAVIES','650.121.2994','1987-07-29','ST_CLERK',3100.00,0.00,124,50),
(143,'Randall','Matos','RMATOS','650.121.2874','1987-07-30','ST_CLERK',2600.00,0.00,124,50),
(144,'Peter','Vargas','PVARGAS','650.121.2004','1987-07-31','ST_CLERK',2500.00,0.00,124,50),
(145,'John','Russell','JRUSSEL','011.44.1344.429268','1987-08-01','SA_MAN',14000.00,0.40,100,80),
(146,'Karen','Partners','KPARTNER','011.44.1344.467268','1987-08-02','SA_MAN',13500.00,0.30,100,80),
(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','1987-08-03','SA_MAN',12000.00,0.30,100,80),
(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','1987-08-04','SA_MAN',11000.00,0.30,100,80),
(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','1987-08-05','SA_MAN',10500.00,0.20,100,80),
(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','1987-08-06','SA_REP',10000.00,0.30,145,80),
(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','1987-08-07','SA_REP',9500.00,0.25,145,80),
(152,'Peter','Hall','PHALL','011.44.1344.478968','1987-08-08','SA_REP',9000.00,0.25,145,80),
(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','1987-08-09','SA_REP',8000.00,0.20,145,80),
(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','1987-08-10','SA_REP',7500.00,0.20,145,80),
(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','1987-08-11','SA_REP',7000.00,0.15,145,80),
(156,'Janette','King','JKING','011.44.1345.429268','1987-08-12','SA_REP',10000.00,0.35,146,80),
(157,'Patrick','Sully','PSULLY','011.44.1345.929268','1987-08-13','SA_REP',9500.00,0.35,146,80),
(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','1987-08-14','SA_REP',9000.00,0.35,146,80),
(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','1987-08-15','SA_REP',8000.00,0.30,146,80),
(160,'Louise','Doran','LDORAN','011.44.1345.629268','1987-08-16','SA_REP',7500.00,0.30,146,80),
(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','1987-08-17','SA_REP',7000.00,0.25,146,80),
(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','1987-08-18','SA_REP',10500.00,0.25,147,80),
(163,'Danielle','Greene','DGREENE','011.44.1346.229268','1987-08-19','SA_REP',9500.00,0.15,147,80),
(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','1987-08-20','SA_REP',7200.00,0.10,147,80),
(165,'David','Lee','DLEE','011.44.1346.529268','1987-08-21','SA_REP',6800.00,0.10,147,80),
(166,'Sundar','Ande','SANDE','011.44.1346.629268','1987-08-22','SA_REP',6400.00,0.10,147,80),
(167,'Amit','Banda','ABANDA','011.44.1346.729268','1987-08-23','SA_REP',6200.00,0.10,147,80),
(168,'Lisa','Ozer','LOZER','011.44.1343.929268','1987-08-24','SA_REP',11500.00,0.25,148,80),
(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','1987-08-25','SA_REP',10000.00,0.20,148,80),
(170,'Tayler','Fox','TFOX','011.44.1343.729268','1987-08-26','SA_REP',9600.00,0.20,148,80),
(171,'William','Smith','WSMITH','011.44.1343.629268','1987-08-27','SA_REP',7400.00,0.15,148,80),
(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','1987-08-28','SA_REP',7300.00,0.15,148,80),
(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','1987-08-29','SA_REP',6100.00,0.10,148,80),
(174,'Ellen','Abel','EABEL','011.44.1644.429267','1987-08-30','SA_REP',11000.00,0.30,149,80),
(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','1987-08-31','SA_REP',8800.00,0.25,149,80),
(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','1987-09-01','SA_REP',8600.00,0.20,149,80),
(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','1987-09-02','SA_REP',8400.00,0.20,149,80),
(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','1987-09-03','SA_REP',7000.00,0.15,149,0),
(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','1987-09-04','SA_REP',6200.00,0.10,149,80),
(180,'Winston','Taylor','WTAYLOR','650.507.9876','1987-09-05','SH_CLERK',3200.00,0.00,120,50),
(181,'Jean','Fleaur','JFLEAUR','650.507.9877','1987-09-06','SH_CLERK',3100.00,0.00,120,50),
(182,'Martha','Sullivan','MSULLIVA','650.507.9878','1987-09-07','SH_CLERK',2500.00,0.00,120,50),
(183,'Girard','Geoni','GGEONI','650.507.9879','1987-09-08','SH_CLERK',2800.00,0.00,120,50),
(184,'Nandita','Sarchand','NSARCHAN','650.509.1876','1987-09-09','SH_CLERK',4200.00,0.00,121,50),
(185,'Alexis','Bull','ABULL','650.509.2876','1987-09-10','SH_CLERK',4100.00,0.00,121,50),
(186,'Julia','Dellinger','JDELLING','650.509.3876','1987-09-11','SH_CLERK',3400.00,0.00,121,50),
(187,'Anthony','Cabrio','ACABRIO','650.509.4876','1987-09-12','SH_CLERK',3000.00,0.00,121,50),
(188,'Kelly','Chung','KCHUNG','650.505.1876','1987-09-13','SH_CLERK',3800.00,0.00,122,50),
(189,'Jennifer','Dilly','JDILLY','650.505.2876','1987-09-14','SH_CLERK',3600.00,0.00,122,50),
(190,'Timothy','Gates','TGATES','650.505.3876','1987-09-15','SH_CLERK',2900.00,0.00,122,50),
(191,'Randall','Perkins','RPERKINS','650.505.4876','1987-09-16','SH_CLERK',2500.00,0.00,122,50),
(192,'Sarah','Bell','SBELL','650.501.1876','1987-09-17','SH_CLERK',4000.00,0.00,123,50),
(193,'Britney','Everett','BEVERETT','650.501.2876','1987-09-18','SH_CLERK',3900.00,0.00,123,50),
(194,'Samuel','McCain','SMCCAIN','650.501.3876','1987-09-19','SH_CLERK',3200.00,0.00,123,50),
(195,'Vance','Jones','VJONES','650.501.4876','1987-09-20','SH_CLERK',2800.00,0.00,123,50),
(196,'Alana','Walsh','AWALSH','650.507.9811','1987-09-21','SH_CLERK',3100.00,0.00,124,50),
(197,'Kevin','Feeney','KFEENEY','650.507.9822','1987-09-22','SH_CLERK',3000.00,0.00,124,50),
(198,'Donald','OConnell','DOCONNEL','650.507.9833','1987-09-23','SH_CLERK',2600.00,0.00,124,50),
(199,'Douglas','Grant','DGRANT','650.507.9844','1987-09-24','SH_CLERK',2600.00,0.00,124,50),
(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1987-09-25','AD_ASST',4400.00,0.00,101,10),
(201,'Michael','Hartstein','MHARTSTE','515.123.5555','1987-09-26','MK_MAN',13000.00,0.00,100,20),
(202,'Pat','Fay','PFAY','603.123.6666','1987-09-27','MK_REP',6000.00,0.00,201,20),
(203,'Susan','Mavris','SMAVRIS','515.123.7777','1987-09-28','HR_REP',6500.00,0.00,101,40),
(204,'Hermann','Baer','HBAER','515.123.8888','1987-09-29','PR_REP',10000.00,0.00,101,70),
(205,'Shelley','Higgins','SHIGGINS','515.123.8080','1987-09-30','AC_MGR',12000.00,0.00,101,110),
(206,'William','Gietz','WGIETZ','515.123.8181','1987-10-01','AC_ACCOUNT',8300.00,0.00,205,110);


-- Write a SQL statement to change the email column of employees table with 'not available' for all employees.
update employees set EMAIL = 'not available';
select * from employees;
-- 2. Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for all employees.
update employees set EMAIL = 'not available', COMMISSION_PCT = 0.10;
--  Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for those employees whose department_id is 110
update employees set EMAIL = 'not available', COMMISSION_PCT = 0.10 where DEPARTMENT_ID = 110;
select * from employees;
-- 4. Write a SQL statement to change the email column of employees table with 'not available' for those employees whose department_id is 80 and gets a commission_pct is less than .20
update employees set EMAIL = 'not available' where DEPARTMENT_ID = 80 and COMMISSION_PCT < 0.20;
-- rite a SQL statement to change the email column of employees table with 'not available' for those employees who belongs to the 'Accouning' department.
update employees set EMAIL = 'not available' where DEPARTMENT_ID in (select DEPARTMENT_ID from departments where DEPARTMENT_NAME = 'Accounting');
select * from employees;
--  Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000
update employees set SALARY = 8000 where EMPLOYEE_ID = 105 and SALARY<5000;
SELECT * from employees;
--  Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.
update employees set JOB_ID = 'SH_CLERK' where EMPLOYEE_ID = 118 and DEPARTMENT_ID = 30 and not  JOB_ID like 'SH%';
select * from employees;
-- Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.
update employees set SALARY = SALARY + 0.25*SALARY where DEPARTMENT_ID = 40;
update employees set SALARY = SALARY + 0.15*SALARY where DEPARTMENT_ID = 90;
update employees set SALARY = SALARY + 0.10*SALARY where DEPARTMENT_ID = 110;
-- Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20% and commission percent by .10.
select * from jobs ;
update jobs set MIN_SALARY = MIN_SALARY + 2000 , MAX_SALARY = MAX_SALARY + 2000 where JOB_ID = 'PU_CLERK';
update employees set SALARY = SALARY + 0.20*SALARY, COMMISSION_PCT = COMMISSION_PCT + 0.10 where JOB_ID = 'PU_CLERK';
-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2015 at 01:43 AM
-- Server version: 5.5.34-cll-lve
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
create data
use mayya;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wrpracti_bookinfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--
create DATABASE mayya;
use mayya;
CREATE TABLE IF NOT EXISTS `countries` (
  `COUNTRY_ID` varchar(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) DEFAULT NULL,
  `REGION_ID` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  KEY `COUNTR_REG_FK` (`REGION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`COUNTRY_ID`, `COUNTRY_NAME`, `REGION_ID`) VALUES
('AR', 'Argentina', '2'),
('AU', 'Australia', '3'),
('BE', 'Belgium', '1'),
('BR', 'Brazil', '2'),
('CA', 'Canada', '2'),
('CH', 'Switzerland', '1'),
('CN', 'China', '3'),
('DE', 'Germany', '1'),
('DK', 'Denmark', '1'),
('EG', 'Egypt', '4'),
('FR', 'France', '1'),
('HK', 'HongKong', '3'),
('IL', 'Israel', '4'),
('IN', 'India', '3'),
('IT', 'Italy', '1'),
('JP', 'Japan', '3'),
('KW', 'Kuwait', '4'),
('MX', 'Mexico', '2'),
('NG', 'Nigeria', '4'),
('NL', 'Netherlands', '1'),
('SG', 'Singapore', '3'),
('UK', 'United Kingdom', '1'),
('US', 'United States of America', '2'),
('ZM', 'Zambia', '4'),
('ZW', 'Zimbabwe', '4');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `DEPARTMENT_ID` decimal(4,0) NOT NULL DEFAULT '0',
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `LOCATION_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `DEPT_MGR_FK` (`MANAGER_ID`),
  KEY `DEPT_LOCATION_IX` (`LOCATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `MANAGER_ID`, `LOCATION_ID`) VALUES
('10', 'Administration', '200', '1700'),
('20', 'Marketing', '201', '1800'),
('30', 'Purchasing', '114', '1700'),
('40', 'Human Resources', '203', '2400'),
('50', 'Shipping', '121', '1500'),
('60', 'IT', '103', '1400'),
('70', 'Public Relations', '204', '2700'),
('80', 'Sales', '145', '2500'),
('90', 'Executive', '100', '1700'),
('100', 'Finance', '108', '1700'),
('110', 'Accounting', '205', '1700'),
('120', 'Treasury', '0', '1700'),
('130', 'Corporate Tax', '0', '1700'),
('140', 'Control And Credit', '0', '1700'),
('150', 'Shareholder Services', '0', '1700'),
('160', 'Benefits', '0', '1700'),
('170', 'Manufacturing', '0', '1700'),
('180', 'Construction', '0', '1700'),
('190', 'Contracting', '0', '1700'),
('200', 'Operations', '0', '1700'),
('210', 'IT Support', '0', '1700'),
('220', 'NOC', '0', '1700'),
('230', 'IT Helpdesk', '0', '1700'),
('240', 'Government Sales', '0', '1700'),
('250', 'Retail Sales', '0', '1700'),
('260', 'Recruiting', '0', '1700'),
('270', 'Payroll', '0', '1700');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL DEFAULT '0',
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
  KEY `EMP_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  KEY `EMP_JOB_IX` (`JOB_ID`),
  KEY `EMP_MANAGER_IX` (`MANAGER_ID`),
  KEY `EMP_NAME_IX` (`LAST_NAME`,`FIRST_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`) VALUES
('100', 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', '24000.00', '0.00', '0', '90'),
('101', 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1987-06-18', 'AD_VP', '17000.00', '0.00', '100', '90'),
('102', 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1987-06-19', 'AD_VP', '17000.00', '0.00', '100', '90'),
('103', 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1987-06-20', 'IT_PROG', '9000.00', '0.00', '102', '60'),
('104', 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1987-06-21', 'IT_PROG', '6000.00', '0.00', '103', '60'),
('105', 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1987-06-22', 'IT_PROG', '4800.00', '0.00', '103', '60'),
('106', 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1987-06-23', 'IT_PROG', '4800.00', '0.00', '103', '60'),
('107', 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1987-06-24', 'IT_PROG', '4200.00', '0.00', '103', '60'),
('108', 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1987-06-25', 'FI_MGR', '12000.00', '0.00', '101', '100'),
('109', 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1987-06-26', 'FI_ACCOUNT', '9000.00', '0.00', '108', '100'),
('110', 'John', 'Chen', 'JCHEN', '515.124.4269', '1987-06-27', 'FI_ACCOUNT', '8200.00', '0.00', '108', '100'),
('111', 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1987-06-28', 'FI_ACCOUNT', '7700.00', '0.00', '108', '100'),
('112', 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '1987-06-29', 'FI_ACCOUNT', '7800.00', '0.00', '108', '100'),
('113', 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1987-06-30', 'FI_ACCOUNT', '6900.00', '0.00', '108', '100'),
('114', 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '1987-07-01', 'PU_MAN', '11000.00', '0.00', '100', '30'),
('115', 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '1987-07-02', 'PU_CLERK', '3100.00', '0.00', '114', '30'),
('116', 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '1987-07-03', 'PU_CLERK', '2900.00', '0.00', '114', '30'),
('117', 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '1987-07-04', 'PU_CLERK', '2800.00', '0.00', '114', '30'),
('118', 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '1987-07-05', 'PU_CLERK', '2600.00', '0.00', '114', '30'),
('119', 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '1987-07-06', 'PU_CLERK', '2500.00', '0.00', '114', '30'),
('120', 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '1987-07-07', 'ST_MAN', '8000.00', '0.00', '100', '50'),
('121', 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '1987-07-08', 'ST_MAN', '8200.00', '0.00', '100', '50'),
('122', 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '1987-07-09', 'ST_MAN', '7900.00', '0.00', '100', '50'),
('123', 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '1987-07-10', 'ST_MAN', '6500.00', '0.00', '100', '50'),
('124', 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1987-07-11', 'ST_MAN', '5800.00', '0.00', '100', '50'),
('125', 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '1987-07-12', 'ST_CLERK', '3200.00', '0.00', '120', '50'),
('126', 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '1987-07-13', 'ST_CLERK', '2700.00', '0.00', '120', '50'),
('127', 'James', 'Landry', 'JLANDRY', '650.124.1334', '1987-07-14', 'ST_CLERK', '2400.00', '0.00', '120', '50'),
('128', 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '1987-07-15', 'ST_CLERK', '2200.00', '0.00', '120', '50'),
('129', 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '1987-07-16', 'ST_CLERK', '3300.00', '0.00', '121', '50'),
('130', 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '1987-07-17', 'ST_CLERK', '2800.00', '0.00', '121', '50'),
('131', 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '1987-07-18', 'ST_CLERK', '2500.00', '0.00', '121', '50'),
('132', 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '1987-07-19', 'ST_CLERK', '2100.00', '0.00', '121', '50'),
('133', 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '1987-07-20', 'ST_CLERK', '3300.00', '0.00', '122', '50'),
('134', 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '1987-07-21', 'ST_CLERK', '2900.00', '0.00', '122', '50'),
('135', 'Ki', 'Gee', 'KGEE', '650.127.1734', '1987-07-22', 'ST_CLERK', '2400.00', '0.00', '122', '50'),
('136', 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '1987-07-23', 'ST_CLERK', '2200.00', '0.00', '122', '50'),
('137', 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '1987-07-24', 'ST_CLERK', '3600.00', '0.00', '123', '50'),
('138', 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '1987-07-25', 'ST_CLERK', '3200.00', '0.00', '123', '50'),
('139', 'John', 'Seo', 'JSEO', '650.121.2019', '1987-07-26', 'ST_CLERK', '2700.00', '0.00', '123', '50'),
('140', 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '1987-07-27', 'ST_CLERK', '2500.00', '0.00', '123', '50'),
('141', 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '1987-07-28', 'ST_CLERK', '3500.00', '0.00', '124', '50'),
('142', 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '1987-07-29', 'ST_CLERK', '3100.00', '0.00', '124', '50'),
('143', 'Randall', 'Matos', 'RMATOS', '650.121.2874', '1987-07-30', 'ST_CLERK', '2600.00', '0.00', '124', '50'),
('144', 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '1987-07-31', 'ST_CLERK', '2500.00', '0.00', '124', '50'),
('145', 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', '1987-08-01', 'SA_MAN', '14000.00', '0.40', '100', '80'),
('146', 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', '1987-08-02', 'SA_MAN', '13500.00', '0.30', '100', '80'),
('147', 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', '1987-08-03', 'SA_MAN', '12000.00', '0.30', '100', '80'),
('148', 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', '1987-08-04', 'SA_MAN', '11000.00', '0.30', '100', '80'),
('149', 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '1987-08-05', 'SA_MAN', '10500.00', '0.20', '100', '80'),
('150', 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', '1987-08-06', 'SA_REP', '10000.00', '0.30', '145', '80'),
('151', 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', '1987-08-07', 'SA_REP', '9500.00', '0.25', '145', '80'),
('152', 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', '1987-08-08', 'SA_REP', '9000.00', '0.25', '145', '80'),
('153', 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', '1987-08-09', 'SA_REP', '8000.00', '0.20', '145', '80'),
('154', 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', '1987-08-10', 'SA_REP', '7500.00', '0.20', '145', '80'),
('155', 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '1987-08-11', 'SA_REP', '7000.00', '0.15', '145', '80'),
('156', 'Janette', 'King', 'JKING', '011.44.1345.429268', '1987-08-12', 'SA_REP', '10000.00', '0.35', '146', '80'),
('157', 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', '1987-08-13', 'SA_REP', '9500.00', '0.35', '146', '80'),
('158', 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', '1987-08-14', 'SA_REP', '9000.00', '0.35', '146', '80'),
('159', 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', '1987-08-15', 'SA_REP', '8000.00', '0.30', '146', '80'),
('160', 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', '1987-08-16', 'SA_REP', '7500.00', '0.30', '146', '80'),
('161', 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', '1987-08-17', 'SA_REP', '7000.00', '0.25', '146', '80'),
('162', 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', '1987-08-18', 'SA_REP', '10500.00', '0.25', '147', '80'),
('163', 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', '1987-08-19', 'SA_REP', '9500.00', '0.15', '147', '80'),
('164', 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', '1987-08-20', 'SA_REP', '7200.00', '0.10', '147', '80'),
('165', 'David', 'Lee', 'DLEE', '011.44.1346.529268', '1987-08-21', 'SA_REP', '6800.00', '0.10', '147', '80'),
('166', 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', '1987-08-22', 'SA_REP', '6400.00', '0.10', '147', '80'),
('167', 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', '1987-08-23', 'SA_REP', '6200.00', '0.10', '147', '80'),
('168', 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', '1987-08-24', 'SA_REP', '11500.00', '0.25', '148', '80'),
('169', 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', '1987-08-25', 'SA_REP', '10000.00', '0.20', '148', '80'),
('170', 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', '1987-08-26', 'SA_REP', '9600.00', '0.20', '148', '80'),
('171', 'William', 'Smith', 'WSMITH', '011.44.1343.629268', '1987-08-27', 'SA_REP', '7400.00', '0.15', '148', '80'),
('172', 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', '1987-08-28', 'SA_REP', '7300.00', '0.15', '148', '80'),
('173', 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', '1987-08-29', 'SA_REP', '6100.00', '0.10', '148', '80'),
('174', 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '1987-08-30', 'SA_REP', '11000.00', '0.30', '149', '80'),
('175', 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '1987-08-31', 'SA_REP', '8800.00', '0.25', '149', '80'),
('176', 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1987-09-01', 'SA_REP', '8600.00', '0.20', '149', '80'),
('177', 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', '1987-09-02', 'SA_REP', '8400.00', '0.20', '149', '80'),
('178', 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '1987-09-03', 'SA_REP', '7000.00', '0.15', '149', '0'),
('179', 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', '1987-09-04', 'SA_REP', '6200.00', '0.10', '149', '80'),
('180', 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '1987-09-05', 'SH_CLERK', '3200.00', '0.00', '120', '50'),
('181', 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '1987-09-06', 'SH_CLERK', '3100.00', '0.00', '120', '50'),
('182', 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '1987-09-07', 'SH_CLERK', '2500.00', '0.00', '120', '50'),
('183', 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '1987-09-08', 'SH_CLERK', '2800.00', '0.00', '120', '50'),
('184', 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '1987-09-09', 'SH_CLERK', '4200.00', '0.00', '121', '50'),
('185', 'Alexis', 'Bull', 'ABULL', '650.509.2876', '1987-09-10', 'SH_CLERK', '4100.00', '0.00', '121', '50'),
('186', 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '1987-09-11', 'SH_CLERK', '3400.00', '0.00', '121', '50'),
('187', 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '1987-09-12', 'SH_CLERK', '3000.00', '0.00', '121', '50'),
('188', 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '1987-09-13', 'SH_CLERK', '3800.00', '0.00', '122', '50'),
('189', 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '1987-09-14', 'SH_CLERK', '3600.00', '0.00', '122', '50'),
('190', 'Timothy', 'Gates', 'TGATES', '650.505.3876', '1987-09-15', 'SH_CLERK', '2900.00', '0.00', '122', '50'),
('191', 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '1987-09-16', 'SH_CLERK', '2500.00', '0.00', '122', '50'),
('192', 'Sarah', 'Bell', 'SBELL', '650.501.1876', '1987-09-17', 'SH_CLERK', '4000.00', '0.00', '123', '50'),
('193d', 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '1987-09-18', 'SH_CLERK', '3900.00', '0.00', '123', '50'),
('194', 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', '1987-09-19', 'SH_CLERK', '3200.00', '0.00', '123', '50'),
('195', 'Vance', 'Jones', 'VJONES', '650.501.4876', '1987-09-20', 'SH_CLERK', '2800.00', '0.00', '123', '50'),
('196', 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '1987-09-21', 'SH_CLERK', '3100.00', '0.00', '124', '50'),
('197', 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '1987-09-22', 'SH_CLERK', '3000.00', '0.00', '124', '50'),
('198', 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '1987-09-23', 'SH_CLERK', '2600.00', '0.00', '124', '50'),
('199', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '1987-09-24', 'SH_CLERK', '2600.00', '0.00', '124', '50'),
('200', 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1987-09-25', 'AD_ASST', '4400.00', '0.00', '101', '10'),
('201', 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1987-09-26', 'MK_MAN', '13000.00', '0.00', '100', '20'),
('202', 'Pat', 'Fay', 'PFAY', '603.123.6666', '1987-09-27', 'MK_REP', '6000.00', '0.00', '201', '20'),
('203', 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', '1987-09-28', 'HR_REP', '6500.00', '0.00', '101', '40'),
('204', 'Hermann', 'Baer', 'HBAER', '515.123.8888', '1987-09-29', 'PR_REP', '10000.00', '0.00', '101', '70'),
('205', 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1987-09-30', 'AC_MGR', '12000.00', '0.00', '101', '110'),
('206', 'William', 'Gietz', 'WGIETZ', '515.123.8181', '1987-10-01', 'AC_ACCOUNT', '8300.00', '0.00', '205', '110');

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

CREATE TABLE IF NOT EXISTS `job_history` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`,`START_DATE`),
  KEY `JHIST_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  KEY `JHIST_EMPLOYEE_IX` (`EMPLOYEE_ID`),
  KEY `JHIST_JOB_IX` (`JOB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_history`
--

INSERT INTO `job_history` (`EMPLOYEE_ID`, `START_DATE`, `END_DATE`, `JOB_ID`, `DEPARTMENT_ID`) VALUES
('102', '1993-01-13', '1998-07-24', 'IT_PROG', '60'),
('101', '1989-09-21', '1993-10-27', 'AC_ACCOUNT', '110'),
('101', '1993-10-28', '1997-03-15', 'AC_MGR', '110'),
('201', '1996-02-17', '1999-12-19', 'MK_REP', '20'),
('114', '1998-03-24', '1999-12-31', 'ST_CLERK', '50'),
('122', '1999-01-01', '1999-12-31', 'ST_CLERK', '50'),
('200', '1987-09-17', '1993-06-17', 'AD_ASST', '90'),
('176', '1998-03-24', '1998-12-31', 'SA_REP', '80'),
('176', '1999-01-01', '1999-12-31', 'SA_MAN', '80'),
('200', '1994-07-01', '1998-12-31', 'AC_ACCOUNT', '90'),
('0', '0000-00-00', '0000-00-00', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `JOB_ID` varchar(10) NOT NULL DEFAULT '',
  `JOB_TITLE` varchar(35) NOT NULL,
  `MIN_SALARY` decimal(6,0) DEFAULT NULL,
  `MAX_SALARY` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`JOB_ID`, `JOB_TITLE`, `MIN_SALARY`, `MAX_SALARY`) VALUES
('AD_PRES', 'President', '20000', '40000'),
('AD_VP', 'Administration Vice President', '15000', '30000'),
('AD_ASST', 'Administration Assistant', '3000', '6000'),
('FI_MGR', 'Finance Manager', '8200', '16000'),
('FI_ACCOUNT', 'Accountant', '4200', '9000'),
('AC_MGR', 'Accounting Manager', '8200', '16000'),
('AC_ACCOUNT', 'Public Accountant', '4200', '9000'),
('SA_MAN', 'Sales Manager', '10000', '20000'),
('SA_REP', 'Sales Representative', '6000', '12000'),
('PU_MAN', 'Purchasing Manager', '8000', '15000'),
('PU_CLERK', 'Purchasing Clerk', '2500', '5500'),
('ST_MAN', 'Stock Manager', '5500', '8500'),
('ST_CLERK', 'Stock Clerk', '2000', '5000'),
('SH_CLERK', 'Shipping Clerk', '2500', '5500'),
('IT_PROG', 'Programmer', '4000', '10000'),
('MK_MAN', 'Marketing Manager', '9000', '15000'),
('MK_REP', 'Marketing Representative', '4000', '9000'),
('HR_REP', 'Human Resources Representative', '4000', '9000'),
('PR_REP', 'Public Relations Representative', '4500', '10500');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `LOCATION_ID` decimal(4,0) NOT NULL DEFAULT '0',
  `STREET_ADDRESS` varchar(40) DEFAULT NULL,
  `POSTAL_CODE` varchar(12) DEFAULT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE_PROVINCE` varchar(25) DEFAULT NULL,
  `COUNTRY_ID` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`),
  KEY `LOC_CITY_IX` (`CITY`),
  KEY `LOC_COUNTRY_IX` (`COUNTRY_ID`),
  KEY `LOC_STATE_PROVINCE_IX` (`STATE_PROVINCE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`LOCATION_ID`, `STREET_ADDRESS`, `POSTAL_CODE`, `CITY`, `STATE_PROVINCE`, `COUNTRY_ID`) VALUES
('1000', '1297 Via Cola di Rie', '989', 'Roma', '', 'IT'),
('1100', '93091 Calle della Testa', '10934', 'Venice', '', 'IT'),
('1200', '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
('1300', '9450 Kamiya-cho', '6823', 'Hiroshima', '', 'JP'),
('1400', '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
('1500', '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
('1600', '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
('1700', '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
('1800', '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
('1900', '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
('2000', '40-5-12 Laogianggen', '190518', 'Beijing', '', 'CN'),
('2100', '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
('2200', '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
('2300', '198 Clementi North', '540198', 'Singapore', '', 'SG'),
('2400', '8204 Arthur St', '', 'London', '', 'UK'),
('2500', '"Magdalen Centre', ' The Oxford ', 'OX9 9ZB', 'Oxford', 'Ox'),
('2600', '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK'),
('2700', 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
('2800', 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
('2900', '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
('3000', 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
('3100', 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
('3200', 'Mariano Escobedo 9991', '11932', 'Mexico City', '"Distrito Federal', '"');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `REGION_ID` decimal(5,0) NOT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`REGION_ID`),
  UNIQUE KEY `sss` (`REGION_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`REGION_ID`, `REGION_NAME`) VALUES
('1', 'Europe\r'),
('2', 'Americas\r'),
('3', 'Asia\r'),
('4', 'Middle East and Africa\r');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--  Write a SQL statement to rename the table countries to country_new.:
ALTER table countries RENAME country_new;
ALTER table  country_new RENAME countries;
select * from country_new;
--  Write a SQL statement to add a column region_id to the table locations.
ALTER table locations add region_id int;
select * from locations;
-- Write a SQL statement to add a columns ID as the first column of the table locations.
alter table locations add ID int first;
-- Write a SQL statement to add a column region_id after state_province to the table locations.
alter table locations drop region_id;
alter table locations add region_id int after state_province;
SELECT * from locations;
-- Write a SQL statement change the data type of the column country_id to integer in the table locations.
alter table locations modify country_id int;

SELECT * from locations;
-- Write a SQL statement to drop the column city from the table locations.
alter table locations drop city;
-- Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.
alter table locations drop state_province;
alter table locations add  state VARCHAR(25) after city;
alter table locations change state_province state varchar(25);
select * from locations;
-- Write a SQL statement to add a primary key for the columns location_id in the locations table.
alter table locations add primary key(location_id);
describe locations;

--  Write a SQL statement to add a primary key for a combination of columns location_id and country_id.
alter table locations add primary key(location_id,country_id);
-- Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.
alter table locations drop PRIMARY KEY;
-- Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.
alter table job_history add FOREIGN KEY(job_id) REFERENCES jobs(job_id);
-- Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing to the primary key job_id of jobs table.
alter table job_history add fk_job_id int ;
alter table job_history add FOREIGN key(fk_job_id) references jobs(job_id);
-- Write a SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column which is referencing to the job_id of jobs table.
alter table job_history drop foreign key fk_job_id;
-- Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.
create INDEX  indx_job_id on job_history(job_id);
select * from job_history;
-- Write a SQL statement to drop the index indx_job_id from job_history table.
alter table job_history drop index indx_job_id;

--  Write a query to display the names (first_name, last_name) using alias name "First Name", "Last Name"
select * from employees;
select first_name as "First name",last_name  as "Last name" from employees;
-- Write a query to get unique department ID from employee table.
select distinct department_id  from employees;
-- Write a query to get all employee details from the employee table order by first name, descending.
select * from employees order by first_name desc;
-- Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).
select  concat(first_name,last_name) as names, 0.15*salary as PF from employees;
-- Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
select concat(first_name,last_name) as names, salary  from employees order by salary asc; 
--  Write a query to get the total salaries payable to employees.
select sum(salary) from employees;
--  Write a query to get the maximum and minimum salary from employees table.
select min(salary),max(salary) from employees;
-- Write a query to get the average salary and number of employees in the employees table.
select avg(salary),count(employee_id) from employees;
-- Write a query to get the number of employees working with the company.
select count(employee_id) from employees; 
-- 10. Write a query to get the number of jobs available in the employees table.
select count(distinct job_id) from employees;
-- Write a query get all first name from employees table in upper case.
select upper(first_name) from employees;
-- Write a query to get the first 3 characters of first name from employees table.
select substring(first_name,1,3) from employees;
--  Write a query to calculate 171*214+625.
select 176*214+625;
-- Write a query to get first name from employees table after removing white spaces from both side.
select trim(trailing ' ' from first_name) from employees;
select trim(leading  ' ' from first_name) from employees;
select trim(both ' ' from first_name) from employees;
-- Write a query to get the length of the employee names (first_name, last_name) from employees table.
select length(concat(first_name, last_name)) as names from employees;
-- Write a query to check if the first_name fields of the employees table contains numbers.
select * from employees where FIRST_NAME REGEXP '[0-9]';
--  Write a query to select first 10 records from a table.
select * from employees limit 10;
-- Write a query to get monthly salary (round 2 decimal places) of each and every employee
-- Note : Assume the salary field provides the 'annual salary' information.
select * from employees;
select round(salary/12,2) from employees;
-- 1. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.
select concat(first_name,last_name) as names  from employees where salary  >10000 and salary <15000;
-- . Write a query to display the name (firs_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.
select concat(first_name,last_name) as names, department_id from employees WHERE department_id = 30 or department_id = 100 order by department_id asc;
select * from employees;
-- 3. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.
select CONCAT(first_name, last_name),salary from employees where (salary>15000 or salary <10000) and (department_id =30 or department_id =100);
-- 4. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
select CONCAT(first_name,last_name),hire_date as names from employees where hire_date like '1987%';
-- Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
select first_name from employees where first_name like '%b%' and first_name like '%c%';
-- Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000
select last_name,job_id,salary from employees where (job_id like '%prog%' or job_id like '%clerk%') and (salary != 4500 and salary!=10000 and salary!=15000);
-- Write a query to display the last name of employees whose names have exactly 6 characters.
select last_name from employees where length(last_name)=6;
select first_name,last_name from employees where length(concat(first_name,last_name))=6;
-- Write a query to display the last name of employees having 'e' as the third character.
select last_name from employees where last_name like '%e__';
-- Write a query to display the jobs/designations available in the employees table.
select distinct job_id from employees;
-- Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees.
select concat(first_name,last_name) as names,salary, 0.15*salary as pf from employees;
-- Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
select * from employees where last_name like '%BLAKE%' or last_name like '%SCOTT%' or last_name like '%KING%' or last_name like '%FORD%';

-- Write a query to list the number of jobs available in the employees table.
select count(employee_id) from employees;
--  Write a query to get the total salaries payable to employees.
select sum(salary) from employees;
--  Write a query to get the minimum salary from employees table.
select min(salary) from employees;
-- Write a query to get the maximum salary of an employee working as a Programmer.
select max(salary) from employees;
--  Write a query to get the average salary and number of employees working the department 90.
select avg(salary), count(employee_id) from employees where department_id = 90;
--  Write a query to get the highest, lowest, sum, and average salary of all employees.
select max(salary), min(salary), sum(salary), avg(salary) from employees;
--  Write a query to get the number of employees with the same job.
select count(employee_id), job_id from employees group by job_id;
--  Write a query to get the difference between the highest and lowest salaries.
select max(salary)-min(salary) from employees;
--  Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
select manager_id,salary from employees where salary in (select min(salary) from employees);
--  Write a query to get the department ID and the total salary payable in each department.
select department_id,sum(salary) from employees group by  department_id;
-- Write a query to get the average salary for each job ID excluding programmer.
select job_id, avg(salary) from employees where job_id  not like '%prog%' group by job_id;
--  Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
select job_id, sum(salary),max(salary),min(salary),avg(salary) from employees where DEPARTMENT_ID = 90 group by job_id;
show tables;
--  Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
select job_id, max(salary) from employees where salary>=4000 GROUP BY job_id;
--  Write a query to get the average salary for all departments employing more than 10 employees.
select department_id,avg(salary),count(`EMPLOYEE_ID`) from employees  GROUP BY department_id having count(`EMPLOYEE_ID`)>10;
--  Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.
select concat(first_name,last_name) as name,salary as name from employees where salary > (select salary from employees where last_name like '%BULL%');
select salary from employees where last_name like '%bull%'; 
--  Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
select concat(first_name,last_name) as name from employees where job_id like '%IT%';
-- Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.
select * from countries;
select * from employees;

select * from departments;
select * from locations;
select * from locations where country_id like 'US';
select concat(first_name,last_name) as name from employees where manager_id in (select manager_id from departments where location_id in (select location_id from locations where country_id ='US' ));
--  Write a query to find the name (first_name, last_name) of the employees who are managers.
select * from employees;
select concat(first_name,last_name) as name from employees where employee_id in (select manager_id
 from employees);
--  Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
select concat(first_name,last_name),salary from employees where salary > (select avg(salary) from employees);
--  Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.
select concat(first_name,last_name) as name ,salary from employees where salary in (select min(salary) from employees where job_id in (select distinct job_id from employees) group by job_id) order by salary;
select min(salary),job_id as name from employees group by job_id order by min(salary);
--  Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments.
select concat(first_name,last_name) as name ,salary from employees where (salary >( select avg(salary) from employees ) and department_id = (select department_id from departments where department_name = 'IT')) ;
--  Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
select CONCAT(first_name,last_name) as name , salary from employees where salary > (select salary from employees where first_name like '%bell' or last_name like '%bell');
--  Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
select concat(first_name,last_name) as name,salary from employees where salary = (select min(salary) from employees);

--  Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.
select concat(first_name,last_name) as name,salary from employees where salary > (select avg(salary) from employees);
--  Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest.
select concat(first_name,last_name) as name,salary from employees where salary > (select avg(salary) from employees where job_id = 'SH_CLERK')order  by salary asc;
--  Write a query to find the name (first_name, last_name) of the employees who are not supervisors.
select * from departments;
select concat(first_name,last_name) as name from employees where employee_id not in (select manager_id from employees);
--  Write a query to display the employee ID, first name, last name, and department names of all employees.
select employee_id,first_name,last_name,(select department_name from departments where employees.department_id = departments.DEPARTMENT_ID) as department_name from employees;
--  Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
select employee_id, first_name, last_name, salary, department_id from employees a where a.salary > (select avg(salary) from employees b where a.department_id = b.department_id);
select avg(salary) from employees where department_id = 10;
select department_id,avg(salary) from employees group by department_id;
--  Write a query to fetch even numbered records from employees table.
set @i = 0;
select i,employee_id from(select @i:= @i+1 as i, employee_id from employees) a where mod(a.i,2)=0;

--  Write a query to find the 5th maximum salary in the employees table.
set @i=0; 
select salary from (select @i:= @i+1 as i,salary from(select distinct salary from employees order by salary desc)b) a where a.i=5;
-- Write a query to find the 4th minimum salary in the employees table.
set @i = 0;
select salary from (select @i:= @i+1 as i,salary from(select distinct salary from employees order by salary asc)b )a where a.i=4;
-- Write a query to select last 10 records from a table.
select count(employee_id)-10 from employees;
set @i = select count(employee_id)-10 from employees;
set @i = 0;
select * from (select @i:= @i+1 as i, employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id from(select * from employees)b)a where (a.i>= (select count(employee_id)-10+1 from employees) and a.i<=(select count(employee_id) from employees));
describe employees;
-- Write a query to list the department ID and name of all the departments where no employee is working.
select * from employees;
select department_id, department_name from departments where departments.department_id not in (select department_id from employees);
--  Write a query to get 3 maximum salaries.
set @i = 0;
select salary from (select @i:= @i+1 as i, salary from (select distinct salary from employees order by salary desc)b)a where a.i>=1 and a.i<=3;
-- Write a query to get 3 minimum salaries
set @i=0;
select salary from (select @i:=@i+1 as i, salary from (select distinct salary from employees order by salary asc)b)a where a.i>=0 and a.i<=3;
--  Write a query to get nth max salaries of employees.
-- nth max salary:
set @i= 0;
select salary from (select @i:= @i+1 as i, salary from (select distinct salary from employees order by salary desc)b)a where a.i = 5;--/n =5
-- n max salaries:
set @i= 0;
select salary from (select @i:= @i+1 as i, salary from (select distinct salary from employees order by salary desc)b)a where a.i>=1 and a.i<=5;--/n=5
--  Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
select departments.department_id,departments.department_name,departments.location_id,locations.street_address, locations.city, locations.state_province, locations.country_id, countries.country_name  from departments join locations on departments.location_id = locations.location_id join countries on locations.country_id = countries.country_id;
--  Write a query to find the name (first_name, last name), department ID and name of all the employees.
select concat(employees.first_name,employees.last_name) as name, employees.department_id, departments.department_name from employees join departments on employees.department_id = departments.department_id;
--  Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
select * from departments;
select * from locations;
select * from employees;
select concat(employees.first_name,employees.last_name) as name, employees.job_id, employees.department_id, departments.department_name from employees join departments on employees.department_id = departments.department_id join locations on departments.location_id = locations.location_id and locations.country_id = 'UK';
--  Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
select a.employee_id, concat(a.first_name, a.last_name) as employee, a.manager_id, concat(b.first_name,b.last_name) as manager from employees a join employees b on a.manager_id = b.employee_id;
-- Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
select concat(a.first_name,a.last_name) as name, a.hire_date from employees a where a.hire_date > (select hire_date from employees where first_name like '%Jones%' or last_name like '%Jones%');
--  Write a query to get the department name and number of employees in the department.
use mayya;
select departments.department_name, count(employees.employee_id) as number_of_employees from employees join  departments on employees.department_id = departments.department_id group by employees.department_id;
--  Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
select a.employee_id, a.first_name, b.job_title, DATEDIFF(c.end_date,c.start_date) as period from employees a join jobs b on a.job_id = b.job_id join job_history c on a.employee_id = c.employee_id where a.department_id = 90;
select * from employees where employee_id = 200;
select * from job_history ;where department_id = 90;
--  Write a query to display the department ID and name and first name of manager.
select a.department_id, a.department_name, b.first_name from departments a join employees b on a.manager_id = b.employee_id;
--  Write a query to display the department name, manager name, and city.
use mayya;
select a.department_name, concat(b.first_name,b.last_name) as manager_name, c.city from departments a join employees b on b.employee_id = a.manager_id join locations c on a.location_id = c.location_id; 
--  Write a query to display the job title and average salary of employees.
select a.job_id, avg(a.salary) from employees a group by a.job_id;
select b.job_title, avg(a.salary) from employees a  join jobs b on a.job_id = b.job_id group by a.job_id;
-- Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
select b.job_title, concat(a.first_name,a.last_name) as name, (a.salary-b.min_salary) as diff from employees a join jobs b on a.job_id = b.job_id;
--  Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
select a.salary, b.* from employees a join job_history b on a.employee_id = b.employee_id where a.salary > 10000;
select * from job_history;
--  Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
use mayya;
select a.department_name, concat(b.first_name,b.last_name) as name, b.hire_date, b.salary from departments a join employees b on a.manager_id = b.employee_id join job_history c on a.manager_id = c.employee_id where datediff(current_date,c.start_date)>(15*365);
CREATE database mayya;
use mayya;
-- Write a query to display the first day of the month (in datetime format) three months before the current month.
select date_sub(current_date,interval 3 month);
--  Write a query to display the last day of the month (in datetime format) three months before the current month.
select timestamp(last_day(date_sub(current_date,interval 3 month)));
--  Write a query to get the distinct Mondays from hire_date in employees tables.
select hire_date,count(employee_id) from employees group by hire_date;
select distinct DAYOFWEEK(hire_date) as day,hire_date from employees where dayofweek(hire_date)=2;
--  Write a query to get the first day of the current year.
select dayofweek(date_format(current_date,'%y-01-01'));
--  Write a query to get the last day of the current year.
select dayofweek(date_format(current_date,'%Y-12-31'));
--  Write a query to calculate the age in year.
select datediff(current_date, '2005-8-16')/365;
--  Write a query to get the current date in the following format.
-- Sample date : 2014-09-04
-- Output : September 4, 2014
select concat(monthname(current_date),' ',extract(day from current_date),', ',extract(year from current_date));
--  Write a query to get the current date in Thursday September 2014 format.
-- Thursday September 2014
select concat(dayname(current_date),' ',monthname(current_date),' ',extract(year from current_date));
--  Write a query to extract the year from the current date.
select extract(year from current_date); 
--  Write a query to get the DATE value from a given day (number in N).
-- Sample days: 730677
-- Output : 2000-07-11 
set @n = 730677;
select from_days(@n);
--  Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30'
select first_name,hire_date from employees where hire_date >= '1987-06-01' and hire_date <= '1987-07-30';
--  Write a query to display the current date in the following format.
-- Sample output: Thursday 4th September 2014 00:00:00
select concat(dayname(current_date),' ',extract(day from current_date),'th ', MONTHNAME(current_date),' ',extract(year from current_date), ' ', current_time);
-- Write a query to display the current date in the following format.
-- Sample output: 05/09/2014
select DATE_FORMAT(current_date, '%d/%m/%y');
-- Write a query to display the current date in the following format.
-- Sample output: 12:00 AM Sep 5, 2014
select concat(TIME_FORMAT(current_time, '%h:%i  %p '),substring(MONTHNAME(CURRENT_DATE),1,3),', ',extract(year from current_date));
--  Write a query to get the firstname, lastname who joined in the month of June.
select first_name, last_name from employees where MONTHNAME(hire_date) like '%June%';
--  Write a query to get the years in which more than 10 employees joined.
-- set @end = (select extract(year from max(end_date)) from job_history);
-- select @end;
-- set @start = ((select extract(year from min(start_date)) from job_history where start_date != 0)-1);
-- select @start;
-- select @start:=@start+1 as year from job_history  where (select count(a.employee_id) from job_history a where a.start_date <= @start and a.end_date >= @start)>10 and @start<=@end;
-- select year from (select @start := @start+1  as year from job_history) where (select count(a.employee_id) from job_history a where a.start_date <= @start and a.end_date >= @start)>10;
select distinct extract(year from hire_date) from employees;
set @yr = (select distinct extract(year from hire_date) from employees);
select count(employee_id) from employees where hire_date like concat('%',@yr,'%'); 
select distinct EXTRACT(year from a.hire_date)  from employees a where ((select count(b.employee_id) from employees b where extract(year from b.hire_date) = extract (year from a.hire_date)) > 10);

--  Write a query to get first name of employees who joined in 1987.
select first_name from employees where hire_date like '%1987%';
-- //Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.
-- select * from departments;
-- select * from job_history;
-- select * from jobs;
-- select a.department_name, concat(b.first_name, ' ', b.last_name), b.salary from departments a join employees b  on a.manager_id = b.employee_id where (select datediff(c.end_date, c.start_date) from job_history c where c.employee_id = a.manager_id limit 1)> 5*365;
-- select datediff(c.end_date, c.start_date) from job_history c where c.employee_id = 200;
-- select * from job_history;
--  Write a query to get employee ID, last name, and date of first salary of the employees.
select employee_id, last_name, DATE_ADD(hire_date,interval 1 month) from employees;
-- --// Write a query to get first name, hire date and experience of the employees.
-- Write a query to get the job_id and related employee's id.
-- Partial output of the query :
select * from jobs;
select a.job_id, select b.employee_id from employees where b.job_id = a.job_id fr


