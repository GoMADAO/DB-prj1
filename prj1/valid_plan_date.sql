Create or replace trigger valid_plan_date
before insert on plan
for each row

begin
	if :new.start_date < sysdate
	then
		RAISE_APPLICATION_ERROR(-20103,'start_date denied');
	elsif :new.end_date < sysdate
	then
		RAISE_APPLICATION_ERROR(-20104,'end_date denied');
	end if;
end;
/
