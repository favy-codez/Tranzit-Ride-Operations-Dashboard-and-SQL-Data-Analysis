SELECT *
FROM trz.trips

SELECT *
FROM trz.drivers

-- Show all columns in drivers table and the first 2 columns in trips table
SELECT d.*, t.ride_id, t.request_time
FROM trz.drivers AS d
JOIN trz.trips AS t
ON d.driver_id = t.driver_id;

-- Show only the first 5 columns in drivers table
SELECT driver_id,home_area,home_zone,vehicle_id,vehicle_make_model
FROM trz.drivers;

-- Show driver information for drivers that have perfect rating (5) but their vehicle condition is below 3
SELECT *
FROM trz.drivers
WHERE driver_rating = 5
AND vehicle_condition_score < 3;

-- How many drivers signed up in the first month (July 2025)
SELECT COUNT(*) AS Drivers_Signed_Up_July_2025
FROM trz.drivers
WHERE YEAR(signup_date) = 2025
AND MONTH(signup_date) = 7;

-- Display driver_rating column and another column rounded to 2 decimal places
SELECT driver_id,driver_rating,ROUND(driver_rating, 2) AS Driver_Rating_Rounded_2
FROM trz.drivers;

-- Display driver rating column and another column rounded to the nearest whole number,limit to where rounded rating are 3 and above
SELECT driver_id,driver_rating,ROUND(driver_rating, 0) AS Driver_Rating_Rounded
FROM trz.drivers
WHERE ROUND(driver_rating, 0) >= 3;

-- Show number of drivers in each home zone, sorted from lowest to highest
SELECT home_zone,COUNT(driver_id) AS Number_of_Drivers
FROM trz.drivers
GROUP BY home_zone
ORDER BY Number_of_Drivers ASC;

-- Display the vehicle category and number of vehicles in each of them
SELECT vehicle_category,COUNT(vehicle_id) AS Number_of_Vehicles
FROM trz.drivers
GROUP BY vehicle_category
ORDER BY Number_of_Vehicles DESC;

-- Show number of drivers that signed up each month
SELECT YEAR(signup_date) AS Signup_Year,DATENAME(MONTH, signup_date) AS Signup_Month,
    MONTH(signup_date) AS Signup_Month_Number, 
    COUNT(driver_id) AS Number_of_Drivers
FROM trz.drivers
GROUP BY YEAR(signup_date), DATENAME(MONTH, signup_date), MONTH(signup_date)
ORDER BY Signup_Year, Signup_Month_Number;

-- Display ride_id, driver_id, home_area, and pick_up_area for drivers whose home_area = pick_up_area
SELECT t.ride_id,t.driver_id,d.home_area,t.pickup_area
FROM trz.trips AS t
JOIN trz.drivers AS d
    ON t.driver_id = d.driver_id
WHERE d.home_area = t.pickup_area;
