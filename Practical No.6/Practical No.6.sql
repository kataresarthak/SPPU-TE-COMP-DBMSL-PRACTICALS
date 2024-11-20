/*Problem statement:
Write a Stored Procedure namely proc_Grade for the categorization of
student. If marks scoredby students in examination is &lt;=1500 and
marks&gt;=990 then student will be placed in distinction category if marks
scored are between 989 and 900 category is first class, if marks 899 and
825 category is Higher Second Class.
Write a PL/SQL block to use procedure created with above requirement.
Stud_Marks(name, total_marks) Result(Roll,Name, Class)
*/

create table stud_marks(roll_no int,name varchar(20),marks int);
insert into stud_marks values(1,"XYZ",901),(2,"ABC",500),(3,"ASD",1400),(4,"ZZZ",850);
delimiter #

create function grd(rno int) returns varchar(20) DETERMINISTIC
begin
declare m int;
declare res varchar(20);
select marks into m from stud_marks where roll_no=rno;
if(m<=1500 and m>=900) then
set res="Dist";
elseif(m<=989 and m>900) then
set res="First Class";
elseif(m<=899 and m>825) then
set res="Higher Secondary Class";
else
set res="Pass";
end if;
return res;
end;#


select grd(1)#
