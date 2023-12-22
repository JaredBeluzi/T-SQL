-- 0. What does it do?

/*
This SQL shows how you can insert values manually into a table.
*/


-- 1. Example

INSERT INTO dbo.people (
    name
,   surname
) -- you should mention every column here to avoid issues with the wrong order of columns
VALUES
  ('Peter', 'Arndt')
, ('Luisa', 'Scharafinski')
, ('Robert', 'Ullrich')


-- 2. General

INSERT INTO dbo.table_name (
    column1
,   column2
...
) -- you should mention every column here to avoid issues with the wrong order of columns
VALUES
  ('val1_1', 'val2_1', ...)
, ('val1_2', 'val2_2', ...)
...
