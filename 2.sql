create table dept1(deptno varchar(2) primary key,deptname varchar(3),stafno varchar(4));
desc dept1;
INSERT INTO dept1 VALUES('D1','CSE','S101');
INSERT INTO dept1 VALUES('D2','EC','S110');
INSERT INTO dept1 VALUES('D1','EEE','S201');
select * from dept1;

create table books(title varchar(10),author varchar(10),primary key(title));
desc books;
insert into books values('DBMS','Navada');
insert into books values('C','Dennis');
insert into books values('DBMS','Korth');
select * from books;

create table lib(title varchar(10) references books(title),author varchar(10),nocopies number(2));
desc lib;
insert into lib values('C','Dennis',5);
insert into lib values('DBMS','Navada',10);
insert into lib values('OS','Korth',20);
alter table lib modify(primary key(title,author));
select * from lib;

create table s1(rolno number(2) primary key,sname varchar(10),deptno varchar(2),foreign key(deptno) references dept1(deptno));
desc s1;
insert into s1 values(10,'Aswathy','D1');
insert into s1 values(20,'Akash','D3');
insert into s1 values(30,'Arun','D2');
select * from s1;
insert into books(NULL,'Navada');

create table acnt(acntno number(3) primary key,amnt number(4) check (amnt>250));
insert into acnt values(147,1000);
insert into acnt values(210,5000);
insert into acnt values(777,100);
insert into acnt values(623,5001);
select * from acnt;