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


-- 3. Hint

-- It is necessary for column_name to not allow NULL values.
-- You can do this with the following SQL

ALTER TABLE table_name
ALTER COLUMN column_name DataType NOT NULL -- DataType should be the same as before
