/*
Problem: Man hat 2 Tabellen, die man nicht 1-1 matchen kann, aber 2-2 oder 3-3 ... 
Dann will man diese Matches trotzdem benutzen. Bsp:

Tabelle "Groß"        Tabelle "klein"     -->      Tabelle "Zuordnung"  
Groß_ID  Groß_Name    klein_ID  klein_Name         Groß_ID  klein_ID
A        Alex         a         Alex               A        a
B        Alex         b         Alex               B        b
C        Max          c         Max                C        c
D        Max          d         Max                D        d

Man weiß hier, dass v und w zu a und b gehören, aber nicht genau wie. Das ist aber auch egal. Man will sie random zuordnen und alle IDs verwenden. Deshalb ist das Ziel hier Tabelle 3.
*/
SELECT
	Groß.Groß_ID
,	klein.klein_ID
,	RANK() OVER ( PARTITION BY Groß.Groß_ID ORDER BY klein.klein_ID ASC) AS klein_RANKING
,	RANK() OVER ( PARTITION BY klein.klein_ID ORDER BY Groß.Groß_ID ASC) AS Groß_RANKING
INTO	  dbo.Zuordnung
FROM		    dbo.Groß AS Groß
INNER JOIN	dbo.klein AS klein
    ON Groß.Groß_Name = klein.klein_Name

DELETE FROM dbo.Zuordnung
WHERE klein_RANKING <> Groß_RANKING

/*
Die Ausgabe vor dem DELETE wäre hier:              und dementsprechend nach dem DELETE:

Tabelle "Zuordnung"                                Tabelle "Zuordnung"
Groß_ID  klein_ID  Groß_RANKING  klein_RANKING     Groß_ID  klein_ID  Groß_RANKING  klein_RANKING
A        a         1             1                 A        a         1             1
A        b         1             2                 B        b         2             2
B        a         2             1                 C        c         1             1
B        b         2             2                 D        d         2             2
C        c         1             1
C        d         1             2
D        c         2             1
D        d         2             2

*/
