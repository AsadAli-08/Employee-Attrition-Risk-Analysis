--------------------------------------------------------
--  File created - Monday-March-16-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View PROJECT_FT_POS_CHNG_COUNT
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SAPTEST"."PROJECT_FT_POS_CHNG_COUNT" ("EMP_ID", "SNAPSHOT_MONTH", "POS_CHNG_COUNT") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  WITH pos_chng_event AS (
    SELECT 
        emp_id,
        from_dt,
        position,
        CASE
            WHEN LAG(position) OVER (PARTITION BY emp_id ORDER BY from_dt) IS NULL THEN 0
            WHEN LAG(position) OVER (PARTITION BY emp_id ORDER BY from_dt) <> position THEN 1
            ELSE 0
        END AS pos_chng_flag
    FROM project_position_master
)
SELECT
    s.emp_id,
    s.snapshot_month,
    NVL(SUM(
        CASE
            WHEN e.pos_chng_flag = 1
             AND e.from_dt <= LAST_DAY(s.snapshot_month)
             AND e.from_dt > ADD_MONTHS(LAST_DAY(s.snapshot_month), -36)
            THEN 1 ELSE 0
        END
    ), 0) AS pos_chng_count
FROM project_snap_emp_month s
LEFT outer JOIN pos_chng_event e
    ON s.emp_id = e.emp_id
where s.snapshot_month >= DATE '2021-01-01'
GROUP BY
    s.emp_id, s.snapshot_month
;
