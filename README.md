# COVID Data Analysis

Executed data science and machine learning methods to analyze the COVID-19 data (change in commute, number of hospital visits, etc.) using PostgreSQL to store the data and Pandas, NumPy, scikit-learn and OpenCV to process the data.

## Data Mining
Firstly, I performed some data mining to access data that can help me analyze COVID-19 Data, such as weather, transportation, and hospital cases, from various sources.

## Data Staging
Secondly, data staging normalized the gathered data and created SQL DBs.

## Data Visualization & Feel
Third, complex SQL queries should be created to give a feel for the data. 

For example, the query below gives you the number of cases in Ottawa and Toronto grouped by quarter and drilled down to months of the year during workplace closure, restrictions on gatherings, and stay-at-home order periods.

```
SELECT D.year_and_quarter, D.year_and_month, L.phu_name, M.title, SUM(F.num_resolved + F.num_unresolved + F.num_fatal) total_num_cases
FROM covid.fact_table F
INNER JOIN covid.reported_date D on D.reported_date_key = F.reported_date_surrogate 
INNER JOIN covid.phu_location L on L.phu_location_key = F.phu_location_surrogate 
INNER JOIN covid.special_measures M on M.special_measures_key = F.special_measures_surrogate 
WHERE L.phu_name in ('Ottawa Public Health', 'Toronto Public Health') AND M.title in ('restrictions_on_gatherings', 'stay_at_home', 'workplace_closure')
GROUP BY D.year_and_quarter, D.year_and_month, L.phu_name, M.title
ORDER BY L.phu_name, D.year_and_month;
```

Here are all of the queries I tried to get a feel of the data in the following link: https://docs.google.com/document/d/1eihbuxC4YZpmtLb3oDhYONP5leG3y1_6hwXBLrquEDI/edit?usp=sharing 
The document also includes a dashboard created using Tableau to visualize the data. 

## Data Analysis With AI
With the gathered data, we built unsupervised machine-learning models using scikit-learn and OpenCV to discover patterns and insights.
