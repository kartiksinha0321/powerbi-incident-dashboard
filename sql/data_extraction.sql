SELECT 
    category,
    priority,
    COUNT(*) AS total_incidents,
    AVG(resolution_time_hours) AS avg_resolution_time
FROM incidents
GROUP BY category, priority;