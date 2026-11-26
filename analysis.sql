-- Supermarket Sales Analysis using SQL
-- Dataset: supermarket_sales.csv from Kaggle

-- 1. Total Sales by Branch
SELECT Branch, City,
COUNT(*) AS total_transactions,
ROUND(SUM(Total), 2) AS total_sales
FROM supermarket_sales
GROUP BY Branch, City
ORDER BY total_sales DESC;

-- 2. Total Sales by Product Line
SELECT `Product line`,
COUNT(*) AS total_orders,
ROUND(SUM(Total), 2) AS total_sales,
ROUND(AVG(Rating), 2) AS avg_rating
FROM supermarket_sales
GROUP BY `Product line`
ORDER BY total_sales DESC;

-- 3. Sales by Payment Method
SELECT Payment,
COUNT(*) AS total_transactions,
ROUND(SUM(Total), 2) AS total_sales
FROM supermarket_sales
GROUP BY Payment
ORDER BY total_sales DESC;

-- 4. Sales by Customer Type & Gender
SELECT `Customer type`, Gender,
COUNT(*) AS total_customers,
ROUND(SUM(Total), 2) AS total_sales
FROM supermarket_sales
GROUP BY `Customer type`, Gender
ORDER BY total_sales DESC;

-- 5. Top 5 Best Selling Product Lines by Quantity
SELECT `Product line`,
SUM(Quantity) AS total_quantity_sold
FROM supermarket_sales
GROUP BY `Product line`
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- 6. Monthly Sales Trend (Window Function)
SELECT DATE_FORMAT(Date, '%Y-%m') AS month,
ROUND(SUM(Total), 2) AS monthly_sales,
ROUND(SUM(SUM(Total)) OVER (ORDER BY DATE_FORMAT(Date, '%Y-%m')), 2) AS running_total
FROM supermarket_sales
GROUP BY month
ORDER BY month;

-- 7. Ranking Product Lines using CTE
WITH product_sales AS (
SELECT `Product line`, ROUND(SUM(Total), 2) AS total_sales
FROM supermarket_sales
GROUP BY `Product line`
)
SELECT `Product line`, total_sales,
RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM product_sales;
