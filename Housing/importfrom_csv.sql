-- Locations will be built from this temp table made to hold imported csv files
-- See png of import statements used here (which is .mode & .import with sqlite3 tools)

INSERT INTO locations
	SELECT t.idx, t.crimerates,1+t.idx,t.schools, 
		   t.streetadd,'',t.city,'IL',t.zipcode,
		   t.cost,'on market',t.condition,
		   FALSE,'',t.imagefile,t.beds,t.baths,t.sqft
	FROM temphousing t;
	
DROP TABLE temphousing;