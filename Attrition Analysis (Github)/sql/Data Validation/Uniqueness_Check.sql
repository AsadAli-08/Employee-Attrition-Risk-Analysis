SELECT emp_id, snapshot_month, COUNT(*) as count
FROM project_snap_emp_month 
GROUP BY emp_id, snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, COUNT(*) as count
FROM project_emp_master  
GROUP BY emp_id
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_TRAINING_DAYS   
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;
SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_POS_CHNG_COUNT    
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_PERF_SLOPE     
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_PERF_DELTA      
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_INCENTIVE_VOLATILITY        
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_INCENTIVE_SUM         
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_RESIG_FLAG         
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_RESIG_UNIT_GRADE         
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_ABSENCE         
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_SALARY         
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM project_ft_compa_ratio        
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;

SELECT emp_id, snapshot_month, COUNT(*) as count
FROM PROJECT_FT_MONTHS_SINCE_PROM       
GROUP BY emp_id,snapshot_month
HAVING COUNT(*) > 1;
