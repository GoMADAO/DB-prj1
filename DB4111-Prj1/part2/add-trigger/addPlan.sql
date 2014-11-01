create or replace trigger addPlan 
before insert on plan
for each row  
begin  
select planSeq.nextval into :new.plan_id from dual;  
end;
/