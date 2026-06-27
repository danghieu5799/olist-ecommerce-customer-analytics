# Data Warehouse Design

## Overview

A Data Warehouse was designed to support customer analytics, revenue analysis, retention analysis, and Power BI reporting for the Olist E-commerce project.

The warehouse follows a Star Schema design to improve analytical performance and simplify reporting.

---

## Architecture

Raw CSV Files

↓

Staging Tables

↓

ETL Process (SSIS)

↓

Dimension Tables

↓

Fact Tables

↓

Power BI Dashboard

---

## Star Schema

The Data Warehouse uses a Star Schema structure consisting of one Fact table and multiple Dimension tables.

---

## Fact Table

### FactSales

Stores transactional sales data used for business analysis.

Main metrics:

* Revenue
* Order Quantity
* Payment Value

---

## Dimension Tables

### DimCustomer

Customer information and attributes.

### DimProduct

Product information and categories.

### DimDate

Date attributes for time-based analysis.

### DimPayment

Payment methods and payment-related information.

---

## Benefits

* Improved reporting performance
* Simplified analytical queries
* Better support for customer segmentation
* Efficient integration with Power BI

---

## Related Components

* SQL Server
* SSMS
* SSIS
* Power BI
