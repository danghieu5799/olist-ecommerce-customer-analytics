# ETL Process using SSIS

## Overview

This folder contains the SQL Server Integration Services (SSIS) project used to build the ETL pipeline for the Olist E-commerce Customer Analytics project.

The ETL process extracts raw data from source files, transforms the data, and loads it into a structured Data Warehouse environment.

---

## ETL Workflow

Raw CSV Files

↓

Staging Tables

↓

Data Transformation

↓

Dimension Tables

↓

Fact Tables

↓

Data Warehouse

↓

Power BI Dashboard

---

## Tools

* SQL Server
* SSMS
* SSIS (SQL Server Integration Services)

---

## Key ETL Activities

### Extract

Imported raw Olist datasets into staging tables.

### Transform

Performed data cleansing and transformation.

### Load

Loaded processed data into Fact and Dimension tables following a Star Schema design.

---

## Output

The ETL pipeline generated a structured Data Warehouse used for:

* Customer Segmentation
* Revenue Analysis
* Cohort Analysis
* Power BI Reporting

---

## Related Files

* Package.dtsx
* ETL SSIS.dtproj
