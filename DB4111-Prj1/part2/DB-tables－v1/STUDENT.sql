CREATE TABLE STUDENT(
	student_id		INTEGER,
	name			VARCHAR2(40)	NOT NULL,
	enroll_interval	INTEGER			NOT NULL,
	--0, 14fall, 1, 15spring, 2, 15summer, 3, 15fall...
	student_type	INTEGER			NOT NULL,
	--0, undergraduate, 1, master, 2, phd, 3, others
	password		VARCHAR2(20)	NOT NULL,
	PRIMARY KEY (student_id)
	--CHECK NOT EXISTS (select student_id 
	--				  from STUDENT
	--				  where student_id NOT IN(select student_id from REGISTER_FOR))
);
