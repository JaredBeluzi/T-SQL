-- 0. What does it do?

/*
This SQL shows how to execute text as SQL.
*/


-- 1. Example

DECLARE @sql VarChar(Max) -- create Text Variable
SET @sql =  -- fill Text Variable with code, that you want to execute
'
SELECT *
INTO dbo.ES_1010
FROM dbo.TT_v
'

EXEC(@sql) -- execute code

  
-- 2. General

DECLARE @sql VarChar(Max) -- create Text Variable
SET @sql =  -- fill Text Variable with code, that you want to execute
'
...
'

EXEC(@sql) -- execute code
