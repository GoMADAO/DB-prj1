create or replace procedure daytask_pro
is
	vplan_id 	plan.plan_id%type;
	vmax_weight 	day_task.weight%type;
	vdue_date 	is_assn.due_date%type;

Cursor csr_daytask is
 select s.plan_id as plan_id
 ,case when day.weight is null then 0 else day.weight end as max_weight
 ,a.due_date as due_date
 from is_sche s
 left join ( 
        select d.plan_id, max(d.weight) as weight
          from day_task d
        where d.task_date<sysdate  
         group by d.plan_id
        ) day   
 on day.plan_id = s.plan_id
 left join is_assn a
 on s.coursework_id = a.coursework_id
left join day_task t
 on t.plan_id = s.plan_id
 where sysdate<a.due_date
and (day.weight < 100
     or day.weight is null)
and t.task_id is null
   --and day.weight is null
 order by s.plan_id asc;
begin 
	open csr_daytask;
	loop
		fetch csr_daytask into vplan_id,vmax_weight,vdue_date;
		exit when csr_daytask%NOTFOUND;
		dbms_output.put_line(vdue_date);
		insert into day_task(plan_id,weight)
		values (vplan_id, vmax_weight);
	end loop;
	close csr_daytask; 
end;
/
