create table student(rolno number(2),sname varchar(10),address char(15),phno number,gender char(1),branch char(3),mark1 number(3),mark2 number(3));
desc student;
alter table student add(tmark number(3));
alter table student modify(address char(20));
alter table student drop(gender,branch);
alter table student rename column mark1 to m1;
alter table student rename to student1;
drop table student1;

create table student(rolno number(2),sname varchar(10),address char(15),gender char(1),branch char(3),mark1 number(3),mark2 number(3));
desc student;
INSERT INTO STUDENT VALUES (1, 'abc', 'Mel', 'm', 'cse',26,30);
INSERT INTO STUDENT VALUES (11, 'xyz', 'Sca', 'f', 'ece',29,35);
INSERT INTO STUDENT VALUES (22, 'qwe', 'Bli', 'm', 'cse',20,21);
INSERT INTO STUDENT VALUES (3, 'zxc', 'Who', 'f', 'ece',28,33);
INSERT INTO STUDENT VALUES (4, 'lmn', 'poi', 'm', 'cse',22,20);
select * from student;
select sname,address from student;
select sname,mark1,mark2 from student where rolno=11;
select sname from student where mark1 between 25 and 50;
select * from student where sname like 'a%';
select branch,avg(mark1),avg(mark2) from student group by branch;
select sname,branch from student where gender='m';
update student set mark1=50 where mark1>45;
delete from student where mark2<21;
select branch,avg(mark1),avg(mark2) from student group by BRANCH having avg(mark1)>25 and avg(mark2)>25;
drop table student;