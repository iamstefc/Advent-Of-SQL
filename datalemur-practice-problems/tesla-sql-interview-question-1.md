# Unfinished Parts [Tesla SQL Interview Question]

Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data. Write a SQL query that determines which parts have begun the assembly process but are not yet finished.

## My Solution

```
SELECT 
  part
FROM parts_assembly
GROUP BY part
HAVING COUNT(*) - COUNT(finish_date) != 0
```

Keep tabs on COUNT(*) counts all records no matter null or not null, while COUNT(column) count all record not null. The query gets the difference between the total assembly steps and current step (where finish date is null).