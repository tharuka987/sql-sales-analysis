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
