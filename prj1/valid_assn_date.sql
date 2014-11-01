create or replace trigger valid_assn_date
before insert on is_assn
for each row
begin

	if :new.release_date < sysdate
	and :new.release_date<>:old.release_date
	then 
	RAISE_APPLICATION_ERROR(-20101,'release_date denied');
	elsif  :new.due_date < to_timestamp(:new.release_date,'dd-mm-yy hh:mi:ss') 
	and :new.due_date <> :old.due_date
	then	
	RAISE_APPLICATION_ERROR(-20102,'due_date denied');
	end if;
end;
/
