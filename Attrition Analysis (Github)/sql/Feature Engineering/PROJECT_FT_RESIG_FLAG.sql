--------------------------------------------------------
--  File created - Monday-March-16-2026   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View PROJECT_FT_RESIG_FLAG
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SAPTEST"."PROJECT_FT_RESIG_FLAG" ("EMP_ID", "SNAPSHOT_MONTH", "RESIG_FLAG", "FROM_DT", "ATT_TYPE", "ATT_REASON") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT 

    s.emp_id,
    s.snapshot_month,
    case
        when months_between(a.start_date,last_day(s.snapshot_month)) <=6 and (a.start_date - last_day(s.snapshot_month)) > 0
        then 1
        else 0
    end as resig_flag,
    a.start_date as from_dt,
    a.action_type_desc as att_type,
    a.action_reason_desc as att_reason
    
FROM
    PROJEct_snap_emp_month s
    left outer join
    saphr.pis_emp_actions_det a
    on 
        s.emp_id = a.emp_id
        and a.action_type = 'BS' 
        and a.action_reason = 'N0'
where
    s.snapshot_month >= DATE '2021-01-01'
;
