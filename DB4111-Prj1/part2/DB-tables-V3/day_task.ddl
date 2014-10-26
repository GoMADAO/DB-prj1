CREATE TABLE DAY_TASK(
	task_id			INTEGER,
	plan_id			INTEGER						NOT NULL,
	status			INTEGER			DEFAULT 0	NOT NULL, --0, normal, 1, delayed, 2, in advance
	weight			INTEGER						NOT NULL,
	task_content	VARCHAR2(200),
	spent_time		INTEGER 		DEFAULT 0,
	PRIMARY KEY (task_id),
	CONSTRAINT WEIGHT_RANGE CHECK(weight <= 100 AND weight >= 0),
	CONSTRAINT SPENT_MIN CHECK(spent_time >= 0),
	FOREIGN KEY (plan_id) REFERENCES PLAN (plan_id)
			ON DELETE CASCADE
			INITIALLY DEFERRED DEFERRABLE,
	FOREIGN KEY (status) REFERENCES DICT(dic_id)
);
