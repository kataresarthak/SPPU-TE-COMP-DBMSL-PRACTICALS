/*Problem statement:

Write a PL/SQL block of code using parameterized Cursor that will
merge the data available in the newly created table N_RollCall with
the data available in the table O_RollCall. If the data in the first table
already exist in the second table then that data should be skipped.

Queries:
*/
Create table oroll(rno int,name varchar(20),contact int);
Insert into oroll values(1,"qwe",1234),(2,"asd",5678),(3,"zxc",890);
Create table nroll(rno int,name varchar(20),contact int);
Insert into nroll values(1,"qwe",1234),(4,"tyu",1357),(5,"hjk",2468);
DELIMITER %
CREATE PROCEDURE cp1()
BEGIN
    DECLARE exit1 BOOLEAN DEFAULT FALSE;
    DECLARE rno1 INT;
    DECLARE name1 VARCHAR(20);
    DECLARE contactno1 INT;
    DECLARE c1 CURSOR FOR SELECT rno, name, contact FROM nroll;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit1 = TRUE;
    OPEN c1;
    abc: LOOP
        FETCH c1 INTO rno1, name1, contactno1;
        IF exit1 THEN 
            CLOSE c1;
            LEAVE abc;
        END IF;

        IF NOT EXISTS (SELECT * FROM oroll WHERE rno = rno1) THEN
            INSERT INTO oroll VALUES (rno1, name1, contactno1);
        END IF;
    END LOOP abc;
    SELECT * FROM oroll;
END %

DELIMITER ;

CALL cp1();
