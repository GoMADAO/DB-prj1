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
