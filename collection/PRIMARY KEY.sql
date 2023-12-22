-- 0. What does it do?

/*
This SQL creates a Primary Key on a table.
*/


-- 1. Example

ALTER TABLE dbo.fruits
ADD PRIMARY KEY (name)

  
-- 2. General

ALTER TABLE table_name
ADD PRIMARY KEY (column_name)
