Declare

begin 
	sys.dbms_job.submit(:jobnum,'daytask_pro;',sysdate,'sysdate+1');

end;
/
