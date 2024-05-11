SELECT P.city, D.month_name, PA.age_group, SUM(F.num_fatal) as total_fatal
FROM covid.fact_table as F, covid.phu_location as P, covid.reported_date as D, covid.patient as PA
WHERE F.phu_location_surrogate = P.phu_location_key 
and F.reported_date_surrogate = D.reported_date_key 
and F.patient_surrogate = PA.patient_key
and P.city = 'Ottawa'
Group by(P.city, D.month_name, PA.age_group)
Order By (P.city, D.month_name, PA.age_group);