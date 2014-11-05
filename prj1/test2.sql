select s.plan_id as plan_id
 ,case when day.weight is null then 0 else day.weight end as max_weight
 , a.due_date as due_date
from (select d.plan_id, max(d.weight) as weight
           from day_task d
         where d.task_date<sysdate
          group by d.plan_id
) day
left join is_sche s
on day.plan_id = s.plan_id
left join is_assn a
on s.coursework_id = a.coursework_id
left join (select plan_id, task_id
		from day_task
	 where task_date>sysdate-1) t
on t.plan_id = s.plan_id
where sysdate<a.due_date
and (day.weight < 100
     or day.weight is null)
and t.task_id is null
;
