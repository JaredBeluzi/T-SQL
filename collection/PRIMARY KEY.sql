ALTER TABLE dbo.Tabelle
ADD PRIMARY KEY (Spalte)

-- Hinweis: NULL Werte in Spalte sind nicht erlaubt. Das kann man so erreichen:
ALTER TABLE dbo.Tabelle
ALTER COLUMN Spalte Datentyp NOT NULL -- Datentyp sollte derselbe sein wie zuvor
