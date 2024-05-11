select P.phu_name, D.year_and_month, SUM(F.num_fatal) as total_fatal, rank() OVER (PARTITION BY D.year_and_month ORDER BY SUM(F.num_fatal) DESC) from 
covid.fact_table as F, covid.phu_location as P, covid.reported_date as D
where F.phu_location_surrogate = P.phu_location_key
and F.reported_date_surrogate = D.reported_date_key
group by (P.phu_name, D.year_and_month)
order by (D.year_and_month);