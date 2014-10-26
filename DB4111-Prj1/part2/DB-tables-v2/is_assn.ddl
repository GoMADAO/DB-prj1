CREATE TABLE IS_ASSN(
	coursework_id	INTEGER,
	course_id		INTEGER		    				         NOT NULL,
	release_date	DATE		    DEFAULT SYSDATE          NOT NULL,
	due_date		TIMESTAMP(0)     				         NOT NULL,
	cur_date		DATE		    DEFAULT SYSDATE,
	cur_time		TIMESTAMP(0)    DEFAULT SYSTIMESTAMP(0),
	PRIMARY KEY (coursework_id),
	FOREIGN KEY (course_id) REFERENCES COURSE (course_id)
			ON DELETE CASCADE
			INITIALLY DEFERRED DEFERRABLE,
	CONSTRAINT RELEASE_MIN CHECK (release_date >= cur_date),
	CONSTRAINT DUE_MIN CHECK (due_date >= cur_time)
);
