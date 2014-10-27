Create or replace trigger valid_plan_date
before insert or update on plan
for each row
when ((new.start_date <> old.start_date) or (new.end_date <> old.end_date))
declare
	v_rdate is_assn.release_date%type;
	v_ddate date;
begin
	Select A.release_date, A.due_date
	  into v_rdate, v_ddate
	  from is_assn A
	  join is_sche S
	    on A.coursework_id = S.coursework_id
	 where S.plan_id = :new.plan_id;
	dbms_output.put_line(v_rdate);
	dbms_output.put_line(v_ddate);

	if :new.start_date < v_rdate or :new.start_date>:new.end_date
	then
		RAISE_APPLICATION_ERROR(-20103,'start_date denied');
	end if;
	if :new.end_date > v_ddate or :new.end_date < :new.start_date
	then
		RAISE_APPLICATION_ERROR(-20104,'end_date denied');
	end if;
end;
/
