Modification:
1.char -> varchar2
2.foreign key -> NOT NULL
3.coursework, courseworkplan -> Unique
4."{}"-->"()"

CREATE TABLE STUDENT(
	student_id		INTEGER,
	name			VARCHAR2(40)	NOT NULL,
	grade			VARCHAR2(20),
	password		VARCHAR2(20)	NOT NULL,
	PRIMARY KEY (student_id)
);


CREATE TABLE COURSE(
	course_id, 		INTEGER,
	course_name,	VARCHAR2(50)	NOT NULL,
	course_desc,	VARCHAR2(200)	NOT NULL,
	PRIMARY KEY (course_id)
);


CREATE TABLE REGISTER_FOR(
	student_id		INTEGER,
	course_id		INTEGER,
	interval		VARCHAR2(20),
	PRIMARY KEY (student_id, course_id, interval),
	FOREIGN KEY (student_id) REFERENCES STUDENT (student_id),
	FOREIGN KEY (course_id) REFERENCES COURSE (course_id)
);


CREATE TABLE ASSIGN_COURSEWORK(
	coursework_id	INTEGER,
	course_id		INTEGER		NOT NULL,
	release_date	DATE		NOT NULL,
	due_date		DATE		NOT NULL,
	PRIMARY KEY (coursework_id),
	FOREIGN KEY (course_id) REFERENCES COURSE (course_id)
			ON DELETE CASCADE
);


CREATE TABLE COURSEWORK_PLAN(
	plan_id			INTEGER,
	start_date		DATE		NOT NULL,
	end_date		DATE		NOT NULL,
	PRIMARY KEY (plan_id)
);


CREATE TABLE IS_SCHEDULED(
	coursework_id	INTEGER						UNIQUE,
	plan_id			INTEGER						UNIQUE,
	PRIMARY KEY (coursework_id, plan_id),
	FOREIGN KEY (coursework_id) REFERENCES COURSEWORK (coursework_id),
	FOREIGN KEY (plan_id) REFERENCES COURSEWORK_PLAN (plan_id)
);


CREATE TABLE STICKS_TO_DAILY_TASKS(
	task_id			INTEGER,
	plan_id			INTEGER			NOT NULL,
	status			VARCHAR2(10),
	weight			INTEGER			NOT NULL	CONSTRAINT WEIGHT_MAX CHECK(weight <= 100),
	task_content	VARCHAR2(200),
	spent_time		INTEGER,
	PRIMARY KEY (task_id),
	FOREIGN KEY (plan_id) REFERENCES COURSEWORK_PLAN (plan_id)
			ON DELETE CASCADE
);


CREATE TABLE MILESTONE(
	milestone_id	INTEGER,
	plan_id			INTEGER			NOT NULL,
	times_of_modif	INTEGER,
	milestone_desc	VARCHAR2(200),
	weight			INTEGER			NOT NULL	CONSTRAINT WEIGHT_MAX CHECK(weight <= 100),
	PRIMARY KEY (milestone_id),
	FOREIGN KEY (plan_id) REFERENCES COURSEWORK_PLAN (plan_id)
			ON DELETE CASCADE
);


CREATE TABLE CHAPTER(
	course_id		INTEGER,
	chapter_title	VARCHAR2(100),
	PRIMARY KEY (course_id, chapter),
	FOREIGN KEY (course_id) REFERENCES COURSE (course_id)
			ON DELETE CASCADE
);


CREATE TABLE STAFF(
	staff_id		INTEGER,
	name			VARCHAR2(40)	NOT NULL,
	office_hour		VARCHAR2(40),
	office_location	VARCHAR2(40),
	PRIMARY KEY (staff_id)
);


CREATE TABLE PROFESSOR(
	staff_id		INTEGER,
	professor_id	INTEGER,
	concentration	VARCHAR2(200),
	PRIMARY KEY (staff_id),
	FOREIGN KEY (staff_id)	REFERENCES STAFF (staff_id)
			ON DELETE CASCADE
);


CREATE TABLE TA(
	staff_id		INTEGER,
	ta_id			INTEGER,
	PRIMARY KEY (staff_id),
	FOREIGN KEY (staff_id)	REFERENCES STAFF (staff_id)
			ON DELETE CASCADE
);



CREATE TABLE ASSISTS(
	course_id 		INTEGER,
	staff_id 		INTEGER,
	PRIMARY KEY (course_id, staff_id),
	FOREIGN KEY (course_id) REFERENCES COURSE, 
	FOREIGN KEY (staff_id) REFERENCES STAFF
)


CREATE TABLE TEACHES(
	course_id 		INTEGER,
	staff_id 		INTEGER,
	PRIMARY KEY (course_id, staff_id),
	FOREIGN KEY (course_id) REFERENCES COURSE, 
	FOREIGN KEY (staff_id) REFERENCES STAFF
)



