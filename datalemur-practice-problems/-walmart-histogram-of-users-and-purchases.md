WITH purchase_history AS (

  SELECT 
    user_id
    , transaction_date
    , ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS most_recent_transaction
    , COUNT(product_id) OVER (PARTITION BY user_id, transaction_date ORDER BY transaction_date DESC) AS purchase_count
  FROM user_transactions
  
)

SELECT 
  transaction_date 
  , user_id
  , purchase_count
FROM purchase_history
WHERE most_recent_transaction = 1
ORDER BY transaction_date ASC


https://datalemur.com/questions/histogram-users-purchases