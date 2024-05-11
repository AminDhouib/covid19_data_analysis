select P.province, D.year_and_month, sum(F.num_resolved + F.num_unresolved + F.num_fatal) as total_cases
from covid.phu_location as P, covid.fact_table as F, covid.patient as PA, covid.reported_date as D
where 
P.phu_location_key = F.phu_location_surrogate 
and PA.patient_key = F.patient_surrogate
and D.reported_date_key = F.reported_date_surrogate
and PA.outbreak_related = 'Yes'
Group by(P.province, D.year_and_month);
