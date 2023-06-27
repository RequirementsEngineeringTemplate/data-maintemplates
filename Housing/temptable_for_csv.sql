-- temp table to hold csv file data
-- to then add to actual table

-- foreign keys and image files are dummies right now
-- hence, why no update or insert conditions set yet
create table temphousing (
	idx integer primary key,
	created text,
	cost integer,
	beds integer,
	baths integer,
	streetadd text,
	city varchar,
	zipcode varchar,
	sqft integer,
	condition integer,
	arearank integer,
	crimerates integer,
	schools integer,
	imagefile text
);