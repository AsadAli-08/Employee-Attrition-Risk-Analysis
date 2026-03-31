--------------------------------------------------------
--  File created - Monday-March-16-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View PROJECT_FT_INCENTIVE_SUM
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SAPTEST"."PROJECT_FT_INCENTIVE_SUM" ("EMP_ID", "SNAPSHOT_MONTH", "INCENTIVE_SUM_LAST3Y") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    s.emp_id,
    s.snapshot_month,
    NVL(SUM(i.amount), 0) AS incentive_sum_last3y
FROM project_snap_emp_month s
LEFT OUTER JOIN project_incentive_master i
    ON s.emp_id = i.emp_id
   AND i.from_dt <= LAST_DAY(s.snapshot_month)
   AND i.from_dt >  ADD_MONTHS(LAST_DAY(s.snapshot_month), -36)
WHERE s.snapshot_month > DATE '2021-01-01'
GROUP BY
    s.emp_id,
    s.snapshot_month
;
