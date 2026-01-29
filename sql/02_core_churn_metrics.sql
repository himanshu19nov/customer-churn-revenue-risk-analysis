SELECT
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(1.0 * SUM(churned) / COUNT(*), 4) AS churn_rate
FROM fact_customer_churn;







SELECT
    SUM(monthly_charges) AS total_monthly_revenue_at_risk
FROM fact_customer_churn
WHERE churned = 1;



SELECT
    churned,
    COUNT(*) AS customers,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges,
    ROUND(AVG(total_revenue), 2) AS avg_lifetime_revenue
FROM fact_customer_churn
GROUP BY churned;


-- =========================================================
-- Core Churn & Revenue Metrics
-- ---------------------------------------------------------
-- Purpose:
--   Establish baseline churn rate and quantify revenue risk
--   at a single quarterly snapshot.
--
-- Key Findings:
--   - Overall churn rate: 26.54%
--   - Churned customers: 1,869 out of 7,043
--   - Monthly revenue at risk: $139,130.85
--
-- Insight:
--   Churned customers have higher average monthly charges
--   but lower lifetime revenue, indicating early lifecycle
--   churn among higher-paying customers.
-- =========================================================




