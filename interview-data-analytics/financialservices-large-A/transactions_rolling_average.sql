/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */

WITH daily_transaction_sum AS (
    SELECT
        DATE_TRUNC('day', transaction_time) AS transaction_date
        , SUM(transaction_amount) AS total_transaction_amount
    FROM
        transactions
    WHERE
        DATE_TRUNC('month', transaction_time) = DATE('2021-01-01')
    GROUP BY
        DATE_TRUNC('day', transaction_time)
    ORDER BY
        transaction_date

), 

rolling_average AS (
    SELECT
        t1.transaction_date
        , t1.total_transaction_amount
        , (t1.total_transaction_amount +
        COALESCE(t2.total_transaction_amount, 0) +
        COALESCE(t3.total_transaction_amount, 0)) / 3 AS rolling_average
    FROM
        daily_transaction_sum t1
    LEFT JOIN
        daily_transaction_sum t2 
        ON t2.transaction_date = (t1.transaction_date - INTERVAL '1 day')
    LEFT JOIN
        daily_transaction_sum t3 
        ON t3.transaction_date = (t1.transaction_date - INTERVAL '2 days')
    ORDER BY
    t1.transaction_date
)

SELECT 
    transaction_date
    , total_transaction_amount
    , rolling_average
FROM
    rolling_average