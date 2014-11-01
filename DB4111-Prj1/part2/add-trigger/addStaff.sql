create or replace trigger addStaff
before insert on staff
for each row  
begin  
select staffSeq.nextval into :new.staff_id from dual;  
end;
/