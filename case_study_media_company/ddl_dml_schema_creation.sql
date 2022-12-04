CREATE SCHEMA media;
SET search_path = media;

CREATE TABLE subscriptions (
  subscription_id INTEGER PRIMARY KEY,
  status VARCHAR(10),
  created_date DATE
);

INSERT INTO subscriptions
  (subscription_id, status, created_date)
VALUES
  ('1', 'active', '2017-08-10'),
  ('2', 'active', '2017-08-26'),
  ('3', 'active', '2018-03-21'),
  ('4', 'cancel', '2018-05-28'),
  ('5', 'active', '2018-06-02'),
  ('6', 'cancel', '2018-06-20'),
  ('7', 'cancel', '2018-07-21'),
  ('8', 'active', '2018-11-27'),
  ('9', 'cancel', '2019-01-23'),
  ('10', 'cancel', '2019-02-25');

CREATE TABLE downloads (
	download_id INTEGER PRIMARY KEY,
  	subscription_id INTEGER REFERENCES subscriptions(subscription_id),
  	stock_item_id INTEGER,
	date_of_download DATE
);

INSERT INTO downloads
  (download_id, subscription_id, stock_item_id, date_of_download)
VALUES
('1', '1', '1', '2017-08-11'),
('2', '1', '1', '2017-08-17'),
('3', '1', '2', '2017-08-14'),
('4', '1', '3', '2017-08-16'),
('5', '1', '4', '2018-08-11'),
('6', '1', '5', '2018-12-10'),
('7', '2', '2', '2017-08-30'),
('8', '2', '3', '2017-09-05'),
('9', '2', '4', '2018-08-10'),
('10', '2', '5', '2018-12-10'),
('11', '2', '5', '2018-12-10'),
('12', '3', '1', '2018-03-23'),
('13', '3', '1', '2018-03-26'),
('14', '3', '1', '2018-03-29'),
('15', '3', '6', '2019-01-06'),
('16', '3', '7', '2019-01-24'),
('17', '4', '3', '2018-05-29'),
('18', '4', '4', '2018-08-09'),
('19', '5', '5', '2018-12-03'),
('20', '5', '6', '2019-01-06'),
('21', '5', '7', '2019-01-23'),
('22', '6', '1', '2018-06-25'),
('23', '7', '4', '2018-08-07'),
('24', '8', '2', '2018-12-02'),
('25', '8', '4', '2018-12-06'),
('26', '8', '5', '2018-12-04'),
('27', '8', '6', '2019-01-03'),
('28', '9', '1', '2019-01-27'),
('29', '10', '2', '2019-03-07'),
('30', '10', '3', '2019-03-01');

CREATE TABLE plan_change_log (
	plan_change_log_id INTEGER PRIMARY KEY,
  	subscription_id INTEGER REFERENCES subscriptions(subscription_id),
  	plan_id INTEGER,
	status VARCHAR(10),
	date_added DATE
);

INSERT INTO plan_change_log
  (plan_change_log_id, subscription_id, plan_id, status, date_added)
VALUES
('1', '1', '1', 'active', '2017-08-10'),
('2', '1', '1', 'cancel', '2017-08-26'),
('3', '1', '2', 'active', '2018-08-01'),
('4', '1', '2', 'cancel', '2018-12-10'),
('5', '2', '2', 'active', '2017-08-26'),
('6', '2', '2', 'cancel', '2018-09-20'),
('7', '2', '1', 'active', '2018-12-10'),
('8', '2', '1', 'cancel', '2018-12-25'),
('9', '3', '2', 'active', '2018-03-21'),
('10', '3', '2', 'cancel', '2018-04-02'),
('11', '3', '3', 'active', '2019-01-01'),
('12', '3', '3', 'cancel', '2019-02-24');