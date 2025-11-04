SELECT *
FROM trz.trips

--1 Display the payment method that was used the most by riders
SELECT TOP 1 payment_method, COUNT(*) AS total_usage
FROM trz.trips
GROUP BY payment_method
ORDER BY total_usage DESC;

--2 Calculate total driver earnings and total commission earned by the platform
SELECT SUM(driver_earnings_naira) AS Total_Driver_Earnings, SUM(platform_commission_naira) AS Total_Platform_Commission
FROM trz.trips;

--3 Show each payment method and the number of times they were used. Sort in descending order number of times used
SELECT payment_method, COUNT(*) AS number_of_uses
FROM trz.trips
GROUP BY payment_method
ORDER BY number_of_uses DESC;

--4 Calculate the total fare paid from canceled rides only (Make sure not to include fares that were refunded)
SELECT SUM(total_fare_naira) AS Total_Canceled_Fare
FROM trz.trips
WHERE status = 'canceled'
-- to ensure refunded fares are excluded
AND cancel_fee_charged = 1;  

--5 Display driver_id and total number of trips for drivers that have completed 50 or more trips (sort in descending number of trips)
SELECT driver_id, COUNT(*) AS total_trips
FROM trz.trips
WHERE status = 'completed'
GROUP BY driver_id
HAVING COUNT(*) >= 50
ORDER BY total_trips DESC;

--6 Display the total number of ride requests by year
SELECT YEAR(request_time) AS ride_year, COUNT(*) AS total_requests
FROM trz.trips
GROUP BY YEAR(request_time)
ORDER BY ride_year;

--7 Display the total number of rides by month in 2026
SELECT MONTH(request_time) AS ride_month,COUNT(*) AS total_rides
FROM trz.trips
WHERE YEAR(request_time) = 2026
GROUP BY MONTH(request_time)
ORDER BY ride_month;