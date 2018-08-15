create procedure largest (a1 in number,b1 in number,c1 out number)
as
begin
    if (a1>b1) then
        c1:=a1;
    else  
        c1:=b1;
    end if;
end largest; 
set serveroutput on;
declare
  a2 number:=&a2;
  b2 number:=&b2;
  c2 number:=0;
begin  
  largest(a2,b2,c2);
  dbms_output.put_line('Largest: '||c2);
end;
drop procedure largest;

create table empl(eid number(5),nam varchar(6),sal number(6),dep varchar(8),wef date);
insert into empl values(1,'jose',1000,'finance','03-05-16');
insert into empl values(2,'vimal',2000,'hr','11-06-16');
insert into empl values(3,'yadhu',3000,'sales','17-08-16');
insert into empl values(4,'robin',4000,'finance','09-01-16');
insert into empl values(5,'roshin',5000,'hr','07-04-16');

create procedure upda(a1 in out number,b1 in out number)
as 
d date;
begin
  select sysdate into d from DUAL;
  update empl set sal=sal+((sal*b1)/100) where eid=a1;
  update empl set wef=d where eid=a1;

end upda;
  
declare
  a2 number:=&a2;
  a3 number:=&a3;
begin  
  upda(a2,a3);
end;


drop procedure upda;
  