SELECT snapshot_month, COUNT(*) AS cnt
FROM PROJECT_MONTHLY_SNAPSHOT_TB
GROUP BY snapshot_month
ORDER BY snapshot_month;
