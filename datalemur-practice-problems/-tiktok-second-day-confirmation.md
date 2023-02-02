SELECT 
  e.user_id
FROM emails e
LEFT JOIN texts t  
ON e.email_id = t.email_id
WHERE DATE_PART('day', t.action_date - e.signup_date) = 1;

https://datalemur.com/questions/second-day-confirmation