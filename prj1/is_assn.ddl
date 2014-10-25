CREATE TABLE IS_ASSN(
	coursework_id	INTEGER,
	course_id	INTEGER	   		         NOT NULL,
	release_date	DATE      DEFAULT SYSDATE        NOT NULL,
	due_date	TIMESTAMP(0)     	         NOT NULL,
	name		VARCHAR2(40)			 NOT NULL,
	link		VARCHAR2(200),
	PRIMARY KEY (coursework_id),
	FOREIGN KEY (course_id) REFERENCES COURSE (course_id)
			ON DELETE CASCADE
			INITIALLY DEFERRED DEFERRABLE
);
