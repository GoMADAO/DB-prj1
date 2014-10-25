CREATE TABLE COURSE(
	course_id 		INTEGER,
	course_name		VARCHAR2(50)	NOT NULL,
	course_desc		VARCHAR2(800),
	PRIMARY KEY (course_id)
	--CHECK NOT EXISTS (select course_id 
	--				  from COURSE
	--				  where course_id NOT IN(select course_id from TEACHES))
);
