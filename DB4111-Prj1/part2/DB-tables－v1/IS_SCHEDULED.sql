CREATE TABLE IS_SCHEDULED(
	coursework_id	INTEGER			UNIQUE,
	plan_id			INTEGER			UNIQUE,
	PRIMARY KEY (coursework_id, plan_id),
	FOREIGN KEY (coursework_id) REFERENCES ASSIGN (coursework_id),
	FOREIGN KEY (plan_id) REFERENCES COURSEWORK_PLAN (plan_id)
);