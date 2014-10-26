CREATE TABLE DAILY_TASKS(
	task_id			INTEGER,
	plan_id			INTEGER			NOT NULL,
	status			INTEGER			DEFAULT 0	NOT NULL,
	--0, normal, 1, delayed, 2, in advance
	weight			INTEGER			NOT NULL,
	task_content	VARCHAR2(200),
	spent_time		INTEGER,
	PRIMARY KEY (task_id),
	CONSTRAINT WEIGHT_MAX CHECK(weight <= 100),
	CONSTRAINT WEIGHT_MIN CHECK(weight >= 0),
	CONSTRAINT SPENT_MIN CHECK(spent_time >= 0),
	FOREIGN KEY (plan_id) REFERENCES COURSEWORK_PLAN (plan_id)
			ON DELETE CASCADE,
	FOREIGN KEY (status) REFERENCES DICT(dic_id)
);