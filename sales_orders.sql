CREATE TABLE sales_orders(
	order_id VARCHAR(50) PRIMARY KEY,
	date Date,
	country VARCHAR(100),
	category VARCHAR(100),
	customer_name VARCHAR(150),
	sales_manager VARCHAR(100),
	sales_rep VARCHAR(100),
	device_type VARCHAR(50),
	order_value_eur NUMERIC,
	cost NUMERIC,
	profit_eur NUMERIC,
	profit_margin NUMERIC
	);
-- 1. Total revenue,cost,profit
SELECT 
	ROUND(SUM(order_value_eur),2) AS total_revenue,
	ROUND(SUM(cost),2) AS total_cost,
	ROUND(Sum(profit_eur),2) AS total_profit
FROM sales_orders;

--2. revenue by country
SELECT country,SUM(order_value_eur) AS revenue
FROM sales_orders
GROUP BY country
ORDER BY revenue DESC;

-- 3. Monthly Trends
SELECT DATE_TRUNC('month',date) AS month,SUM(order_value_eur) AS revenue
FROM sales_orders
GROUP BY month
ORDER BY month;

-- 4.Profit margin by category
SELECT category,ROUND(AVG(profit_margin),2) AS avg_margin
FROM sales_orders
GROUP BY category
ORDER BY avg_margin DESC;
