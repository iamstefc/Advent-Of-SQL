WITH active_user_data AS (

  SELECT 
    user_id 
    , EXTRACT(month from event_date) as month
    , DENSE_RANK() OVER (PARTITION BY user_id ORDER BY EXTRACT(month from event_date) ) AS active_rank
  FROM user_actions
  ORDER BY user_id DESC

)

SELECT
  month
  , COUNT(DISTINCT user_id) as monthly_active_users
FROM active_user_data
WHERE active_rank > 1 AND month = 7
GROUP BY 1

https://datalemur.com/questions/user-retention

