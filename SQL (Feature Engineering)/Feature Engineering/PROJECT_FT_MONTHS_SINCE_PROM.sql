--------------------------------------------------------
--  File created - Monday-March-16-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View PROJECT_FT_MONTHS_SINCE_PROM
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SAPTEST"."PROJECT_FT_MONTHS_SINCE_PROM" ("EMP_ID", "SNAPSHOT_MONTH", "MONTHS_SINCE_PROM", "PROM_COUNT", "STAGFLATION") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  select
    m.emp_id,
    m.snapshot_month,
    nvl(trunc(months_between ( LAST_DAY(m.snapshot_month),max(p.prom_dt) ) ),40) as months_since_prom,
    nvl(count(distinct p.prom_dt),0) as prom_count,
    case
    when nvl(trunc(months_between ( LAST_DAY(m.snapshot_month),max(p.prom_dt) ) ),40) >=36 then 1
    else 0
    end as stagflation
from
    project_snap_emp_month m
    left outer join
    project_promotion_master p
    on
        m.emp_id = p.emp_id 
        and p.prom_dt <= last_day(m.snapshot_month)
where m.snapshot_month > DATE '2021-01-01'
group by
m.emp_id, m.snapshot_month
;
