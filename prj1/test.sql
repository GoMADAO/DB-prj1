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
where sysdate<a.due_date
--and day.weight is null
order by s.plan_id asc
;

