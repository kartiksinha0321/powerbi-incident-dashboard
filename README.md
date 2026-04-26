# Incident Analytics Dashboard (Power BI)

## Overview
This project focuses on analyzing IT incident data to monitor operational efficiency, SLA compliance, and backlog trends.

The solution is built using Power BI for data visualization and SQL for data extraction and transformation. The dataset used in this project is provided in Excel format for accessibility.

This dashboard helps stakeholders identify bottlenecks, improve resolution performance, and reduce SLA breaches.

------------------------------------------------------------

## Key Business Insights

- Total Incidents: 3000
- Open Incidents: 2011 (High backlog)
- Resolved Incidents: 989
- SLA Compliance: 56.52%
- Average Resolution Time: 7.6 hours

CRITICAL OBSERVATION:
536 P1 SLA breaches detected, indicating significant gaps in high-priority incident handling.

------------------------------------------------------------

## Dashboard Pages

1. Executive Summary
- Incident volume trend (2023–2025)
- SLA compliance tracking
- Backlog vs resolution comparison
- Category and priority breakdown

2. Operational Performance Analysis
- Resolution time distribution
- Average resolution time by category
- Assignment group workload analysis
- SLA compliance by assignment group
- Top 5 incident drivers

3. SLA & Performance Monitoring
- SLA met vs breached trend
- Open incident aging analysis
- Priority-wise SLA compliance
- P1 incident deep-dive

------------------------------------------------------------

## Tools & Technologies

- Power BI (Data Visualization & Dashboarding)
- SQL (Data extraction and transformation)
- DAX (Measures, KPIs, and calculations)
- Excel (.xlsx dataset for analysis)

------------------------------------------------------------

## Data Source

The dataset used in this project is included in Excel format:

dataset/
   └── incident_data.xlsx

Note:
The original data was extracted using SQL from a relational database.  
The Excel file represents a cleaned and structured version of the dataset for analysis and visualization purposes.

------------------------------------------------------------

## SQL Usage

- Extracted data from relational database tables
- Used JOIN operations to combine multiple entities (incidents, categories, assignment groups)
- Applied filtering and aggregations for KPI calculations
- Prepared dataset for Power BI data modeling

Note:
The SQL logic is represented conceptually as the original database is not included in this repository.

------------------------------------------------------------

## Data Model

The dashboard follows a structured data model:

- Fact Table: Incident Data
- Dimension Tables: Date, Priority, Category, Assignment Group

This model enables efficient filtering, better performance, and scalable reporting.

------------------------------------------------------------

## Key Features

- Interactive slicers (Date, Priority, Category, Assignment Group)
- KPI-driven dashboard design
- Drill-down capability across categories and priorities
- Combined operational and strategic insights
- SLA monitoring and backlog analysis

------------------------------------------------------------

## Business Impact

- Identifies SLA breach drivers
- Highlights high backlog and operational inefficiencies
- Improves incident resolution visibility
- Supports data-driven decision making
- Enables proactive incident management

------------------------------------------------------------

## Files Included

- Power BI (.pbix) file
- Excel dataset (.xlsx)
- Dashboard PDF
- Dashboard screenshots (preview)

------------------------------------------------------------

## Author

Kartik Sinha
Power BI Data Analyst | SQL | Business Intelligence
Immediate Joiner
