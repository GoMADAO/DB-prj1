create or replace trigger valid_mstone_date
before insert or update on mstone
for each row
when (new.deadline <> old.deadline)

declare
	v_stdate plan.start_date%type;
	v_eddate plan.end_date%type;

begin
	Select start_date, end_date
	  into v_stdate,v_eddate
	  from plan
	 where plan.plan_id = :new.plan_id;
	--dbms_output.put_line(v_stdate);
	--dbms_output.put_line(v_eddate);
	if :new.deadline> v_eddate or :new.deadline < v_stdate
	then
	RAISE_APPLICATION_ERROR(-20105,'deadline denied');
	end if;
end;
/
