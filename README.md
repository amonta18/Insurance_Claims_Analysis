# Insurance_Claims_Analysis
## Project Overview

### This project analyzes 1,000 insurance claims using PostgreSQL and SQL to identify pattern in claim volume, claim severity, claim costs, reported fraud, policy characteristics, and vehicle characteristics. 
### The goal of the analysis is to answer business-focused questions that could help an insurance company better understand its claims data and identify patterns that may warrant further investigation. 

## Tools Used
 * PostgreSQL
 * SQL
 * pgAdmin
 * Microsoft Excel

## Dataset
### The dataset contains 1,000 insurance claims and includes information about:
  * Policy characteristics
  * Customer characteristics
  * Incident type and severity
  * Incident location
  * Claim amounts
  * Vehicle information
  * Reported fraud
### The data was initially reviewed and formatted in Excel before being imported into PostgreSQL for analysis. 

## Business Questions
### The analysis focused on the following questions:
  1. What does the insurance claims dataset look like overall?
  2. Which types of incidents account for the most claims?
  3. How does incident severity relate to claim cost?
  4. How do reported-fraud claims compare with non-fraud claims?
  5. Which incident types have the highest claim costs?
  6. How does average claim cost vary across policy deductible amounts?
  7. Which vehicle makes have the highest average claim costs?
  8. Which combinations of incident type and occupation have the highest reported-fraud rates?

## SQL Analysis
### The analysis uses SQL techniques including:
  * SELECT
  * WHERE
  * GROUP BY
  * HAVING
  * ORDER BY
  * COUNT()
  * SUM()
  * AVG()
  * MIN()
  * MAX()
  * CASE statements
  * Calculated percentages
  * Subqueries
## Key Findings
### Claim Patterns
  * Multi-vehicle collisions were the most common incident type, accounting for 41.9% of all claims.
  * Single-vehicle collisions accounted for 40.3% of claims and had the highest average claim amount at $64,445.46.
### Claim Severity
  * Major-damage claims had the highest average claim amount at $64,067.17.
  * Total-loss claims had the second-highest average at $62,081.21.
  * Trivial-damage claims had a substantially lower average claim amount of $5,301.67.
### Reported Fraud
* 24.7% of claims were reported as fraud.
* Claims reported as fraud had an average claim amount of $60,302.11, compared with $50,288.61 for claims not reported as         fraud.
* Among occupations with at least 20 claims, exec-managerial had the highest reported-fraud rate at 36.84%.
* The highest incident-type and occupation combination was single-vehicle collisions among tech-support occupations, with a      reported-fraud rate of 48.39%.
### Location
* New York had the highest average claim amount among incident states at $56,388.44.
* New York also represented the largest share of claims, with 26.2% of all claims.
### Vehicle Characteristics
* Ford had the highest average claim amount among vehicle makes with at least 20 claims, at $56,570.14.
* Toyota had the lowest average claim amount among the analyzed vehicle makes at $46,523.71.

## Important Considerations
### These Findings describe patterns and relationships within the dataset. They do not establish that a particular occupation, vehicle make, location, or incident type causes higher claim costs or fraud. 
### The fraud analysis reflects reported fraud, rather than confirmed insurance fraud. 
### Vehicle make comparisons were limited to makes with at least 20 claims to reduce the influence of very small sample sizes. 

## Project Files
  * insurance_claims_analysis.sql -- SQL queries used to analyze the insurance claims dataset.

## Project Purpose
### This project demonstrates my ability to use SQL and PostgreSQL to cleanly organize data analysis, answer business questions, calculates summary statistics, identify patterns, and communicate findings in a business-focused way. 

## Screenshots
### SQL Analysis
![SQL Analysis](screenshots/sql_analysis.png)
### Fraud Analysis
![Fraud Analysis](screenshots/fraud_results.png)
### Claim Severity Analysis
![Claim Severity Analysis](screenshots/severity_analysis.png)
