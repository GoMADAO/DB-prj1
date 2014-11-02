Declare
	
begin 
	sys.dbms_job.submit(:job,'daytask_pro;',sysdate,'sysdate+1/(24)');

end;
/
