Create or replace function getTaskseq
return number is
tid number;

begin
select taskseq.currval
into tid
from dual;
return tid;

end;
/
