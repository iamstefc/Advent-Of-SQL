SELECT * FROM "media_company_db"."media"."downloads";

SELECT * FROM "media_company_db"."media"."subscriptions";

--1. How many active subscribers does the company have? (according to the subscriptions table)
SELECT COUNT(DISTINCT subscription_id)
FROM "media_company_db"."media"."subscriptions"
WHERE status = 'active';

--2. What is the total number of downloads from currently-active subscribers?
SELECT COUNT(d.*)
FROM "media_company_db"."media"."downloads" d
LEFT JOIN "media_company_db"."media"."subscriptions" s
ON d.subscription_id = s.subscription_id
WHERE s.status = 'active';

--3. Generate a list of all active subscribers and include a field that shows how many downloads that subscriber has ever had.
SELECT s.subscription_id, COUNT(d.download_id)
FROM "media_company_db"."media"."downloads" d
LEFT JOIN "media_company_db"."media"."subscriptions" s
ON d.subscription_id = s.subscription_id
WHERE s.status = 'active'
GROUP BY s.subscription_id
HAVING COUNT(d.download_id) >= 0
ORDER BY s.subscription_id asc;

--4. Which stock item is most commonly the first download a subscriber has? 
--	 Does the answer change if we only consider subscribers new this month?

with stock_item_group as(
	SELECT 
	s.subscription_id as subscription_id,
	d.stock_item_id as stock_item_id,
	d.date_of_download as date_of_download,
	dense_rank() OVER (PARTITION BY s.subscription_id ORDER BY d.date_of_download ASC) as subscription_id_by_date_of_download_rank
FROM "media_company_db"."media"."downloads" d
LEFT JOIN "media_company_db"."media"."subscriptions" s
ON d.subscription_id = s.subscription_id
GROUP BY s.subscription_id, d.stock_item_id, d.date_of_download
ORDER BY s.subscription_id ASC)

SELECT 
stock_item_id, 
COUNT(stock_item_id) as stock_item_downloads
FROM stock_item_group
WHERE subscription_id_by_date_of_download_rank = 1
GROUP BY stock_item_id
ORDER BY stock_item_downloads desc


--5. What is the average amount of time between a subscriber’s first and second download? 2nd and 3rd? 3rd and 4th? 
with previous_date as (
	SELECT
	s.subscription_id as subscription_id,
	d.stock_item_id as stock_item_id,
	d.date_of_download as date_of_download,
	dense_rank() OVER (PARTITION BY s.subscription_id ORDER BY d.date_of_download ASC) as subscription_id_by_date_of_download_rank,
	LAG(d.date_of_download, 1,NULL) OVER (PARTITION BY s.subscription_id ORDER BY d.date_of_download asc) AS previous_date_of_download
FROM "media_company_db"."media"."downloads" d
LEFT JOIN "media_company_db"."media"."subscriptions" s
ON d.subscription_id = s.subscription_id
GROUP BY s.subscription_id, d.stock_item_id, d.date_of_download),

date_difference as (
	SELECT *, 
	(CAST(date_of_download AS date) - CAST(previous_date_of_download AS date)) as date_difference
FROM previous_date
ORDER BY subscription_id, subscription_id_by_date_of_download_rank)

SELECT 
subscription_id_by_date_of_download_rank-1 as download_rank, 
COALESCE(SUM(date_difference),0)/COUNT(subscription_id_by_date_of_download_rank) AS time_til_next_download
FROM date_difference
WHERE subscription_id_by_date_of_download_rank-1 > 0
group by subscription_id_by_date_of_download_rank
order by subscription_id_by_date_of_download_rank asc