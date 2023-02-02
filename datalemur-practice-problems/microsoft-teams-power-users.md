# Team Power Users [Microsoft SQL Interview Question]

Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.

Assumption:

- No two users has sent the same number of messages in August 2022.

Check out [DataLemur](https://datalemur.com/questions/duplicate-job-listings) for sample input table!

## My Solution

```
with user_message_rank as (
SELECT
  sender_id
  , COUNT(message_id) as message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = 8 AND EXTRACT(YEAR FROM sent_date) = 2022
GROUP BY 1
ORDER BY COUNT(message_id) DESC
)

SELECT 
  sender_id
  , message_count
FROM user_message_rank
LIMIT 2
```