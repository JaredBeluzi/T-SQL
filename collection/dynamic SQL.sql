-- 0. What does it do?
/*
This SQL shows how to create dynamic SQLs, i.e. executing SQL that depends on a value that can change on every execution.
This is often done by using variables inside the SQL that gets executed by the function EXEC().
*/


-- 1. Example

-- The variable @max_date contains the maximum of control_date in dbo.ES_51860 plus 30 days
-- This value can change on every execution of this SQL
DECLARE	@max_date AS DateTime
SELECT @max_date = DATEADD(day, 30, MAX(control_Date))
FROM	dbo.ES_51860

DECLARE @sql VarChar(Max) -- create Text Variable
SET @sql =  -- fill Text Variable with code, that you want to execute
'
SELECT *
INTO dbo.ES_1010
FROM dbo.ST_vz
WHERE pay_date <= ' + @max_date + '
'

EXEC(@sql) -- execute code

  
-- 2. General

-- in general you want to replace some parts of the text in @sql with values from variables (or other text-producing SQL-snippets)

DECLARE @sql_part1
DECLARE @sql_part2
...

SET @sql_part1 = ... -- Determine value of variable
SET @sql_part2 = ... -- Determine value of variable
...

-- replace parts of code in @sql with variables 
DECLARE @sql VarChar(Max) -- create Text Variable
SET @sql =  -- fill Text Variable with code, that you want to execute
'
SELECT 
...
... ' + sql_part1 + '
... ' + sql_part2 + '
...
'

EXEC(@sql) -- execute code
