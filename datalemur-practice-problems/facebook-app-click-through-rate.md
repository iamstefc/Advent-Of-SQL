# App Click-through Rate (CTR) [Facebook SQL Interview Question]

Assume you have an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022. Output the results in percentages rounded to 2 decimal places.

Notes:

- Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
- To avoid integer division, you should multiply the click-through rate by 100.0, not 100.

Check out [DataLemur](https://datalemur.com/questions/click-through-rate) for sample input table!

## My Solution

```
with app_data as (

SELECT
  app_id
  , COUNT(CASE WHEN event_type = 'impression' THEN app_id END) AS impressions
  , COUNT(CASE WHEN event_type = 'click' THEN app_id END) AS clicks
  FROM events
  WHERE EXTRACT(year from timestamp) = 2022 
  GROUP BY 1
)

SELECT 
  app_id
  , ROUND(100.0 * clicks / impressions, 2)
FROM app_data
```