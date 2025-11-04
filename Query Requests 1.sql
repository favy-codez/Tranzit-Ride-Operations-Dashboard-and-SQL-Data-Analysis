-- 1. Show all columns in Trips and sort by request_time from the latest to the earliest time.
SELECT *
FROM trz.trips
ORDER BY request_time DESC;

-- 2. Show the first five columns in this table. Sort the result by the second column in ascending order.
SELECT ride_id, request_time, accepted_time, pickup_time, dropoff_time
FROM trz.trips
ORDER BY request_time ASC;

-- 3. Show the first 10 columns and sort by the pickup zone from A - Z.
SELECT ride_id, request_time, accepted_time, pickup_time, dropoff_time, status, rider_id, driver_id, pickup_area, 
pickup_zone
FROM trz.trips
ORDER BY pickup_zone ASC;

-- 4. Show the various statuses in the table (remove duplicates).
SELECT DISTINCT status
FROM trz.trips;

-- 5. Show the first 6 columns for rides that were completed.
SELECT ride_id, request_time, accepted_time, pickup_time, dropoff_time, status
FROM trz.trips
WHERE status = 'completed';

-- 6. Show the first 6 columns for rides that were not completed.
SELECT ride_id, request_time, accepted_time, pickup_time, dropoff_time, status
FROM trz.trips
WHERE status <> 'completed';

-- 7. Show the IDs of ride, rider and driver, status and cancel reason for rides that were canceled.
-- Sort the table by cancel reason in any order of your choice.
SELECT ride_id, rider_id, driver_id, status, cancel_reason
FROM trz.trips
WHERE status = 'canceled'
ORDER BY cancel_reason ASC;

-- 8. Show IDs of rides, rider and cancel reason for rides that were canceled by riders only.
SELECT ride_id, rider_id, cancel_reason
FROM trz.trips
WHERE status <> 'completed' 
AND cancel_party = 'rider';

-- 9. Show rider_ID, pickup_zone and dropoff_zone columns where the pickup and dropOff are in the same zone.
SELECT rider_id, pickup_zone, dropoff_zone
FROM trz.trips
WHERE pickup_zone = dropoff_zone;

-- 10. Calculate and show how much each driver made per ride after bonus.
-- Call the column Total_Driver_Earnings.
SELECT driver_id,
       ride_id,
       (driver_earnings_naira + peak_bonus_naira) AS Total_Driver_Earnings
FROM trz.trips;
