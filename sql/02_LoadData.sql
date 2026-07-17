-- 02_LoadData.sql
-- The GitHub repository contains Excel versions of the datasets.
--
-- Recommended SQL Server loading workflow:
-- 1. Run 01_CreateTables.sql.
-- 2. In SSMS, right-click the database > Tasks > Import Data.
-- 3. Select Microsoft Excel as the source.
-- 4. Import Dim_Customer_Dataset.xlsx into dbo.Dim_Customer FIRST.
-- 5. Import Fact_incident_Dataset.xlsx into dbo.Fact_Incident SECOND.
--
-- Loading the customer dimension first is important because Fact_Incident
-- contains a foreign key to Dim_Customer.
--
-- Alternative:
-- Export the Excel sheets as CSV and use BULK INSERT. File paths must be
-- changed for the local SQL Server environment.

/*
BULK INSERT dbo.Dim_Customer
FROM 'C:\Data\Dim_Customer_Dataset.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT dbo.Fact_Incident
FROM 'C:\Data\Fact_incident_Dataset.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
*/
