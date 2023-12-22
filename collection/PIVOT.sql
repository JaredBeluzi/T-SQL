-- 0. What does it do?

/*
This SQL shows how to create a pivot table.
*/


-- 1. Example

-- Suppose we have a table dbo.ICD, that looks like this:
/*
person        ICD_group    diagnosis_year    
-----------------------------------------
John          F            2030     
Jack          F            2030
Josh          G            2030
Jacob  pear   G            2031
Jacobson      G            2031
Johnson       H            2031
JoJo          H            2031
*/
-- Then the following SQL will do a pivot on the years 2030, 2031 for each ICD_group

SELECT * FROM   
(
	SELECT -- the order of columns in this select does not matter
		diagnosis_year	-- contains column names for pivot
	,	ICD_group				-- contains rows
	,	person          -- contains values, that will be aggregated
	FROM	dbo.ICD
) t 
PIVOT(
    COUNT(person) -- you can also use different aggregate functions here
    FOR diagnosis_year IN (
			[2030] -- you have to put every value in []
		,	[2031]
		)
) AS pivot_table;

-- The result will look like this:
/*
ICD_group    2030    2031
-------------------------
F            2       0
G            1       2
H            0       2
*/


-- 2. General

SELECT * FROM   
(
	SELECT -- the order of columns in this select does not matter
		col1	-- contains column names for pivot
  ,	col2  -- contains values, that will be aggregated
	,	col3	-- contains rows
  , col4 
  , ... -- if you include more columns they will all be used to determine the rows
	FROM	dbo.table_name
) t 
PIVOT(
    COUNT(col2) -- you can also use different aggregate functions here
    FOR col1 IN (
			[value1] -- you have to put every value in []
		,	[value2]
    , ...      -- you can use more than 2 values
		)
) AS pivot_table;
