WITH churned_revenue AS (
    SELECT
        customer_id,
        total_revenue
    FROM fact_customer_churn
    WHERE churned = 1
),

ranked AS (
    SELECT
        customer_id,
        total_revenue,
        SUM(total_revenue) OVER (ORDER BY total_revenue DESC) AS cumulative_revenue,
        SUM(total_revenue) OVER () AS total_revenue_all
    FROM churned_revenue
)

SELECT
    COUNT(*) AS customers_needed,
    ROUND(MAX(cumulative_revenue), 2) AS revenue_covered,
    ROUND(1.0 * MAX(cumulative_revenue) / MAX(total_revenue_all), 4) AS pct_revenue_covered
FROM ranked
WHERE cumulative_revenue <= 0.8 * total_revenue_all;
