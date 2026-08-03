CREATE DATABASE IF NOT EXISTS SALESDATA;
USE SALESDATA;

CREATE TABLE superstore_sales (
    order_id VARCHAR(20),
    order_date DATE,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    product_category VARCHAR(100),
    sales DECIMAL(12,2),
    quantity INT,
    profit DECIMAL(12,2),
    discount DECIMAL(5,2)
);
SELECT * FROM superstore_sales;
/*Total Sales by Region*/
SELECT region, sum(sales) AS Total_region
FROM superstore_sales
GROUP BY region
ORDER BY sum(sales) DESC;

/*Top 5 Profitable Products*/
SELECT product_category, sum(profit) AS total_profit
FROM superstore_sales
GROUP BY product_category
ORDER BY total_profit DESC
LIMIT 5;

/*Monthly Sale Trend */
SELECT MONTH(order_date) AS month, sum(sales) AS total_sales
FROM superstore_sales
GROUP BY month
ORDER BY month;

/*Highest Discount Impact*/
SELECT discount , avg(profit)
FROM superstore_sales
GROUP BY discount;
