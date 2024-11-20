 /*Creating table and inserting values: */ 
create table Cust_info(C_id int,Cname varchar(20),City varchar(20));

insert into Cust_info values(1,"John","Nashik"),(2,"Seema","Aurangabad"),(3,"Amita","Nagar"),(4,"Rakesh","Pune"),
(5,"Samata","Nashik"),(6,"Ankita","Chandwad"),(7,"Bhavika","Pune"),(8,"Deepa","Mumbai"),(9,"Nitin","Nagpur"),(10,"Pooja","Pune");
create table Acc_info(C_id int,Acc_Type varchar(20), Amount int);

insert into Acc_info values(1,"Current",5000),(2,"Saving",20000),(3,"Saving",70000),(4,"Saving",50000),
(5,"Current",35000),(6,"Loan",20000),(7,"Saving",50000),(8,"Saving",90000),(9,"Loan",8000),(10,"Current",45000);

/*Show the cname, Acc_Type, amount information of customer who is having an saving account: */
select Cname,Acc_Type,Amount from Cust_info join Acc_info on Cust_info.C_id=Acc_info.C_id where Acc_Type="Saving";

/*Display the data using Natural, left and right join:*/
select * from Cust_info inner join Acc_info on Cust_info.C_id=Acc_info.C_id;
select * from Cust_info left join Acc_info on Cust_info.C_id=Acc_info.C_id;
select * from Cust_info right join Acc_info on Cust_info.C_id=Acc_info.C_id;

/*Display the information of customers living in the same city as of ‘pooja’: */
select * from Cust_info inner join Acc_info on Cust_info.C_id=Acc_info.C_id where City=(select City from Cust_info where Cname="Pooja");

/*Display the information of account, having less amount than average amount throughout the bank:*/	
select * from Cust_info join Acc_info on Cust_info.C_id=Acc_info.C_id where Amount<(select avg(Amount) from Acc_info);

/*Display the C_id having maximum amount in account:*/	
select Acc_info.C_id from Acc_info where Amount=(select max(Amount) from Acc_info);	

/*Display the amount and acc_type of those customers whose amount is the minimum amount of that
Acc_type:*/
select Acc_Type,Amount from Acc_info where Amount=any(select min(Amount) from Acc_info group by Acc_Type);

/*Display the amount of those accounts whose amount is higher than amount of any saving account amount:*/
select Amount from Acc_info where amount>any(select Amount from Acc_info where Acc_Type="Saving");
