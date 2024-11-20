/*Creating and inserting values: */
create table emp(Eid int,Ename varchar(20),Address varchar(20),Salary int,Commision int);
insert into emp values(1,"Amit","Pune",35000,5000),(2,"Sneha","Pune",25000,NULL),(3,"Savita","Nashik",28000,2000),(4,"Pooja","Mumbai",19000,NULL),(5,"Sagar","Mumbai",25000,3000);
create table Proj(PrNo int,Addr varchar(20));
insert into Proj values(10,"Mumbai"),(20,"Pune"),(30,"Jalgoan");
select * from emp;


/*1.Find different locations from where employees belong to?*/
select distinct Address from emp;

/*2.What is maximum and minimum salary?*/
select min(Salary),max(Salary) from emp;

/*3.Display the content of employee table according to the
ascending order of salary amount.*/
select * from emp order by Salary;

/*4.Find the name of employee who lived in Nasik or Pune city.*/
select * from emp where Address in("Pune","Nashik");

/*5.Find the name of employees who does not get commission.*/
select * from emp where Commision is NULL;

/*6.Change the city of Amit to Nashik.*/
update emp set Address="Nashik" where Ename="Amit";

/*7.Find the information of employees whose name starts with ‘A’.*/
select * from emp where Ename like("A%");

/*8.Find the count of staff from Mumbai.*/
select count(Address) from emp where Address="Mumbai";

/*9.Find the count of staff from each city.*/
select Address, count(*) from emp group by Address;

/*10.Find the address from where employees
are belonging as well as where projects are going on.*/
select Address from emp union select Addr from Proj order by Address;

/*11.Find city wise minimum salary.*/
select Address,min(Salary) from emp group by Address;

/*12.Find city wise maximum salary having
maximum salary greater than 26000.*/
select Address,max(Salary) from emp group by Address having max(Salary)>26000;

/*13.Delete the employee who is having
salary greater than 30,000.*/
delete from emp where Salary>30000;
select * from emp;
