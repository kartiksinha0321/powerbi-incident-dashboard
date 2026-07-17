-- 03_AnalyticsQueries.sql
-- Exploratory and operational analysis queries.

-- 1. Incident volume by year
SELECT
    YEAR(created_date) AS incident_year,
    COUNT(*) AS total_incidents
FROM dbo.Fact_Incident
GROUP BY YEAR(created_date)
ORDER BY incident_year;

-- 2. Incident volume by priority
SELECT priority, COUNT(*) AS total_incidents
FROM dbo.Fact_Incident
GROUP BY priority
ORDER BY total_incidents DESC;

-- 3. Incident volume by category
SELECT category, COUNT(*) AS total_incidents
FROM dbo.Fact_Incident
GROUP BY category
ORDER BY total_incidents DESC;

-- 4. Incidents by assignment group
SELECT assignment_group, COUNT(*) AS total_incidents
FROM dbo.Fact_Incident
GROUP BY assignment_group
ORDER BY total_incidents DESC;

-- 5. Average resolution time by category
SELECT
    category,
    CAST(AVG(resolution_time_hours) AS DECIMAL(10,2)) AS avg_resolution_time_hours
FROM dbo.Fact_Incident
WHERE resolution_time_hours IS NOT NULL
GROUP BY category
ORDER BY avg_resolution_time_hours DESC;

-- 6. Resolver efficiency
SELECT
    resolver,
    COUNT(*) AS incident_count,
    CAST(AVG(resolution_time_hours) AS DECIMAL(10,2)) AS avg_resolution_time_hours
FROM dbo.Fact_Incident
WHERE resolution_time_hours IS NOT NULL
GROUP BY resolver
ORDER BY avg_resolution_time_hours;

-- 7. Reopened incidents by category
SELECT
    category,
    SUM(CASE WHEN reopened_flag = 1 THEN 1 ELSE 0 END) AS reopened_count
FROM dbo.Fact_Incident
GROUP BY category
ORDER BY reopened_count DESC;

-- 8. CSAT by priority
SELECT
    priority,
    CAST(AVG(customer_satisfaction_rating) AS DECIMAL(10,2)) AS average_csat
FROM dbo.Fact_Incident
WHERE customer_satisfaction_rating IS NOT NULL
GROUP BY priority
ORDER BY priority;

-- 9. CSAT by category
SELECT
    category,
    CAST(AVG(customer_satisfaction_rating) AS DECIMAL(10,2)) AS average_csat
FROM dbo.Fact_Incident
WHERE customer_satisfaction_rating IS NOT NULL
GROUP BY category
ORDER BY average_csat DESC;

-- 10. Customer incident frequency
SELECT TOP 20
    c.customer_id,
    c.customer_name,
    COUNT(f.incident_id) AS incident_count
FROM dbo.Dim_Customer c
JOIN dbo.Fact_Incident f
    ON c.customer_id = f.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY incident_count DESC;
