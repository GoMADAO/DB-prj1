Create or replace function getMStoneseq
return number is
msid number;

begin
select mstoneseq.currval
 into msid
 from dual;
dbms_output.put_line(msid);
return msid;

end;
/
