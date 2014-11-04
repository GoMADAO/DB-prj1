create or replace function getPlanseq
return number is
pid number;

begin
select planseq.currval
into pid
from dual;
return pid;

end;
/
