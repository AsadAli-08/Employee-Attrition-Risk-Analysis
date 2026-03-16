--------------------------------------------------------
--  File created - Monday-March-16-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View PROJECT_FT_INCENTIVE_VOLATILITY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SAPTEST"."PROJECT_FT_INCENTIVE_VOLATILITY" ("EMP_ID", "SNAPSHOT_MONTH", "INCENTIVE_VOLATILITY") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  WITH incentive_month_wise AS (
    SELECT 
        s.emp_id,
        s.snapshot_month,
        NVL(SUM(i.amount), 0) AS amount
    FROM project_snap_emp_month s
    LEFT OUTER JOIN project_incentive_master i
        ON s.emp_id = i.emp_id
       AND i.from_dt >= TRUNC(s.snapshot_month, 'MM')
       AND i.from_dt <= LAST_DAY(s.snapshot_month)
    GROUP BY
        s.emp_id,
        s.snapshot_month
)
SELECT
    emp_id,
    snapshot_month,
    round( STDDEV(amount) OVER (
        PARTITION BY emp_id
        ORDER BY snapshot_month
        ROWS BETWEEN 35 PRECEDING AND CURRENT ROW
    ),2) AS incentive_volatility
FROM incentive_month_wise
WHERE snapshot_month > DATE '2021-01-01'
;
