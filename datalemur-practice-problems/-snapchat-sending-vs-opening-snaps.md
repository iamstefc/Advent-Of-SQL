WITH user_activity_data AS (

  SELECT 
    ab.age_bucket
    , SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent END) AS open_time
    , SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent END) AS send_time
  FROM activities a
  LEFT JOIN age_breakdown ab 
  ON a.user_id = ab.user_id
  GROUP BY 1
  
)

SELECT 
  age_bucket
  , ROUND((send_time / (send_time + open_time))*100.0, 2) AS send_perc
  , ROUND((open_time / (send_time + open_time))*100.0, 2) AS open_perc
FROM user_activity_data


https://datalemur.com/questions/time-spent-snaps

