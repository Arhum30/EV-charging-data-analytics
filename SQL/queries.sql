-- 1. Number of charging sessions by start hour
SELECT Start_plugin_hours, COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY Start_plugin_hour
ORDER BY number_of_sessions DESC;

-- 2. Average energy consumption by user type
SELECT User_type, AVG(El_kWh) AS Average_energy_kWh
FROM charging_sessions
GROUP BY User_type;

-- 3. Total energy consumption by user type
SELECT User_type, SUM(El_kWh) AS total_energy_kWh
FROM charging _sessions
GROUP BY User_type;


-- 4. Charging sessions by energy category
SELECT 
    CASE
        WHEN El_kWh < 10
            THEN 'Low energy sessions'
        WHEN El_kWh <= 20
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



--6.  Number of charging sessions by weekday
SELECT weekdays_plugin,
       COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY weekdays_plugin
ORDER BY number_of_sessions DESC;


--7. Average charging duration by user type
SELECT User_type,
       AVG(Duration_hours) AS average_duration_hours
FROM charging_sessions
GROUP BY User_type;


--8. Average energy consumption by weekday
SELECT weekdays_plugin,
       AVG(El_kWh) AS average_energy_kWh
FROM charging_sessions
GROUP BY weekdays_plugin
ORDER BY average_energy_kWh DESC;


--9. Number of charging sessions by month
SELECT month_plugin,
       COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY month_plugin
ORDER BY number_of_sessions DESC;


--10. Average energy consumption by start hour
SELECT Start_plugin_hour,
       AVG(El_kWh) AS average_energy_kWh
FROM charging_sessions
GROUP BY Start_plugin_hour
ORDER BY Start_plugin_hour;



--11. Average energy consumption by garage and user type
SELECT Garage_ID,
       User_type,
       AVG(El_kWh) AS average_energy_kWh
FROM charging_sessions
GROUP BY Garage_ID, User_type
ORDER BY Garage_ID, average_energy_kWh DESC;


-- 12. Number of charging sessions by garage and user type
SELECT Garage_ID,
       User_type,
       COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY Garage_ID, User_type
ORDER BY Garage_ID, number_of_sessions DESC;



-- 13. High-energy charging sessions
SELECT session_ID,
    User_ID,
    Garage_ID
    El_kWh,
    start_plugin_hour
FROM charging_sessions
WHERE El_kWh > 30
ORDER BY El_kWh DESC;


-- 14. Garages with more than 100 charging sessions
SELECT Garage_ID
    COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY Garage_ID
HAVING COUNT(*) > 100
ORDER BY number_of_sessions DESC;


-- 15. Garage charging activity summary
SELECT GARAGE_ID
    COUNT(*) AS number_of_sessions
    AVG(Kl_kWh) AS average_energy_kWh
    SUM(Kl_kWh) AS total_energy_kWh
FROM charging_sessions
GROUP BY Garage_ID
ORDER BY total_energy_kWh DESC;


-- 16. Overall charging statistics
SELECT
    COUNT(*) AS total_sessions
    AVG(Kl_kWh) AS average_energy_kWh
    SUM(Kl_kWh) AS total_energy_kWh
    AVG(Duration_hours) AS average_duration_hours
FROM charging_sessions;


-- 17. User type charging summary
SELECT
    COUNT(*) AS total_sessions
    AVG(Kl_kWh) AS average_energy_kWh
    SUM(Kl_kWh) AS total_energy_kWh
    AVG(Duration_hours) AS average_duration_hours
FROM charging_sessions
GROUP BY User_type
ORDER BY total_energy_kWh DESC;



-- 18. Charging sessions by weekday and user type
SELECT weekdays_plugin,
       User_type,
       COUNT(*) AS number_of_sessions
FROM charging_sessions
GROUP BY weekdaya_plugin, User_type
ORDER BY User_type DESC;


