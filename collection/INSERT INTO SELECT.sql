-- 0. What does it do?

/*
This SQL shows how you can insert values into a table directly from a subquery.
*/


-- 1. Example

INSERT INTO dbo.people_A (
    name
,   surname
) -- you should mention every column here to avoid issues with the wrong order of columns
SELECT 
    p.name
,   n.surname
FROM dbo.people AS p
INNER JOIN  dbo.name AS n
  ON p.ID = n.ID
WHERE LEFT(n.name, 1) = 'A'


-- 2. General

INSERT INTO table_name (
    column1
,   column2
...
) -- you should mention every column here to avoid issues with the wrong order of columns
SELECT 
    column2_1
,   column2_2
...
FROM table_name2
WHERE ...
