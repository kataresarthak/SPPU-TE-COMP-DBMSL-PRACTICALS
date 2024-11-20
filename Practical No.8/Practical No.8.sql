/*Problem statement:
Write a database trigger on Library table. The System should keep track of
the records that are being updated or deleted. The old value of updated or
deleted records should be added in Library_Audit table.

Queries:
*/

create table library(rno int,name varchar(20),doi date,bname varchar(20));
insert into library values(1,"ABC",'2024-08-01',"BEE"),(2,"XYZ",'2024-07-10',"EM"),(3,"AAA",'2024-06-10',"M1"),(4,"AEE",'2024-05-10',"M2"),(5,"BEE",'2024-04-10',"EP");
select * from library;
create table aud(rno int,name varchar(20),odoi date,ndoi date, obname varchar(20));
delimiter $
create trigger t1 after update on library for each row
begin
insert into aud values(old.rno,old.name,old.doi,new.doi,old.bname);
end;
$
create trigger t2 after delete on library for each row
begin
insert into aud values(old.rno,old.name,old.doi,NULL,old.bname);
end;
$
update library set doi='2023-06-06' where rno=3$
delete from library where rno=1$
select * from aud;$
