create table deppt(deptno varchar(20) primary key,deptname varchar(20),staffno varchar(20));
insert into deppt values('d1','cs','s101');
insert into deppt values('d2','ec','s110');
insert into deppt values('d1','ee','s201');
create table boooks(title varchar(20) primary key,author varchar(20));
insert into boooks values('dbms','navathe');
insert into boooks values('c','dennis richie');
insert into boooks values('dbms','korth');
create table librar(title varchar(20) references books(title),author varchar(20),noc number(10));
insert into librar values('c','dennis richie',5);
insert into librar values('dbms','navathe',10);
insert into librar values('os','korth',20);
alter table librar modify(primary key(title,author));
delete from librar;
create table s1(rollno number(10) primary key,sname varchar(20),dnum number(20) );
drop table s1;
create table s(rollno number(10) primary key,sname varchar(20),dnum varchar(20) references deppt(deptno));
insert into s values(10,'aswathy','d1');
insert into s values(20,'akash','d3');
insert into s values(30,'arun','d2');
insert into books values(' ','navathe');
select * from deppt;
create table accnt(accno number(10) primary key,amount number(10) check (amount>250));
insert into accnt values(147,1000);
insert into accnt values(210,5000);
insert into accnt values(777,100);
insert into accnt values(623,5001);
drop table accnt;
create table accntt(accno number(10) primary key,amount number(10) check (amount>250));
insert into accntt values(147,1000);
insert into accntt values(210,5000);
insert into accntt values(777,100);
insert into accntt values(623,5001);










