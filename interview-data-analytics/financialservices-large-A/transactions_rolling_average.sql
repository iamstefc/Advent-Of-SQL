/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */

SELECT
  DATE_TRUNC('day', transaction_time) AS transaction_date
  , AVG(transaction_amount) AS average_transaction_amount
FROM
  transactions
WHERE
  DATE_TRUNC('month', transaction_time) = DATE('2021-01-01')
GROUP BY
  DATE_TRUNC('day', transaction_time)
ORDER BY
  transaction_date;