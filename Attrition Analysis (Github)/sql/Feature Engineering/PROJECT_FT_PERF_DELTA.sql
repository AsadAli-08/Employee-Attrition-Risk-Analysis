--------------------------------------------------------
--  File created - Monday-March-16-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View PROJECT_FT_PERF_DELTA
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SAPTEST"."PROJECT_FT_PERF_DELTA" ("EMP_ID", "SNAPSHOT_MONTH", "CURR_SCORE", "PRV_SCORE", "PERF_DELTA") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  WITH perf_delta AS (
    SELECT
        emp_id,
        from_dt,
        to_dt,
        score,
        LAG(score) OVER (PARTITION BY emp_id ORDER BY from_dt) AS prv_score
    FROM project_perf_master
)
SELECT
    s.emp_id,
    s.snapshot_month,
    p.score AS curr_score,
    p.prv_score,
    NVL(p.score - p.prv_score, 0) AS perf_delta
FROM project_snap_emp_month s
LEFT OUTER JOIN perf_delta p
    ON s.emp_id = p.emp_id
   AND LAST_DAY(s.snapshot_month) BETWEEN p.from_dt AND p.to_dt
where s.snapshot_month >= DATE '2021-01-01'
;
