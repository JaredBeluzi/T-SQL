-- 0. What does it do?

/*
This SQL shows how to create a pivot table without needing to write down each value that defines a column of the pivot table.
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

-- initiate variables

DECLARE @col_list AS VarChar(Max)
DECLARE @sql AS VarChar(Max)

-- write all distinct values from column diagnosis_year into col_list

SET @col_list = (
SELECT TOP 1 
	diagnosis_year = STUFF(( 
				SELECT DISTINCT   -- only include distinct values
				', '
				,	QUOTENAME(diagnosis_year) -- correct formatting that puts values into []
				FROM dbo.ICD
				FOR XML PATH('')) -- puts all values into a string one after another
				,1,1,'')          -- removes the first comma
FROM dbo.ICD);
-- The result is @col_list = '[2030], [2031]'

-- write dynamic SQL

SET @sql = '
SELECT * 
INTO	dbo.results   -- save results in table
FROM  
(
	SELECT 
		diagnosis_year	-- contains column names for pivot
	,	ICD_group	      -- contains rows
	,	person          -- contains values, that will be aggregated
	FROM	dbo.ICD
) t 
PIVOT(
    COUNT(person) 
    FOR diagnosis_year IN (' + @col_list + ')
	) AS pivot_table
'

-- execute dynamic SQL

EXEC(@sql)

-- The table dbo.results will look like this:
/*
ICD_group    2030    2031
-------------------------
F            2       0
G            1       2
H            0       2
*/


-- 2. General

-- initiate variables

DECLARE @col_list AS VarChar(Max)
DECLARE @sql AS VarChar(Max)

-- write all distinct values from column col1 into col_list

SET @col_list = (
SELECT TOP 1 
	col1 = STUFF(( 
				SELECT DISTINCT   -- only include distinct values
				', '
				,	QUOTENAME(col1) -- correct formatting that puts values into []
				FROM dbo.table_name
				FOR XML PATH('')) -- puts all values into a string one after another
				,1,1,'')          -- removes the first comma
FROM dbo.table_name);

-- write dynamic SQL

SET @sql = '
SELECT * 
INTO	dbo.results 
FROM  
(
	SELECT 
		  col1	-- contains column names for pivot
  	,	col2  -- contains values, that will be aggregated
	  ,	col3	-- contains rows
  	,	col4 
  	, ... -- if you include more columns they will all be used to determine the rows
	FROM	dbo.table_name
) t 
PIVOT(
    COUNT(col2) 
    FOR col1 IN (' + @col_list + ')
	) AS pivot_table
'

-- execute dynamic SQL

EXEC(@sql)
