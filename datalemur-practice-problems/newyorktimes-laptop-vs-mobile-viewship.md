# Laptop vs Mobile Viewership [New York Times SQL Interview Question]

Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). Define “mobile” as the sum of tablet and phone viewership numbers. Write a query to compare the viewership on laptops versus mobile devices.

Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".

Check out [DataLemur](https://datalemur.com/questions/laptop-mobile-viewership) for sample input table!

## My Solution

```
SELECT 
  COUNT(CASE WHEN device_type = 'laptop' THEN user_id END) AS laptop_views
  , COUNT(CASE WHEN device_type in ('phone', 'tablet') THEN user_id END) AS mobile_views
  FROM viewership;
```