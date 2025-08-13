Sales Trend Analysis – SQL Project
📌 Overview
This project analyzes sales data to identify monthly revenue trends and find the top 3 highest revenue months.
The dataset comes from a sample commerce database containing multiple tables:

orders – Order details including order dates.

order_items – Items purchased with quantity and price.

🎯 Objectives
Calculate monthly revenue and order volume.

Identify the top 3 months by revenue.

🛠️ Tools Used
MySQL Workbench – For SQL query execution and data export.

CSV – For storing query outputs.

📂 Files in this Repository
task06_sales_trend_analysis.sql → Contains SQL queries for both tasks.

monthly_summary.csv → Output of monthly revenue & order volume query.

top3_months_by_revenue.csv → Output of top 3 months by revenue query.

📊 Queries Used
1️⃣ Monthly Revenue & Order Volume
sql
Copy
Edit
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
2️⃣ Top 3 Months by Revenue
sql
Copy
Edit
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
📌 Insights
Helps track sales performance trends over time.

Identifies peak months to inform business strategies.
