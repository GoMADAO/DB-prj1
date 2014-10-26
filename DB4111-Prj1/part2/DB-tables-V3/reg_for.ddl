CREATE TABLE REG_FOR(
	student_id		VARCHAR2(10),
	course_id		INTEGER,
	reg_interval	INTEGER,
	PRIMARY KEY (student_id, course_id, reg_interval),
	FOREIGN KEY (student_id) REFERENCES STUDENT (student_id),
	FOREIGN KEY (course_id) REFERENCES COURSE (course_id),
	FOREIGN KEY (reg_interval) REFERENCES DICT (dic_id)
);
