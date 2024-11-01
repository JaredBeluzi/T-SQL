
-- Pivottabelle erstellen

/*
Beispieltabelle					Ergebnis
Person        ICD_Gruppe   Diagnose_Jahr        ICD_Gruppe   2030    2031
-----------------------------------------       -------------------------
John          F            2030                 F            2       0
Jack          F            2030                 G            1       2
Josh          G            2030                 H            0       2
Jacob  pear   G            2031
Jacobson      G            2031
Johnson       H            2031
JoJo          H            2031
*/

SELECT
	ICD_Gruppe
,	[2030]
,	[2031]
INTO	dbo.Ergebnis
FROM   
(
	SELECT -- Reihenfolge der Spalten hier ist egal
		Diagnose_Jahr	-- Spaltennamen für Pivottabelle
	,	ICD_Gruppe	-- Zeilen für Pivottabelle
	,	Person          -- Werte, die aggregiert werden
	FROM	dbo.ICD
) t 
PIVOT(
    COUNT(Person) -- man kann hier auch andere Aggregationsfunktionen benutzen
    FOR Diagnose_Jahr IN (
			[2030] -- Man muss jeden Wert in [] schreiben
		,	[2031]
		)
) AS Pivottabelle
