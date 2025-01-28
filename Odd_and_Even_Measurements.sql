-- reference http://datalemur.com/questions/odd-even-measurements
with measurements_with_row_num as (
  SELECT measurement_value,
    date(measurement_time) as measurement_day,
    row_number () over (PARTITION BY date(measurement_time) order by measurement_time ) as rownum
  FROM measurements)

select measurement_day,
sum(case when rownum%2 = 1 then measurement_value else 0 end) odd_sum,
sum(case when rownum%2 = 0 then measurement_value else 0 end ) even_sum
from measurements_with_row_num
group by measurement_day
order by measurement_day
;