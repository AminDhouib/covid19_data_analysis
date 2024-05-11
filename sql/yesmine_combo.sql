SELECT D.year_and_quarter, D.year_and_month, L.phu_name, M.title, SUM(F.num_resolved + F.num_unresolved + F.num_fatal) total_num_cases
FROM covid.fact_table F
INNER JOIN covid.reported_date D on D.reported_date_key = F.reported_date_surrogate 
INNER JOIN covid.phu_location L on L.phu_location_key = F.phu_location_surrogate 
INNER JOIN covid.special_measures M on M.special_measures_key = F.special_measures_surrogate 
WHERE L.phu_name in ('Ottawa Public Health', 'Toronto Public Health') AND M.title in ('restrictions_on_gatherings', 'stay_at_home', 'workplace_closure')
GROUP BY D.year_and_quarter, D.year_and_month, L.phu_name, M.title
ORDER BY L.phu_name, D.year_and_month;
