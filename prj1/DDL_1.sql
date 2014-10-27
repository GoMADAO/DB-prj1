Modification:
1.char -> varchar2
2.foreign key -> NOT NULL
3.coursework, courseworkplan -> Unique
4."{}"-->"()"

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

CREATE TABLE COURSE(
	course_id 		INTEGER,
	course_name		VARCHAR2(50)	NOT NULL,
	course_desc		VARCHAR2(800),
	PRIMARY KEY (course_id)
	--CHECK NOT EXISTS (select course_id 
	--				  from COURSE
	--				  where course_id NOT IN(select course_id from TEACHES))
);

CREATE TABLE REG_FOR(
	student_id		VARCHAR2(10),
	course_id		INTEGER,
	reg_interval	INTEGER,
	PRIMARY KEY (student_id, course_id, reg_interval),
	FOREIGN KEY (student_id) REFERENCES STUDENT (student_id),
	FOREIGN KEY (course_id) REFERENCES COURSE (course_id),
	FOREIGN KEY (reg_interval) REFERENCES DICT (dic_id)
);

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

CREATE TABLE PLAN(
	plan_id		INTEGER,
	start_date	DATE		DEFAULT SYSDATE 	NOT NULL,
	end_date	DATE					NOT NULL,
	turn_on		INTEGER,
	PRIMARY KEY (plan_id),
	FOREIGN KEY (turn_on)	REFERENCES DICT(dic_id)
	--CONSTRAINT END_MAX CHECK (end_date <= (select due_date from ASSIGN))
	--CHECK NOT EXISTS (select plan_id 
	--		 from COURSEWORK_PLAN
	--	 where plan_id NOT IN(select plan_id from IS_SCHEDULED))
);

CREATE TABLE IS_SCHE(
	coursework_id	INTEGER			UNIQUE,
	plan_id			INTEGER			UNIQUE,
	PRIMARY KEY (coursework_id, plan_id),
	FOREIGN KEY (coursework_id) REFERENCES IS_ASSN (coursework_id),
	FOREIGN KEY (plan_id) REFERENCES PLAN (plan_id)
);

CREATE TABLE DAY_TASK(
	task_id			INTEGER,
	plan_id			INTEGER						NOT NULL,
	status			INTEGER			DEFAULT 60	NOT NULL, --0, normal, 1, delayed, 2, in advance
	weight			INTEGER						NOT NULL,
	task_content	VARCHAR2(200),
	spent_time		INTEGER 		DEFAULT 0,
	task_date		DATE			DEFAULT SYSDATE		NOT NULL, --Not check >stdate <enddate, in order to store info that expire the enddate but not reach duedate
	PRIMARY KEY (task_id),
	CONSTRAINT WEIGHT_RANGE CHECK(weight <= 100 AND weight >= 0),
	CONSTRAINT SPENT_MIN CHECK(spent_time >= 0),
	FOREIGN KEY (plan_id) REFERENCES PLAN (plan_id)
			ON DELETE CASCADE
			INITIALLY DEFERRED DEFERRABLE,
	FOREIGN KEY (status) REFERENCES DICT(dic_id)
);
CREATE TABLE MSTONE(
	milestone_id	INTEGER,
	plan_id		INTEGER				NOT NULL,
	times_of_modif	INTEGER		DEFAULT 0 	NOT NULL,
	milestone_desc	VARCHAR2(200),
	weight		INTEGER				NOT NULL,
	status		INTEGER		DEFAULT 62	NOT NULL,  --0, normal, 1, delayed, 
	deadline	DATE				NOT NULL,
	PRIMARY KEY (milestone_id),
	CONSTRAINT MODIF_MIN CHECK (times_of_modif>=0),
	CONSTRAINT MS_WEIGHT_RANGE CHECK(weight <= 100 AND weight >= 0),
	FOREIGN KEY (plan_id) REFERENCES PLAN (plan_id)
			ON DELETE CASCADE
			INITIALLY DEFERRED DEFERRABLE,
	FOREIGN KEY (status) REFERENCES DICT(dic_id)
);

CREATE TABLE CHAPTER(
	course_id		INTEGER,
	chapter_title	VARCHAR2(100),
	PRIMARY KEY (course_id, chapter_title),
	FOREIGN KEY (course_id) REFERENCES COURSE (course_id)
			ON DELETE CASCADE
			INITIALLY DEFERRED DEFERRABLE
);

CREATE TABLE STAFF(
	staff_id		INTEGER,
	name			VARCHAR2(40)	NOT NULL,
	office_hour		VARCHAR2(40)	NOT NULL,
	office_location	VARCHAR2(200)	NOT NULL,
	PRIMARY KEY (staff_id)
);

CREATE TABLE PROF(
	staff_id		INTEGER,
	professor_id	INTEGER				NOT NULL,
	concentration	VARCHAR2(400),
	PRIMARY KEY (staff_id),
	FOREIGN KEY (staff_id)	REFERENCES STAFF (staff_id)
			ON DELETE CASCADE
			INITIALLY DEFERRED DEFERRABLE
);

CREATE TABLE TA(
	staff_id		INTEGER,
	ta_id			INTEGER		NOT NULL,
	PRIMARY KEY (staff_id),
	--CHECK NOT EXISTS (select staff_id 
	--				  from TA
	--				  where staff_id NOT IN(select staff_id from ASSISTS))
	FOREIGN KEY (staff_id)	REFERENCES STAFF (staff_id)
			ON DELETE CASCADE
			INITIALLY DEFERRED DEFERRABLE
);

CREATE TABLE TEACHES(
	course_id 		INTEGER,
	staff_id 		INTEGER,
	PRIMARY KEY (course_id, staff_id),
	FOREIGN KEY (course_id) REFERENCES COURSE(course_id), 
	FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id)
);

CREATE TABLE ASSISTS(
	course_id 		INTEGER,
	staff_id 		INTEGER,
	PRIMARY KEY (course_id, staff_id),
	FOREIGN KEY (course_id) REFERENCES COURSE(course_id), 
	FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id)
);





__________________________
Trigger
create or replace trigger valid_assn_date
before insert on is_assn
for each row
begin

	if :new.release_date < sysdate 
	then 
	RAISE_APPLICATION_ERROR(-20101,'release_date denied');
	elsif  :new.due_date < to_timestamp(:new.release_date,'dd-mm-yy hh:mi:ss')
	then	
	RAISE_APPLICATION_ERROR(-20102,'due_date denied');
	end if;
end;
/


create or replace trigger valid_mstone_date
before insert on mstone
for each row

begin
	if :new.deadline < sysdate
	then
	RAISE_APPLICATION_ERROR(-20105,'deadline denied');
	end if;
end;
/


Create or replace trigger valid_plan_date
before insert on plan
for each row

begin
	if :new.start_date < sysdate
	then
		RAISE_APPLICATION_ERROR(-20103,'start_date denied');
	elsif :new.end_date < sysdate
	then
		RAISE_APPLICATION_ERROR(-20104,'end_date denied');
	end if;
end;
/

