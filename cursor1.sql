create table sm(sname varchar(10),am number(7),mont varchar(7));
insert into sm values('abc',10000,'aug');
insert into sm values('def',12000,'sep');
insert into sm values('ghi',8000,'oct');
insert into sm values('jkl',6000,'sep');
insert into sm values('mno',20000,'oct');
select * from sm;
drop table sm;
set serveroutput on;
declare 
  cursor c1 is select * from sm;
  a1 sm%rowtype;
  co number;
  d varchar(4);
begin
  open c1;
    select to_char(sysdate,'mon') into d from DUAL;
      loop
      fetch c1 into a1.sname,a1.am,a1.mont;
      exit when c1%NOTFOUND;
      if a1.mont=d then
        if a1.am<=10000 then
          co:=a1.am/10;
        else
          co:=(a1.am/10)*2;  
        end if;
      else
          co:=0;
      end if; 
    dbms_output.put_line('Name '||a1.sname);
    dbms_output.put_line('Commision '||co);
    end loop;
  close c1;
 end; 