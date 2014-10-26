CREATE TABLE PLAN(
	plan_id			INTEGER,
	start_date		DATE		DEFAULT SYSDATE 	NOT NULL,
	end_date		DATE							NOT NULL,
	cur_date		DATE 		DEFAULT SYSDATE,
	PRIMARY KEY (plan_id),
	CONSTRAINT START_MIN CHECK (start_date >= cur_date),
	CONSTRAINT END_MIN CHECK (end_date >= cur_date)
	--CONSTRAINT END_MAX CHECK (end_date <= (select due_date from ASSIGN))
	--CHECK NOT EXISTS (select plan_id 
	--				  from COURSEWORK_PLAN
	--				  where plan_id NOT IN(select plan_id from IS_SCHEDULED))
);
