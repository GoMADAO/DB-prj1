create or replace trigger addTA
before insert on ta
for each row  
begin  
select taSeq.nextval into :new.ta_id from dual;  
end;
/