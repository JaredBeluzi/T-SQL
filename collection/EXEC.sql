DECLARE @sql VarChar(Max) -- create Text Variable
SET @sql =  -- fill Text Variable with code, that you want to execute
'
SELECT *
INTO dbo.ES_1010
FROM dbo.TT_v
'

EXEC(@sql) -- execute code
