-- 0. What does it do?

/*
This SQL checks if a table (with a certain column) exists and only if that is the case, some SQL will be executed.
*/


-- 1. Example

IF EXISTS(
		SELECT o.* 
		FROM 		      sys.objects AS o
		INNER JOIN		sys.columns AS c -- remove join if you only want to check if a table exists
			ON	o.object_ID = c.object_ID
 		WHERE o.Name = 'ST_HelicDynamic'
		AND	  c.Name = 'HelicDynamic_Status') -- remove if you only want to check if a table exists

BEGIN

/*
Put SQL here, that shall be executed, if the table ST_HelicDynamic (with the column HelicDynamic_Status) exists.
*/

END

  
-- 2. General

IF EXISTS(
		SELECT o.* 
		FROM 		      sys.objects AS o
		INNER JOIN		sys.columns AS c -- remove join if you only want to check if a table exists
			ON	o.object_ID = c.object_ID
 		WHERE o.Name = 'table_name'
		AND	  c.Name = 'column_name') -- remove if you only want to check if a table exists

BEGIN

/*
Put SQL here, that shall be executed, if the table table_name (with the column column_name) exists.
*/

END
