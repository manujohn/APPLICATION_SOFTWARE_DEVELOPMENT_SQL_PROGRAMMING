create table suppli(suid number(3),suname varchar(10),sucom number(10),sucity varchar(10));
insert into suppli values(1,'abc',1000,'abc1');
insert into suppli values(2,'xyz',2000,'xyz1');
insert into suppli values(3,'lmn',1500,'lmn1');
insert into suppli values(4,'qwe',3000,'qwe1');
insert into suppli values(5,'zxc',2500,'zxc1');

drop package body pack_age; 
drop package pack_age; 

create package pack_age as
  procedure alpha(a1 in number,c1 out varchar);
  function beta(a1 in number) return number;

end pack_age;

create package body pack_age as
      procedure alpha(a1 in number,c1 out varchar)
      is
      begin
          select suname into c1 from suppli where suid=a1;
          
      end alpha; 
      function beta(a1 in number)
      return number
      is
      s1 number:=0;
      s2 number;
      begin
      select sucom into s2 from suppli where suid=a1;
      s1:=s2*12;
      return(s1);
      end;
      
end pack_age;
      
      set serveroutput on;
      declare
        a1 number:=&a1;
        c1 varchar(10);
        b1 number:=0;
      begin  
        pack_age.alpha(a1,c1);
        b1 :=pack_age.beta(a1);
        dbms_output.put_line('Name: '||c1);
        dbms_output.put_line('annual com: '||b1);
      end;
