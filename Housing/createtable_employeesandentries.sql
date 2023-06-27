-- So this is a smaller example of "linked" tables (many to many, optional)
-- We use it to track what employee made the lastest entry (archives are warehoused)
-- Note, this is simplified for the example: Employees would be a whole different Database
-- phone numbers = varchars because they can be "800-COM-PANY" and other weird things
--      and 24 length to fit '+1-217-555-5555 ext 1234' <= odd things like this

-- As there would be a whole EMPLOYEE MANAGEMENT DB, this is really simplified
CREATE table if not exists employees (
	id integer primary key,
	fname varchar not null,
	lname varchar not null,
	middleinital char(3), 
	-- a letter or NMN = No Middle Name
	-- TODO: consider changing to just 1 char and using "not exists"
	emp_role varchar(50),
	-- role = manager, relator, janitor, it, etc.
	emp_email varchar, 
	-- never stored with server name (@...) & can be null (contractors)
	contact_email varchar not null,
	contact_phone varchar(24) not null,
	contact_add text		
);


-- Now this links (see ERD) to employees and is linked to in our main table
-- Its used to hold the information on each entry to add in backup operations and analysis
-- THIS DOESN'T HELP with redundancy in this instance and may have a small impact on lookup
-- In the full DB it would help with lookup (because you wouldn't have to load whole other DB)
CREATE table if not exists entry (
	entry_id integer primary key,
	emp_id integer not null,
	entry_date text not null,
	last_entrydate text,
	FOREIGN KEY (emp_id)
		REFERENCES employees(id)
);