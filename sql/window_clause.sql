SELECT D.year_and_month, SUM(F.num_resolved+F.num_unresolved+F.num_fatal) total_cases, AVG(SUM(F.num_resolved+F.num_unresolved+F.num_fatal)) OVER W AS movavg
FROM covid.fact_table F
INNER JOIN covid.reported_date D on D.reported_date_key = F.reported_date_surrogate 
INNER JOIN covid.phu_location L on L.phu_location_key = F.phu_location_surrogate
WHERE L.phu_name = 'Ottawa Public Health'
GROUP BY D.year_and_month
WINDOW W AS (
	ORDER BY D.year_and_month 
	ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
);
