# Duplicate Job Listing [LinkedIn SQL Interview Question]

Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. Write a query to get the number of companies that have posted duplicate job listings.

Clarification:

- Duplicate job listings refer to two jobs at the same company with the same title and description.

Check out [DataLemur](https://datalemur.com/questions/duplicate-job-listings) for sample input table!

## My Solution

```
with company_job_posting_rank as (
  SELECT 
    company_id
    , title
    , COUNT(*) as duplicates_found
  FROM job_listings
  GROUP BY 1,2
)

SELECT 
  COUNT(company_id) as duplicate_companies
FROM company_job_posting_rank 
WHERE duplicates_found > 1
```