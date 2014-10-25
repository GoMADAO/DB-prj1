create or replace trigger valid_mstone_date
before insert on mstone
for each row

begin
	if :new.deadline < sysdate
	then
	RAISE_APPLICATION_ERROR(-20105,'deadline denied');
	end if;
end;
/
