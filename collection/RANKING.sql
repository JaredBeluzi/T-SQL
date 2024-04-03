-- 0. What does it do?

/*
This SQL allows you to rank a column_1 for each value of a column_2 and returns only the values of column_1 with the highest rank.
This concept can be relaxed if necessary.
Application examples:
- find the last address for each person
- find the most important ingredient for each dish
- find the last 3 recipients of payments for each customer in a bank
*/


-- 1. Example

SELECT
	SUB.Unternehmen_ID
,	SUB.Unternehmen_Bezeichnung
,	SUB.Person_ID
,	SUB.Person_Vorname
,	SUB.Person_Nachname
INTO	dbo.längster_Mitarbeiter
FROM
(
SELECT 
	Unternehmen.Unternehmen_ID
	Unternehmen.Bezeichnung AS Unternehmen_Bezeichnung
,	Unternehmen.Person_ID
,	Person.Vorname AS Person_Vorname
,	Person.Nachname AS Person_Nachname
,	RANK() OVER ( PARTITION BY Unternehmen.Unternehmen_ID ORDER BY 	
        	Person.Beitrittsdatum ASC
	,	Person.Kündigungsdatum DESC
	,	Person.Hierarchie DESC
	,	Person.Person_ID DESC) AS RANKING
	-- try to use as many meaningful columns to rank
	-- as last step use a column that ensures the uniqueness of rank 1 (often an ID col)	
FROM dbo.Unternehmen AS Unternehmen
INNER JOIN	dbo.Person AS Person
	ON	Unternehmen.Unternehmen_ID = Person.Unternehmen_ID
WHERE Person.StornoKZ = 0
) AS SUB
WHERE SUB.RANKING = 1
