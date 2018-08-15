set serveroutput on;
declare
  a1 number:=&a1;
  b2 number:=&b2;
  s number:=0;
begin
  s:=a1+b2;
  dbms_output.put_line('Sum: '||s);
end;

set serveroutput on;
declare 
  a1 number:=&a1;
  b1 number:=&b1;
  c1 number:=&c1;
begin
  if (a1>b1) then
    if (a1>c1) then
        dbms_output.put_line('Largest: '||a1);
    else  
        dbms_output.put_line('Largest: '||c1);
    end if;
  else
    if(b1>c1) then
      dbms_output.put_line('Largest: '||b1);
    else
      dbms_output.put_line('Largest: '||c1);
    end if;
  end if;
end; 

set serveroutput on;
declare 
  f number:=1;
  n number:=&n;
  i number:=1;
begin
  while(i<=n)
  loop
    f:=f*i;
    i:=i+1;
  end loop;
  dbms_output.put_line('Factorial: '||f);
end;  

set serveroutput on;
declare 
  a1 number:=0;
  n number:=&n;
  b1 number:=1;
  i number:=1;
  t number:=0;
begin
  dbms_output.put_line(a1);
  dbms_output.put_line(b1);
  while(i<n-1)
  loop
    t:=b1;
    b1:=a1+b1;
    a1:=t;
    i:=i+1;
    dbms_output.put_line(b1);
  end loop;
end;  






set serveroutput on;
declare
  str1 varchar2(30);
  len number(3);
  str2 varchar2(30);
  i number(3);
begin
  str1:='&str1';
  len:=length(str1);
  for i in reverse 1..len
   loop
    str2:=str2 || substr(str1,i,1);
   end loop;
  if(str1=str2) then
    dbms_output.put_line('Palindrome');
  else
  dbms_output.put_line('Not Palindrome');
  end if;
end;

create table odd1(od number(2));
create table even1(eve number(2));

begin
  for i in 1..50
  loop
    if(mod(i,2)=0) then
      insert into even1 values(i);
    else
      insert into odd1 values(i);
    end if;
  end loop;
end;
  select * from odd1;
  select * from even1;
