SELECT SUM(F.num_resolved + F.num_unresolved + F.num_fatal) AS Total_Num_Positive_Cases_Daily, D.date, D.year_and_month_abbrev
FROM covid.fact_table F
INNER JOIN covid.reported_date D on D.reported_date_key = F.reported_date_surrogate 
WHERE D.year_and_month_abbrev IN ('2020/Nov') 
GROUP BY D.date, D.year_and_month_abbrev
ORDER BY D.date, D.year_and_month_abbrev
