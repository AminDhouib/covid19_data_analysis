select M.title, P.phu_name, PA.age_group, SUM(F.num_fatal) as total_fatal
from covid.fact_table as F, covid.special_measures as M, covid.phu_location as P, covid.patient as PA
where F.phu_location_surrogate = P.phu_location_key 
and F.patient_surrogate = PA.patient_key
and F.special_measures_surrogate = M.special_measures_key 
and M.title = 'school_closure'
group by( M.title, P.phu_name, PA.age_group)
order by( M.title, P.phu_name, PA.age_group);