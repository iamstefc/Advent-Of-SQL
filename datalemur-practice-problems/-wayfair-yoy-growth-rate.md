-- YoY Growth Rate : 
-- (Current Year Earnings — Last Year’s Earnings) / Last Year’s Earnings x 100

WITH product_spend AS (

  SELECT
    product_id
    , EXTRACT(YEAR FROM transaction_date) AS year
    , SUM(spend) OVER (PARTITION BY product_id, EXTRACT(YEAR FROM transaction_date)) AS curr_year_spend
    , LAG(spend, 1) OVER (PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM transaction_date) ASC) AS prev_year_spend
  FROM user_transactions

)

SELECT
  year
  , product_id
  , curr_year_spend
  , prev_year_spend
  , ROUND(((curr_year_spend - prev_year_spend) / prev_year_spend) * 100.0, 2) AS yoy_rate
FROM product_spend

https://datalemur.com/questions/yoy-growth-rate

LAG(spend, 1) means intervals of 1 step/row

LAG(spend, 1) OVER (PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM transaction_date) ASC) AS prev_year_spend -- where ASC orders the values by oldest to newest and considers the first value or oldest value as NULL 

see LEAD() for other alternative to solution