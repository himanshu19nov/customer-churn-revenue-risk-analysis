-- Validate row count and analytical grain
SELECT
    COUNT(*) AS rows,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM fact_customer_churn;

-- Check churn distribution
SELECT
    churned,
    COUNT(*) AS customers
FROM fact_customer_churn
GROUP BY churned;

-- Check for unexpected nulls in key fields
SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN churned IS NULL THEN 1 ELSE 0 END) AS null_churned,
    SUM(CASE WHEN monthly_charges IS NULL THEN 1 ELSE 0 END) AS null_monthly_charges,
    SUM(CASE WHEN total_revenue IS NULL THEN 1 ELSE 0 END) AS null_total_revenue,
    SUM(CASE WHEN tenure_months IS NULL THEN 1 ELSE 0 END) AS null_tenure
FROM fact_customer_churn;
