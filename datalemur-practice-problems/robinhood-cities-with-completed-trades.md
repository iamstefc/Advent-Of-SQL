# Cities with Completed Trades [Robinhood SQL Interview Question]

You are given the tables below containing information on Robinhood trades and users. Write a query to list the top three cities that have the most completed trade orders in descending order.

Output the city and number of orders.

Check out [DataLemur](https://datalemur.com/questions/completed-trades) for sample input table!

## My Solution

```
with city_trades_data as (
  SELECT 
    u.city AS city
    , COUNT(CASE WHEN t.status = 'Completed' THEN t.order_id END) AS number_of_orders_completed
  FROM trades t
  LEFT JOIN users u
  ON u.user_id = t.user_id
  GROUP BY 1
  ORDER BY COUNT(CASE WHEN t.status = 'Completed' THEN t.order_id END) DESC
)

SELECT
  city
  , number_of_orders_completed
FROM city_trades_data
LIMIT 3
```