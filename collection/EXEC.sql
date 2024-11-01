DECLARE @sql VarChar(Max) -- Textvariable erstellen
SET @sql =  -- Textvariable mit Code füllen, der ausgeführt werden soll
'
SELECT *
INTO dbo.ES_1010
FROM dbo.TT_v
'

EXEC(@sql) -- Code in Textvariable ausführen
