create or replace trigger addProf
before insert on prof
for each row  
begin  
select profSeq.nextval into :new.professor_id from dual;  
end;
/