-- First statements: create table and then ensure limit is placed on COLUMN
-- If the table exists this will not run due to logic in table
CREATE table if not exists crimerates (
	area_id integer primary key,
  	rate real not null
);

ALTER table crimerates
	MODIFY rate real BETWEEN 1 AND 11;

-- Second statements: creates the schools table in much the same fashion
-- Though, as its a limit of letters, we use the IN operator with CHECK
-- Also, this time we don't modify the table but perform it in the CREATE

CREATE table if not exists schools (
	district_id integer primary key,
	district_name varchar(100),
	grade char(1) not null CHECK (grade in ('A', 'B', 'C', 'D', 'F'))
);