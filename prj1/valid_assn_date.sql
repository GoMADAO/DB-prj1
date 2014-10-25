create or replace trigger valid_assn_date
before insert on is_assn
for each row
begin

	if :new.release_date < sysdate 
	then 
	RAISE_APPLICATION_ERROR(-20101,'release_date denied');
	elsif  :new.due_date < to_timestamp(:new.release_date,'dd-mm-yy hh:mi:ss')
	then	
	RAISE_APPLICATION_ERROR(-20102,'due_date denied');
	end if;
end;
/
