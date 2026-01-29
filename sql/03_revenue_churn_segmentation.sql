-- Revenue × Churn Quadrant Segmentation
-- -----------------------------------
-- Median monthly charges: $70.35
-- Customers are classified into high/low revenue
-- and churned/retained segments to prioritize
-- retention and revenue protection efforts.


SELECT monthly_charges AS median_monthly_charges
FROM fact_customer_churn
ORDER BY monthly_charges
LIMIT 1
OFFSET (SELECT COUNT(*)/2 FROM fact_customer_churn);

WITH base AS (
    SELECT
        customer_id,
        churned,
        monthly_charges,
        total_revenue,
        tenure_months,
        CASE
            WHEN monthly_charges >= 70.35 THEN 'High Revenue'
            ELSE 'Low Revenue'
        END AS revenue_segment
    FROM fact_customer_churn
)

SELECT
    revenue_segment,
    churned,
    COUNT(*) AS customers,
    ROUND(SUM(monthly_charges), 2) AS monthly_revenue,
    ROUND(AVG(tenure_months), 1) AS avg_tenure_months
FROM base
GROUP BY revenue_segment, churned
ORDER BY revenue_segment, churned;
