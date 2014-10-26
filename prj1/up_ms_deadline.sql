Create or replace trigger up_ms_deadline
before update on mstone
for each row
--when (new.deadline <> old.deadline)

begin
	if updating ('deadline')
	then 
	dbms_output.put_line('Test success');
	:new.times_of_modif := :new.times_of_modif +1;
	--Update mstone
	--   set times_of_modif= times_of_modif+1
  	-- where milestone_id = :new.milestone_id;
	end if;
end;
/
