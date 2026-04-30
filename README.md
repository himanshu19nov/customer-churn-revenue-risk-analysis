# Customer Churn & Revenue Risk Analysis

## Project Overview

This project presents a **cross-sectional customer churn and revenue risk analysis** for a B2C subscription-based business using a single quarterly reporting snapshot. The analysis focuses on identifying customer segments and service configurations associated with higher churn rates and estimating the amount of recurring revenue exposed to churn.

Due to the absence of transaction-level payment data, churn is modeled as a **snapshot-based customer state** rather than a time-series process. T

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

## Key findings

| Metric | Value |
|---|---|
| Total customers | 7,043 |
| Churned customers | 1,869 |
| Overall churn rate | **26.54%** |
| Monthly revenue at risk | **$139,130.85** |
| Median monthly charges | $70.35 |

## Power BI Report
Three-page interactive report with slicers, bookmarks, and cross-page navigation:
Page 1 — Overview

- KPI cards: total customers, churn rate, monthly revenue at risk
- Churn rate by contract type and tenure bucket
- Recurring revenue at risk by contract type and tenure-based exposure
- Avg monthly charges: churned vs retained

<img width="1630" height="805" alt="image" src="https://github.com/user-attachments/assets/3f56bc3e-ba44-4e75-adc2-04360f1d4fb9" />


Page 2 — Tenure Segment Deep Dive

- Monthly charges distribution (binned histogram)
- Segment churn rate by internet type and payment method
- Segment insights card

<img width="1623" height="800" alt="image" src="https://github.com/user-attachments/assets/e8fa544a-bc9e-4537-b69f-fdc5373b82d3" />


Page 3 — Churn Drivers

- Key Drivers visual (Power BI AI visual) — automated driver ranking
- Revenue concentration analysis

<img width="1620" height="794" alt="image" src="https://github.com/user-attachments/assets/0a409bc3-4055-489c-92c9-89b513f5fea9" />

