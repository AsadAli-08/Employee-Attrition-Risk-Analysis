--------------------------------------------------------
--  File created - Monday-March-16-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View PROJECT_FT_PERF_SLOPE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SAPTEST"."PROJECT_FT_PERF_SLOPE" ("EMP_ID", "SNAPSHOT_MONTH", "CURR_SCORE", "SCORE_2PERIODS_BACK", "PERF_SLOPE") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  WITH perf_hist AS (
    SELECT
        emp_id,
        from_dt,
        to_dt,
        score,
        LAG(score, 2) OVER (PARTITION BY emp_id ORDER BY from_dt) AS score_2periods_back
    FROM project_perf_master
)

SELECT
    s.emp_id,
    s.snapshot_month,
    p.score AS curr_score,
    p.score_2periods_back,
    CASE
        WHEN score_2periods_back IS NULL THEN NULL
        ELSE (p.score - p.score_2periods_back) / 2
    END AS perf_slope
FROM project_snap_emp_month s
LEFT OUTER JOIN perf_hist p
    ON s.emp_id = p.emp_id
   AND LAST_DAY(s.snapshot_month) BETWEEN p.from_dt AND p.to_dt
where s.snapshot_month >= DATE '2021-01-01'
;
