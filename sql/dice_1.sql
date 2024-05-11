SELECT D.year_and_month_abbrev, L.phu_name, P.outbreak_related, SUM(F.num_fatal) monthly_num_fatal
FROM covid.fact_table F
INNER JOIN covid.reported_date D on D.reported_date_key = F.reported_date_surrogate 
INNER JOIN covid.phu_location L on L.phu_location_key = F.phu_location_surrogate
INNER JOIN covid.patient P on P.patient_key = F.patient_surrogate
WHERE D.year_and_month_abbrev IN ('2020/Dec','2021/Jan')
AND L.phu_name IN ('Peel Public Health', 'Ottawa Public Health') 
GROUP BY D.year_and_month_abbrev, L.phu_name, P.outbreak_related;