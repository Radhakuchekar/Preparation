-- reference https://datalemur.com/questions/time-spent-snaps
select age_bucket,
round(send_time/(open_time+send_time) *100,2)as send_perc,
round(open_time/(open_time+send_time)*100, 2)as open_perc
from 
(SELECT age_breaks.age_bucket,
sum (case when activity_type='open' then time_spent else 0 end) as open_time, 
sum (case when activity_type='send' then time_spent else 0 end) as send_time
FROM activities act
JOIN age_breakdown age_breaks
ON act.user_id = age_breaks.user_id
GROUP BY age_breaks.age_bucket)sum_by_age;