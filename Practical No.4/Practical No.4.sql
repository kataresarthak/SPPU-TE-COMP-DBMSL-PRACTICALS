/*Tables:
1. Borrower(Roll_no, Name, Date of Issue, Name of Book, Status)
2. Fine (Roll no, Date, Amt)
Question:
• Accept Roll no and Name of Book from user.
• Check the number of days (from date of issue).
• If days are between 15 to 30 then fine amount will be Rs 5per day.
• If no. of days>30, per day fine will be Rs 50 per day and for days less than 30, Rs. 5 per day.
• After submitting the book, status will change from I to R.
• If condition of fine is true, then details will be stored into fine table.
• Also handles the exception by named exception handler or user define exception handler.

Queries:
*/

create table Borrower(roll_no int,name varchar(20),DOI date,book varchar(20),status varchar(20));
create table fine(roll_no int,days int,amt int);

insert into Borrower values(23,"abc","2024-07-02","ABC","I"),(50,"pqr","2024-04-07","XYZ","I"),(34,"xyz","2024-03-12","dgh","I"),(12,"pqrs","2023-12-30","jim","I");
select * from Borrower;

delimiter $
create procedure p1(r int,b varchar(20))
begin
declare idt date;
declare diff int;
declare fn int;
select DOI into idt from Borrower where roll_no=r and book=b;
update Borrower set status="R" where roll_no=r and book=b;
select * from Borrower;
select datediff(curdate(),idt) into diff;
select diff;
if(diff<=15) then
  set fn=0;
elseif (diff>15 and diff<=30) then
  set fn=(diff-15)*5;
  insert into fine values(r,diff,fn);
else 
  set fn=(diff-30)*50+75;
  insert into fine values(r,diff,fn);
end if;
select * from fine;
end;$
call p1(50,"XYZ")$



