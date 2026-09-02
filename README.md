# Car Sales SQL Analysis

## Project Overview
This project analyses a car-sales dataset to understand sales volume, pricing patterns, vehicle distribution, and data-quality issues across US states.

## Objectives
- Clean and standardize the imported dataset
- Identify missing or inconsistent transmission values
- Analyse sales volume by state
- Explore vehicle makes and models
- Compare average selling prices by state and month
- Track monthly sales activity

## Tools Used
- MySQL
- SQL: aggregation, CASE statements, string functions, temporary tables, grouping and ordering

## Key Data-Cleaning Work
- Corrected misplaced commas during CSV import using MySQL import settings
- Reviewed state values for consistency
- Investigated missing or irregular transmission values
- Extracted year, month, and day fields from the sales-date text column

## Business Questions
1. How many vehicle sales occurred in each state?
2. Which makes and models appear most frequently in the dataset?
3. What is the average selling price in each state?
4. How does average selling price change by month?
5. How many cars were sold each month?
