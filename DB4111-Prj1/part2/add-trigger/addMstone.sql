create or replace trigger addMstone  
before insert on mstone 
for each row  
begin  
select mstoneSeq.nextval into :new.milestone_id from dual;  
end;
/