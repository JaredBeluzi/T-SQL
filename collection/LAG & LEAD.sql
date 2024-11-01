
-- Code shiftet eine Spalte (innerhalb einer Partition)

/*
Datum       Wert       Wert_LAG       Wert_LEAD
----------------------------------------------------
2020-01-01  1          0              2
2020-01-02  2          1              3
2020-01-03  3          2              4
2020-01-04  4          3              0
*/

SELECT
	Datum
, 	Wert
,	LAG(Wert, 1,0) OVER (ORDER BY Datum ASC) As Wert_LAG -- 1 ist step size und 0 ist Standardwert, der NULL ersetzt
,	LAG(Wert, 1,0) OVER (ORDER BY Datum ASC) As Wert_LEAD -- 1 ist step size und 0 ist Standardwert, der NULL ersetzt
FROM	dbo.Test
