# Page with No Likes [Facebook SQL Interview Question]

Assume you are given the tables below about Facebook pages and page likes. Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.

Check out [DataLemur](https://datalemur.com/questions/sql-page-with-no-likes) for sample input tables!

## My Solution

```
with page_like_identify as (
    SELECT
    p.page_id
    , COUNT(pl.user_id) as page_like_count
    FROM pages p  
    LEFT JOIN page_likes pl 
    ON p.page_id = pl.page_id
    GROUP BY p.page_id
)

SELECT 
  page_id
FROM page_like_identify
WHERE page_like_count = 0
ORDER BY page_id ASC
```

Be mindful of the LEFT JOIN. Here we're taking all data points in page_like and matching them to all records in pages. If there is record in the page table not found in page_like, it will appear as zero.