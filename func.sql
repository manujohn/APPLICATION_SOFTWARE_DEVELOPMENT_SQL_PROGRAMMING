create function factorial (a1 in number)
return number 
as
  f number:=1;
  i number:=1;
begin
  while(i<=a1)
  loop
    f:=f*i;
    i:=i+1;
  end loop;
  return (f);
end; 
set serveroutput on;
declare
  a2 number:=&a2;
  c2 number:=0;
begin  
  c2:=factorial(a2);
  dbms_output.put_line('Factorial: '||c2);
end;

drop function factorial;


select * from sales;
select * from product;


create table product(pid number(5),pname varchar(10),pgrade varchar(3));
insert into product values(1,'HDD','a');
insert into product values(2,'GoPro','a');
insert into product values(3,'laptop','b');
insert into product values(4,'mobile','b');
insert into product values(5,'DVD','c');



create table sales(pid number(5),samount number(10),sdate date,sday varchar(15));
insert into sales values(1,1000,'2-10-2017','Monday');
insert into sales values(3,1500,'4-10-2017','Wednesday');
insert into sales values(3,2000,'5-10-2017','Thursday');
insert into sales values(1,3500,'7-10-2017','Saturday');
insert into sales values(3,4000,'3-10-2017','Tuesday');

create function funct(a1 in number,a2 in number,a3 in number)
  return number
  as
    b1 number;
    q number;
    z number;
    r number;
    x varchar(10);
    y varchar(10);
  begin
    select pname into x from product where pid=a1;
    select pgrade into y from product where pid=a1;
    dbms_output.put_line('name:'||x);
    dbms_output.put_line('grade:'||y);
    select sum(samount) into q from sales where pid=a2;
    dbms_output.put_line('sum:'||q);
    if(q>a3) then
      update product set pgrade='a' where pid=a2;
    end if;
    select count(pid) into z from sales where pid=a2;
    if(z<1) then
      r:=0;
    else
      r:=1;
    end if;
    return(r);
end;
set serveroutput on;
declare
  d1 number;
  c1 number;
  e1 number;
  f1 number;
  pnull exception;
begin
d1:=&d1;
c1:=&c1;
e1:=&e1;
f1:=funct(d1,c1,e1);
if f1=0 then 
 raise pnull;
end if;
exception
  when pnull then
    dbms_output.put_line('no sales corresponding to this pid:');
  when no_data_found then
     dbms_output.put_line('no data found:');
end;

drop function funct;

