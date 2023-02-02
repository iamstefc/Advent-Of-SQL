# Duplicate Job Listing [LinkedIn SQL Interview Question]

Given the reviews table, write a query to get the average stars for each product every month.

The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. Sort the output based on month followed by the product id.

Check out [DataLemur](https://datalemur.com/questions/sql-avg-review-ratings) for sample input table!

## My Solution

```
with product_stars as (
SELECT 
  EXTRACT(month from submit_date) AS mth
  , product_id as product
  , AVG(stars) as avg_stars --OVER (PARTITION BY EXTRACT(month from submit_date), product_id) AS avg_stars
FROM reviews
GROUP BY EXTRACT(month from submit_date), product_id
)

SELECT
  mth
  , product
  , ROUND(avg_stars, 2)
FROM product_stars
ORDER BY mth ASC, product
```