CREATE TABLE MSTONE(
	milestone_id	INTEGER,
	plan_id			INTEGER						NOT NULL,
	times_of_modif	INTEGER			DEFAULT 0 	NOT NULL,
	milestone_desc	VARCHAR2(200),
	weight			INTEGER						NOT NULL,
	status			INTEGER			DEFAULT 0	NOT NULL,  --0, normal, 1, delayed, 
	PRIMARY KEY (milestone_id),
	CONSTRAINT MODIF_MIN CHECK (times_of_modif>=0),
	CONSTRAINT MS_WEIGHT_RANGE CHECK(weight <= 100 AND weight >= 0),
	FOREIGN KEY (plan_id) REFERENCES PLAN (plan_id)
			ON DELETE CASCADE
			INITIALLY DEFERRED DEFERRABLE,
	FOREIGN KEY (status) REFERENCES DICT(dic_id)
);
