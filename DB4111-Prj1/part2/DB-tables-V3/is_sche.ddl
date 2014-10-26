CREATE TABLE IS_SCHE(
	coursework_id	INTEGER			UNIQUE,
	plan_id			INTEGER			UNIQUE,
	PRIMARY KEY (coursework_id, plan_id),
	FOREIGN KEY (coursework_id) REFERENCES IS_ASSN (coursework_id),
	FOREIGN KEY (plan_id) REFERENCES PLAN (plan_id)
);
