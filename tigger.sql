create table patient(pid number(10),pname varchar(10),addr varchar(15));
insert into patient values(1,'abc','abc1');
insert into patient values(2,'xyz','xyz1');
insert into patient values(3,'lmn','lmn1');
insert into patient values(4,'qwe','qwe1');
drop table patient;

create table pdetails(pid number(10),dep varchar(10),dname varchar(10),adate date);
insert into pdetails values(1,'dep1','doc1','01-10-2017');
insert into pdetails values(2,'dep2','doc2','02-11-2017');
insert into pdetails values(3,'dep3','doc3','05-02-2017');
insert into pdetails values(4,'dep4','doc4','08-07-2017');


create table pbill(pid number(10),ddate date,amountp number(10));
insert into pbill values(1,'01-11-2017',10000);
insert into pbill values(2,'02-12-2017',20000);
insert into pbill values(3,'04-08-2017',30000);
insert into pbill values(4,'03-01-2017',40000);


create table phistory(pid number(10),pname varchar(10),addr varchar(15),dep varchar(10),dname varchar(10),adate date);


declare
  a1 number(10);
  a6 number(10);
  a7 number(10);
begin  
  a1:=&a1;
  a6:=&a6;
  select amountp into a7 from pbill where pid=a1;
  if a7<=a6 then
      delete from pdetails where pid=a1;
      delete from pbill where pid=a1;

  else
      dbms_output.put_line('Cannot discharge');
  end if;
  
end;

drop trigger t1;

create or replace trigger t1
after delete on pdetails
for each row
declare
  a2 varchar(15);
  a3 varchar(15);
begin
      select addr into a2 from patient where pid= (:old.pid); 
      select pname into a3 from patient where pid= (:old.pid);
      insert into phistory(pid,dep,dname,adate) values(:old.pid,:old.dep,:old.dname,:old.adate);
      update  phistory set addr=a2 where pid= (:old.pid);
      update  phistory set pname=a3 where pid= (:old.pid);

end;

drop table phistory; 
select * from phistory;
select * from pdetails;
select * from pbill;
drop table phistory;