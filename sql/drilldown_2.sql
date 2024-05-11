SELECT SUM(F.num_resolved) AS Total_Num_Resolved_Daily, D.date AS day, D.week_num_in_month AS November_Week_Num
FROM covid.fact_table F
INNER JOIN covid.reported_date D on D.reported_date_key = F.reported_date_surrogate 
WHERE D.month_name IN ('November') AND D.week_num_in_month IN (1)
GROUP BY D.date, D.week_num_in_month
ORDER BY D.date, D.week_num_in_month
