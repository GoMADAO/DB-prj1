CREATE TABLE PROFESSOR(
	staff_id		INTEGER,
	professor_id	INTEGER,
	concentration	VARCHAR2(200)	NOT NULL,
	PRIMARY KEY (staff_id),
	FOREIGN KEY (staff_id)	REFERENCES STAFF (staff_id)
			ON DELETE CASCADE
);