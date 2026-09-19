-- 1. Number of charging sessions by start hour
SELECT Start_plugin_hours, COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY Start_plugin_hour
ORDER BY number_of_sessions DESC;

-- 2. Average energy consumption by user type
SELECT User_type, AVG(CAST(REPLACE(",",".") AS REAL)) AS Average_energy_kWh
FROM charging_sessions
GROUP BY User_type;

-- 3. Total energy consumption by user type
SELECT User_type, SUM(CAST(REPLACE(",",".") AS REAL)) AS total_energy_kWh
FROM charging _sessions
GROUP BY User_type;


-- 4. Charging sessions by energy category
SELECT 
    CASE
        WHEN CAST(REPLACE(El_kWh, ',', '.') AS REAL) < 10
            THEN 'Low energy sessions'
        WHEN CAST(REPLACE(El_kWh, ',', '.') AS REAL) <= 20
            THEN 'Medium energy sessions'
        ELSE 'High energy sessions'
    END AS energy_category,
    COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY energy_category
ORDER BY number_of_sessions DESC;

-- 5. Number of charging sessions by garage
SELECT Garage_ID,
       COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY Garage_ID
ORDER BY number_of_sessions DESC;

-- 6. Average energy consumption by garage
SELECT Garage_ID,
       AVG(CAST(REPLACE(El_kWh, ',', '.') AS REAL)) AS average_energy_kWh
FROM charging_sessions
GROUP BY Garage_ID
ORDER BY average_energy_kWh DESC;


-- 7. Number of charging sessions by weekday
SELECT weekdays_plugin,
       COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY weekdays_plugin
ORDER BY number_of_sessions DESC;


-- 8. Average charging duration by user type
SELECT User_type,
       AVG(CAST(REPLACE(Duration_hours, ',', '.') AS REAL)) AS average_duration_hours
FROM charging_sessions
GROUP BY User_type;


-- 9. Average energy consumption by weekday
SELECT weekdays_plugin,
       AVG(CAST(REPLACE(El_kWh, ',', '.') AS REAL)) AS average_energy_kWh
FROM charging_sessions
GROUP BY weekdays_plugin
ORDER BY average_energy_kWh DESC;


-- 10. Number of charging sessions by month
SELECT month_plugin,
       COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY month_plugin
ORDER BY number_of_sessions DESC;


-- 11. Average energy consumption by start hour
SELECT Start_plugin_hour,
       AVG(CAST(REPLACE(El_kWh, ',', '.') AS REAL)) AS average_energy_kWh
FROM charging_sessions
GROUP BY Start_plugin_hour
ORDER BY Start_plugin_hour;


-- 12. Total energy consumption by garage
SELECT Garage_ID,
       SUM(CAST(REPLACE(El_kWh, ',', '.') AS REAL)) AS total_energy_kWh
FROM charging_sessions
GROUP BY Garage_ID
ORDER BY total_energy_kWh DESC;


-- 13. Average energy consumption by garage and user type
SELECT Garage_ID,
       User_type,
       AVG(CAST(REPLACE(El_kWh, ',', '.') AS REAL)) AS average_energy_kWh
FROM charging_sessions
GROUP BY Garage_ID, User_type
ORDER BY Garage_ID, average_energy_kWh DESC;


-- 14. Number of charging sessions by garage and user type
SELECT Garage_ID,
       User_type,
       COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY Garage_ID, User_type
ORDER BY Garage_ID, number_of_sessions DESC;