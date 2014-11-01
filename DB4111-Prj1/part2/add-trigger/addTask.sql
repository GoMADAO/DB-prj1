create or replace trigger addTask 
before insert on day_task
for each row  
begin  
select taskSeq.nextval into :new.task_id from dual;  
end;
/