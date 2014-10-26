CREATE TABLE STUDENT(
	student_id		 VARCHAR2(10),                 
	name			 VARCHAR2(40)	                     NOT NULL,
	enroll_interval	 INTEGER			                 NOT NULL, --0, 14fall, 1, 15spring, 2, 15summer, 3, 15fall...	                                                 
	student_type	 INTEGER			                 NOT NULL, --0, undergraduate, 1, master, 2, phd, 3, others                             
	password		 VARCHAR2(20)	Default 'Columbia'   NOT NULL,
	PRIMARY KEY (student_id),
	FOREIGN KEY (enroll_interval) REFERENCES DICT(dic_id)
	--CHECK NOT EXISTS (select student_id 
	--				  from STUDENT
	--				  where student_id NOT IN(select student_id from REGISTER_FOR))
);

