-- Pareto Analysis: Revenue Risk Concentration
-- -------------------------------------------
-- Objective:
--   Identify the minimum number of churned customers
--   required to account for ~80% of monthly revenue at risk.
--
-- Key Finding:
--   ~1,248 churned customers (~67% of churned base)
--   account for ~80% of churn-related monthly revenue exposure.
--
-- Implication:
--   Retention efforts should be concentrated on a
--   relatively small subset of high-impact customers.



WITH churned_revenue AS (
    SELECT
        customer_id,
        monthly_charges
    FROM fact_customer_churn
    WHERE churned = 1
),
ranked AS (
    SELECT
        customer_id,
        monthly_charges,
        SUM(monthly_charges) OVER (ORDER BY monthly_charges DESC) AS cumulative_revenue,
        SUM(monthly_charges) OVER () AS total_revenue
    FROM churned_revenue
)
SELECT
    COUNT(*) AS customers_needed,
    ROUND(MAX(cumulative_revenue), 2) AS revenue_covered,
    ROUND(1.0 * MAX(cumulative_revenue) / MAX(total_revenue), 4) AS pct_revenue_covered
FROM ranked
WHERE cumulative_revenue <= 0.8 * total_revenue;
