Create or replace trigger in_plan
After insert on plan
For each row

begin
	Insert into mstone (milestone_id,plan_id,weight,deadline)
	select floor(dbms_random.value(0,99999999))
	      ,:new.plan_id
	      ,100
 	      ,:new.end_date
	  from dual;
	dbms_output.put_line('insert mstone');
	Insert into day_task(task_id, plan_id, weight,task_date)
	select floor(dbms_random.value(0,99999999))
	      ,:new.plan_id
	      ,0
  	      ,:new.start_date
	  from dual;
 	dbms_output.put_line('insert day_task');
end;
/
