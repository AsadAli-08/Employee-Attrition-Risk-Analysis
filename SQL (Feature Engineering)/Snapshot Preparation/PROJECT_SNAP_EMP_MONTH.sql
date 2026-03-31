--------------------------------------------------------
--  File created - Monday-March-16-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View PROJECT_SNAP_EMP_MONTH
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SAPTEST"."PROJECT_SNAP_EMP_MONTH" ("EMP_ID", "SNAPSHOT_MONTH") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  WITH months AS (
    SELECT ADD_MONTHS(DATE '2018-01-01', LEVEL - 1) AS snapshot_month
    FROM dual
    CONNECT BY ADD_MONTHS(DATE '2018-01-01', LEVEL - 1) <= DATE '2025-12-01'
)
SELECT
    e.emp_id,
    m.snapshot_month
FROM project_emp_master e
CROSS JOIN months m
where 
    e.doj <= last_day(m.snapshot_month)
    and e.dor > last_day(m.snapshot_month)
;
