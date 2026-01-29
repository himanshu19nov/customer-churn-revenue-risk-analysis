# Customer Churn & Revenue Risk Analysis

## Project Overview

This project presents a **cross-sectional customer churn and revenue risk analysis** for a B2C subscription-based business using a single quarterly reporting snapshot. The analysis focuses on identifying customer segments and service configurations associated with higher churn rates and estimating the amount of recurring revenue exposed to churn.

Due to the absence of transaction-level payment data, churn is modeled as a **snapshot-based customer state** rather than a time-series process. The project prioritizes clean data modeling, defensible assumptions, and business-relevant segmentation.

The analysis emphasizes customer prioritization and revenue protection rather than temporal churn trends.
---

## Business Objectives

The primary objectives of this analysis are to:

- Quantify the proportion of customers who are churned at the reporting snapshot  
- Identify customer, service, and demographic segments with elevated churn rates  
- Estimate recurring revenue at risk due to customer churn  

This analysis is intended to support revenue, finance, and product stakeholders in understanding churn exposure and prioritizing retention efforts.

---

## Analytical Approach

- Churn is treated as a **binary customer state** evaluated at a fixed quarterly snapshot  
- A **star schema** is used to separate measurable outcomes from descriptive attributes  
- A central fact table (`fact_customer_churn`) is supported by customer, service, demographic, and date dimensions  
- Revenue impact is estimated using recurring charges as a proxy for revenue at risk  
- Churn exposure is prioritized using revenue-based segmentation to distinguish high-impact churned customers
- Customer lifecycle context is inferred using tenure-based buckets rather than time-series trends


All assumptions and constraints are explicitly documented to avoid overstating analytical precision.

---

## Tools & Technologies

- **Python** (pandas, numpy) — data cleaning, transformation, and modeling  
- **SQL** — validation queries and segmentation analysis  
- **Power BI** — data modeling, DAX measures, and dashboards  

---



