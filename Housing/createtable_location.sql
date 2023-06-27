-- View used because there are no functions in SQLite

-- locations table is the main table (because these are the locations being sold)
-- Because its SQLite we cannot do a check condition on the state abbreviations
	-- Because you cannot use subqueries in a check and no user-defined functions
		-- Okay you can but you have to make them in C first or add an extension
	-- In other Databases this would be easy but still past the course's objectives
-- postal codes include Guam (96910–96932) and others
-- unit numbers can be 127, 103, or "E" - so varchar
-- integer for cost is used because it's same as bigint with SQLite
-- note for smaller values you'd use cents but that makes these huge
	-- if calculations needed then split dollars and cents to different columns

CREATE table if not exists locations (
	location_id integer primary key,
	crime_area integer not null,
	entry_id integer not null,
	school_district integer not null,
	street_address text not null,
	unitnum varchar(10),
	city varchar(50) not null,
	state char(2) not null,
	postalcode varchar(20) not null,
	cost integer,
	status varchar,
	condition integer not null,
	closed boolean default FALSE,
	closeddate text,
	imagefile text,
	FOREIGN KEY (crime_area)
		REFERENCES crimerates(area_id),
	FOREIGN KEY (entry_id)
		REFERENCES entry(entry_id),
	FOREIGN KEY (school_district)
		REFERENCES schools(district_id)
);