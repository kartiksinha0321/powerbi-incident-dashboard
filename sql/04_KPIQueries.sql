-- 04_KPIQueries.sql
-- Queries used to validate major dashboard KPIs.

-- Total, open and resolved/closed incidents
SELECT
    COUNT(*) AS total_incidents,
    SUM(CASE WHEN status = 'Open' THEN 1 ELSE 0 END) AS open_incidents,
    SUM(CASE WHEN status IN ('Resolved', 'Closed') THEN 1 ELSE 0 END) AS resolved_or_closed_incidents
FROM dbo.Fact_Incident;

-- SLA compliance and breach percentages
SELECT
    CAST(
        100.0 * SUM(CASE WHEN sla_breach_flag = 0 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(10,2)
    ) AS sla_compliance_pct,
    CAST(
        100.0 * SUM(CASE WHEN sla_breach_flag = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(10,2)
    ) AS sla_breach_pct
FROM dbo.Fact_Incident;

-- Average CSAT
SELECT
    CAST(AVG(customer_satisfaction_rating) AS DECIMAL(10,2)) AS average_csat
FROM dbo.Fact_Incident
WHERE customer_satisfaction_rating IS NOT NULL;

-- Average resolution time / MTTR
SELECT
    CAST(AVG(resolution_time_hours) AS DECIMAL(10,2)) AS avg_resolution_time_hours
FROM dbo.Fact_Incident
WHERE resolution_time_hours IS NOT NULL;

-- P1 incident monitoring
SELECT
    COUNT(*) AS p1_incident_volume,
    SUM(CASE WHEN status = 'Open' THEN 1 ELSE 0 END) AS open_p1_incidents,
    SUM(CASE WHEN sla_breach_flag = 1 THEN 1 ELSE 0 END) AS p1_sla_breaches
FROM dbo.Fact_Incident
WHERE priority = 'P1';

-- Reopened rate
SELECT
    CAST(
        100.0 * SUM(CASE WHEN reopened_flag = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(10,2)
    ) AS reopened_rate_pct
FROM dbo.Fact_Incident;

-- SLA compliance by priority
SELECT
    priority,
    COUNT(*) AS total_incidents,
    SUM(CASE WHEN sla_breach_flag = 0 THEN 1 ELSE 0 END) AS sla_met_count,
    SUM(CASE WHEN sla_breach_flag = 1 THEN 1 ELSE 0 END) AS sla_breach_count,
    CAST(
        100.0 * SUM(CASE WHEN sla_breach_flag = 0 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(10,2)
    ) AS sla_compliance_pct
FROM dbo.Fact_Incident
GROUP BY priority
ORDER BY priority;
