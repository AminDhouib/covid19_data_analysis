SELECT D.year_and_month_abbrev, D.date, L.phu_name, SUM(F.num_resolved + F.num_unresolved + F.num_fatal) total_num_cases
FROM covid.fact_table F
INNER JOIN covid.reported_date D ON D.reported_date_key = F.reported_date_surrogate 
INNER JOIN covid.phu_location L ON L.phu_location_key = F.phu_location_surrogate 
WHERE L.phu_name IN ('Peel Public Health', 'York Region Public Health Services') AND D.month_name IN ('January')
GROUP BY L.phu_name, D.date, D.year_and_month_abbrev
ORDER BY L.phu_name, D.date, D.year_and_month_abbrev
