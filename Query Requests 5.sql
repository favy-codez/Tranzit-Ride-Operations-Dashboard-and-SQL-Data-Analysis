SELECT *
FROM trz.drivers

SELECT *
FROM trz.trips

-- Display all columns from drivers table and distance_km from trips table
SELECT d.*, t.distance_km
FROM trz.drivers AS d
JOIN trz.trips AS t
ON d.driver_id = t.driver_id;

-- Display driver_id and total_distance_km rounded to the nearest whole number for each driver
SELECT d.driver_id, ROUND(SUM(t.distance_km), 0) AS total_distance_km
FROM trz.drivers AS d
JOIN trz.trips AS t
    ON d.driver_id = t.driver_id
GROUP BY d.driver_id;

-- Display top 5 drivers that covered the most distance
SELECT TOP 5 d.driver_id, ROUND(SUM(t.distance_km), 0) AS total_distance_km
FROM trz.drivers AS d
JOIN trz.trips AS t
    ON d.driver_id = t.driver_id
GROUP BY d.driver_id
ORDER BY total_distance_km DESC;

-- Display home area and dropoff area where home area = dropoff area
SELECT d.home_area,t.dropoff_area
FROM trz.drivers AS d
JOIN trz.trips AS t
    ON d.driver_id = t.driver_id
WHERE d.home_area = t.dropoff_area;

-- Display all columns from trips, drivers and riders using INNER JOIN
SELECT t.*, d.*, r.*
FROM trz.trips AS t
INNER JOIN trz.drivers AS d
    ON t.driver_id = d.driver_id
INNER JOIN trz.riders AS r
    ON t.rider_id = r.rider_id;

-- Show vehicle_make_model, vehicle_category and new Vehicle_Category column with CASE transformation
SELECT vehicle_make_model,vehicle_category,
    CASE 
        WHEN vehicle_category = 'Mini' THEN 'Hatch Back'
        ELSE vehicle_category
    END AS New_Vehicle_Category
FROM trz.drivers;

-- Classify vehicle_condition_score into text categories
SELECT vehicle_condition_score,
    CASE 
        WHEN vehicle_condition_score >= 4.5 THEN 'Excellent'
        WHEN vehicle_condition_score BETWEEN 3.5 AND 4.4 THEN 'Good'
        WHEN vehicle_condition_score <= 3.4 THEN 'Fair'
    END AS Vehicle_Condition
FROM trz.drivers;

-- Classify vehicles based on their year
SELECT vehicle_year,
    CASE 
        WHEN vehicle_year BETWEEN 2010 AND 2015 THEN 'Very Old'
        WHEN vehicle_year BETWEEN 2016 AND 2020 THEN 'Old'
        WHEN vehicle_year BETWEEN 2021 AND 2024 THEN 'Fairly New'
        WHEN vehicle_year >= 2025 THEN 'New'
    END AS Vehicle_Age_Category
FROM trz.drivers;

-- Show driver_id and total number of trips per driver
SELECT d.driver_id,COUNT(t.ride_id) AS total_trips
FROM trz.drivers AS d
JOIN trz.trips AS t
    ON d.driver_id = t.driver_id
GROUP BY d.driver_id
ORDER BY total_trips DESC;

-- Show drivers with 50+ trips, sorted by total trips
SELECT d.driver_id, COUNT(t.ride_id) AS total_trips
FROM trz.drivers AS d
JOIN trz.trips AS t
    ON d.driver_id = t.driver_id
GROUP BY d.driver_id
HAVING COUNT(t.ride_id) >= 50
ORDER BY total_trips DESC;
