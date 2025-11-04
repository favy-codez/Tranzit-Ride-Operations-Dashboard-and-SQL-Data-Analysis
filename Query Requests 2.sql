SELECT *
FROM trz.riders

SELECT *
FROM trz.trips

--1 Show all columns in the riders table and sort from earliest date of created_date column
SELECT *
FROM trz.riders
ORDER BY created_date ASC;

--2 Show only the first 5 columns in the riders table and first 5 columns in the trips table
SELECT rider_id, home_area, home_area, payment_pref, tier
FROM trz.riders;

--3 Display riders information in the gold tier and sort by rider_id column in ascending order
SELECT *
FROM trz.riders
WHERE tier = 'gold'
ORDER BY rider_id ASC;

--4 Display riders information in the gold tier that prefer to use card for payment
SELECT r.*
FROM trz.riders AS r
JOIN trz.trips AS t ON r.rider_id = t.rider_id
WHERE r.tier = 'gold'
AND t.payment_method = 'Card';

--5 Show the tier column and the number of riders in each of the three tiers
SELECT tier, COUNT(*) AS number_of_riders
FROM trz.riders
GROUP BY tier;

--6 How many riders are in the gold tier
SELECT COUNT(*) AS gold_tier_riders
FROM trz.riders
WHERE tier = 'gold';

--7 Show riders information that their home area is in Ikoyi or belong in the gold tier
SELECT *
FROM trz.riders
WHERE home_area = 'Ikoyi'
OR tier = 'gold';

--8 Display riders information including dropoff area column that their home area is in (ogudu, ikeja, ogba) only.
SELECT r.*, t.dropoff_area AS dropoff_area
FROM trz.riders AS r
LEFT JOIN trz.trips AS t 
ON r.rider_id = t.rider_id
WHERE r.home_area IN ('Ogudu', 'Ikeja', 'Ogba');

--9 Show each home zone and number of riders in each home zone
SELECT home_zone, COUNT(*) AS total_riders
FROM trz.riders
GROUP BY home_zone;

--10 Show the total number of riders in each home area. Limit result to where total number are above 300
SELECT home_area, COUNT(*) AS total_riders
FROM trz.riders
GROUP BY home_area
HAVING COUNT(*) > 300;
