--------------------------------------------------------
--  File created - Monday-March-16-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View PROJECT_FT_TRAINING_DAYS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SAPTEST"."PROJECT_FT_TRAINING_DAYS" ("EMP_ID", "SNAPSHOT_MONTH", "TRAINING_DAYS_36M") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    s.emp_id,
    s.snapshot_month,
    NVL(
      SUM(
        LEAST(TRUNC(t.to_dt), LAST_DAY(s.snapshot_month))
        - GREATEST(
            TRUNC(t.from_dt),
            ADD_MONTHS(TRUNC(LAST_DAY(s.snapshot_month),'MM'), -36)
          )
        + 1
      ),
      0
    ) AS training_days_36m
FROM project_snap_emp_month s
LEFT JOIN project_training_master t
  ON s.emp_id = t.emp_id
 AND TRUNC(t.from_dt) <= LAST_DAY(s.snapshot_month)
 AND TRUNC(t.to_dt)   >= ADD_MONTHS(TRUNC(LAST_DAY(s.snapshot_month),'MM'), -36)
WHERE s.snapshot_month >= DATE '2021-01-01'
GROUP BY
    s.emp_id,
    s.snapshot_month
;
