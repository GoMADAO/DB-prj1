CREATE TABLE TEACHES(
	course_id 		INTEGER,
	staff_id 		INTEGER,
	PRIMARY KEY (course_id, staff_id),
	FOREIGN KEY (course_id) REFERENCES COURSE(course_id), 
	FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id)
);