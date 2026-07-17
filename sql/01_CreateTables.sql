CREATE TABLE dbo.Dim_Customer (
    customer_id NVARCHAR(50) NOT NULL PRIMARY KEY,
    customer_name NVARCHAR(200) NULL,
    customer_email NVARCHAR(255) NULL,
    customer_age INT NULL,
    customer_gender NVARCHAR(50) NULL
);

CREATE TABLE dbo.Fact_Incident (
    incident_id NVARCHAR(50) NOT NULL PRIMARY KEY,
    created_date DATETIME2 NULL,
    resolved_date DATETIME2 NULL,
    priority NVARCHAR(20) NULL,
    severity NVARCHAR(50) NULL,
    status NVARCHAR(100) NULL,
    category NVARCHAR(100) NULL,
    sub_category NVARCHAR(100) NULL,
    assignment_group NVARCHAR(150) NULL,
    resolver NVARCHAR(150) NULL,
    sla_target_hours DECIMAL(18,2) NULL,
    resolution_time_hours DECIMAL(18,2) NULL,
    reopened_flag BIT NULL,
    sla_breach_flag BIT NULL,
    customer_id NVARCHAR(50) NULL,
    ticket_subject NVARCHAR(500) NULL,
    ticket_description NVARCHAR(MAX) NULL,
    resolution NVARCHAR(MAX) NULL,
    customer_satisfaction_rating DECIMAL(5,2) NULL,
    CONSTRAINT FK_FactIncident_Customer
        FOREIGN KEY (customer_id) REFERENCES dbo.Dim_Customer(customer_id)
);

CREATE INDEX IX_FactIncident_CreatedDate ON dbo.Fact_Incident(created_date);
CREATE INDEX IX_FactIncident_CustomerID ON dbo.Fact_Incident(customer_id);
CREATE INDEX IX_FactIncident_Priority ON dbo.Fact_Incident(priority);
CREATE INDEX IX_FactIncident_Category ON dbo.Fact_Incident(category);
CREATE INDEX IX_FactIncident_AssignmentGroup ON dbo.Fact_Incident(assignment_group);

