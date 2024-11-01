
-- Code fügt manuell Zeilen in Tabelle hinzu

INSERT INTO dbo.Namen (
    Vorname
,   Nachname
) -- Hier oben alle Spalten explizit nennen. Sonst kann Spaltenreihenfolge durcheinander kommen beim Befüllen der Spalten.
VALUES
  ('Peter', 'Arndt')
, ('Luisa', 'Scharafinski')
, ('Robert', 'Ullrich')
