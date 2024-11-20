/*Problem statement:
Write a PL/SQL code block to calculate the area of a circle for a value of
radius varying from 5 to 9. Store the radius and the corresponding values
of calculated area in an empty table named areas, consisting of two
columns, radius and area.
*/

create table Circle(radius decimal,area decimal(10,2));
delimiter $
create procedure calarea()
BEGIN
  declare r int;
  declare a decimal(10,2);
  set r=5;
  lp:LOOP
    set a=3.14*r*r;
    insert into Circle values(r,a);
    set r=r+1;
    if(r>9) then
      leave lp;
    END if;
  END LOOP lp;
END$


call calarea()$
select * from Circle$