-- 0. What does it do?

/*
This SQL moves values forward or backward within a partition.
*/


-- 1. Example

-- Suppose we have a table dbo.Test like this
/*
date        value_col
---------------------
2020-01-01  1
2020-01-02  2
2020-01-03  3
2020-01-04  4
*/
-- Then the following SQL has the lower table as output
SELECT
	date
, value_col
,	LAG(value_col, 1,0) OVER (ORDER BY date ASC) As value_col_lag -- 1 is step size and 0 is standard value, that replaces NULL values
,	LAG(value_col, 1,0) OVER (ORDER BY date ASC) As value_col_lag -- 1 is step size and 0 is standard value, that replaces NULL values
FROM	dbo.Test
/*
date        value_col  value_col_lag  value_col_lead
----------------------------------------------------
2020-01-01  1          0              2
2020-01-02  2          1              3
2020-01-03  3          2              4
2020-01-04  4          3              0
*/


  
-- 2. General

SELECT
	date
, col1
,	LAG(scalar_function(col1), [step_size], [standard_value]) OVER (PARTITION BY col2 ORDER BY date ASC) As col1_lag
,	LEAD(scalar_function(col1), [step_size], [standard_value]) OVER (PARTITION BY col2 ORDER BY date ASC) As col1_lead
FROM	dbo.table_name
