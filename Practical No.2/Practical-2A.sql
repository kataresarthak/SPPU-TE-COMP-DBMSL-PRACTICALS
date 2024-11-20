/*Problem Statement
Create one table employee with fields 
Eno -primary key and apply sequence starts with 101 
Ename-not null Address-default 'Nashik' 
Joindate Post Salary-check > 5000 
Create another table emp_proj with fields 
Eno- forign key 
Project_name 
Loc 
Create Index on Ename field of employee table 
Create View on employee table to show only Employee name, it's post and salary.
*/


create table employee(eno int primary key AUTO_INCREMENT,ename varchar(20) not null);
alter table employee add column address varchar(20) default 'Nashik';
alter table employee add column jdate date;
alter table employee add column post varchar(20);
alter table employee add column salary int;

alter table employee add constraint c1 check(salary>5000);
alter table employee AUTO_INCREMENT=101;
describe employee;
insert into employee(ename,jdate,post,salary) values("xyz",'2020-02-01',"XYZ",10000);
select * from employee;
create index i1 on employee(ename);
create view v1 as select ename,post,salary from employee;
select * from v1;

create table emp_proj(eno int, foreign key(eno) references employee(eno) on update cascade on delete cascade);
alter table emp_proj add column pname varchar(20);
alter table emp_proj add column loc varchar(20);
describe emp_proj;
