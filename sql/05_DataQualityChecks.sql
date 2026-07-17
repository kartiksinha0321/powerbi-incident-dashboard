-- 05_DataQualityChecks.sql
-- Basic data-quality checks before loading the model into Power BI.

-- Duplicate incident IDs
SELECT incident_id, COUNT(*) AS duplicate_count
FROM dbo.Fact_Incident
GROUP BY incident_id
HAVING COUNT(*) > 1;

-- Duplicate customer IDs
SELECT customer_id, COUNT(*) AS duplicate_count
FROM dbo.Dim_Customer
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Incidents with missing customer references
SELECT f.incident_id, f.customer_id
FROM dbo.Fact_Incident f
LEFT JOIN dbo.Dim_Customer c
    ON f.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Resolved date earlier than created date
SELECT incident_id, created_date, resolved_date
FROM dbo.Fact_Incident
WHERE resolved_date IS NOT NULL
  AND resolved_date < created_date;

-- Resolution time outside expected logical range
SELECT incident_id, resolution_time_hours
FROM dbo.Fact_Incident
WHERE resolution_time_hours < 0;

-- Invalid CSAT values (assuming a 1-5 rating scale)
SELECT incident_id, customer_satisfaction_rating
FROM dbo.Fact_Incident
WHERE customer_satisfaction_rating IS NOT NULL
  AND customer_satisfaction_rating NOT BETWEEN 1 AND 5;

-- Review status distribution
SELECT status, COUNT(*) AS record_count
FROM dbo.Fact_Incident
GROUP BY status
ORDER BY record_count DESC;
