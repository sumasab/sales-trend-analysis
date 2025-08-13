USE commerce;

-- ========================================
-- Monthly Revenue & Order Volume
-- ========================================
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m-01') AS month_start,
    ROUND(SUM(oi.quantity * oi.price), 2) AS revenue,
    COUNT(DISTINCT o.order_id) AS order_volume
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_date IS NOT NULL
GROUP BY month_start
ORDER BY month_start;

-- ========================================
-- Top 3 Months by Revenue
-- ========================================
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m-01') AS month_start,
    ROUND(SUM(oi.quantity * oi.price), 2) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_date IS NOT NULL
GROUP BY month_start
ORDER BY revenue DESC
LIMIT 3;
