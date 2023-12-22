-- 0. What does it do?
/*
This SQL creates an empty table with columns.
*/


-- 1. Example

CREATE TABLE dbo.fruits (
    name VarChar(100)
,   price Float
,   primary_color VarChar(20)
)


-- 2. General

CREATE TABLE table_name (
    column1 datatype
,   column2 datatype
,   column3 datatype
   ....
)
