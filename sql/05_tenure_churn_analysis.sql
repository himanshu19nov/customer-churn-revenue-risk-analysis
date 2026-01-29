-- Tenure-Based Churn Analysis
-- ---------------------------
-- Key Findings:
-- - Churn volume is highest in the first 6 months
-- - High-paying customers churn later but drive
--   disproportionate revenue loss
-- - Retention effectiveness improves significantly
--   after early lifecycle stages


WITH base AS (
    SELECT
        customer_id,
        churned,
        monthly_charges,
        tenure_months,
        CASE
            WHEN tenure_months < 6 THEN '0–6 months'
            WHEN tenure_months < 12 THEN '6–12 months'
            WHEN tenure_months < 24 THEN '12–24 months'
            ELSE '24+ months'
        END AS tenure_bucket
    FROM fact_customer_churn
)

SELECT
    tenure_bucket,
    churned,
    COUNT(*) AS customers,
    ROUND(SUM(monthly_charges), 2) AS monthly_revenue,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges
FROM base
GROUP BY tenure_bucket, churned
ORDER BY tenure_bucket, churned;
