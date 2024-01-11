-- 0. What does it do?

/*
This SQL shows how to get the fist day of the week of a date column.
*/


-- 1. Example

SELECT
  payment_date
, DATEADD(WEEK, DATEDIFF(DAY, '01.01.1900', payment_date)/7, '01.01.1900') AS payment_week_begin
FROM dbo.payments


  
-- 2. General

SELECT
  date_col
, DATEADD(WEEK, DATEDIFF(DAY, '01.01.1900', date_col)/7, '01.01.1900') AS week_begin
FROM dbo.[table]
