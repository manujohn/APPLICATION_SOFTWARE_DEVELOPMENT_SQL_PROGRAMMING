create table student1(regno number(1),sname varchar(10),m1 number(3),m2 number(3),m3 number(3));
insert into student1 values(1,'kavya',45,42,44);
insert into student1 values(2,'arun',12,40,41);
insert into student1 values(3,'linju',35,45,49);
insert into student1 values(4,'nithya',30,12,45);
insert into student1 values(5,'kiran',40,42,47);
create table pass(regno number(1),sname varchar(10),m1 number(3),m2 number(3),m3 number(3));
create table fail(regno number(1),sname varchar(10),m1 number(3),m2 number(3),m3 number(3));
set serveroutput on;
declare 
  cursor c1 is select * from student1;
  a1 student1%rowtype;
  t number;
begin
  open c1;
      loop
      fetch c1 into a1.regno,a1.sname,a1.m1,a1.m2,a1.m3;
      exit when c1%NOTFOUND;
      t:=a1.m1+a1.m2+a1.m3;
      if a1.m1>35 and a1.m2>35 and a1.m3>35 then
        if t>=120 then
          insert into pass values(a1.regno,a1.sname,a1.m1,a1.m2,a1.m3);
        end if;
      else
          insert into fail values(a1.regno,a1.sname,a1.m1,a1.m2,a1.m3);
      end if;
    end loop;
  close c1;
 end; 
 select * from fail;
 select * from pass;
 
