# User's Third Transaction [Uber SQL Interview Question]

Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

Check out [DataLemur](https://datalemur.com/questions/sql-third-transaction) for sample input table!

## My Solution

```
with user_transactions as (
SELECT 
  user_id
  , spend
  , transaction_date
  ,  RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS rank 
FROM transactions
ORDER BY user_id, transaction_date
)

SELECT 
  user_id
  , spend
  , transaction_date
FROM user_transactions
WHERE rank = 3
```

not part of solution, but good to keep in mind:

-  ```extract(month from transaction_date) AS month``` outputs the month number from a timestamp
-  ```to_char(transaction_date, 'Month') AS month_name``` outputs the month name from the timestamp