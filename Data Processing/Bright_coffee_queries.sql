-- Databricks notebook source
USE brightlearn.data;

-- COMMAND ----------

---Preview of table
SELECT *
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Listing unique/distinct product category
SELECT DISTINCT product_category
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Listing unique/distinct product type
SELECT DISTINCT product_type
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Listing unique/distinct product details
SELECT DISTINCT product_detail
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Determining distinct shop locations
SELECT DISTINCT store_location
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Determining how much of each product category was bought

SELECT DISTINCT product_category,
       COUNT(transaction_id) AS total_per_product_category
FROM bright_coffee_shop_sales
GROUP BY product_category;

-- COMMAND ----------

---Determining average revenue

SELECT AVG(ROUND((CAST(REPLACE(unit_price, ',','.') AS DOUBLE) *transaction_qty),2)) AS average_revenue
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Which store location had the highest revenue

SELECT store_location,
        ROUND(SUM(CAST(REPLACE(unit_price, ',','.') AS DOUBLE) *transaction_qty),2) AS total_revenue_per_store
FROM bright_coffee_shop_sales
GROUP BY store_location;

-- COMMAND ----------

---Which store location had the highest revenue

SELECT
        ROUND(SUM(CAST(REPLACE(unit_price, ',','.') AS DOUBLE) *transaction_qty),2) AS total_revenue
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Top 5 most expensive purchases
SELECT *,
       CAST(REPLACE(unit_price, ',','.') AS DOUBLE) *transaction_qty AS revenue
FROM bright_coffee_shop_sales
ORDER BY revenue DESC
LIMIT 5;

-- COMMAND ----------

---Changing time format
SELECT transaction_time,
        DATE_FORMAT(transaction_time, 'HH:mm:ss') AS Clean_time
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Creating time bucket
SELECT transaction_time,
        DATE_FORMAT(transaction_time, 'HH:mm:ss') AS Clean_time,
        CASE
            WHEN HOUR(transaction_time) BETWEEN 06 AND 11 THEN 'Morning'
            WHEN HOUR(transaction_time) BETWEEN 12 AND 18 THEN 'Afternoon'
            ELSE 'Evening'
        END AS time_bucket
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Determining the day of month for each transaction

SELECT Transaction_date,
       DAYOFMONTH (transaction_date) AS day_of_month
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Categorizing days into 3 periods of the month based on the day of month

SELECT transaction_date,
    CASE
        WHEN DAYOFMONTH(transaction_date) BETWEEN 1 AND 10 THEN 'Early Month'
        WHEN DAYOFMONTH(transaction_date) BETWEEN 11 AND 20 THEN 'Mid Month'
    ELSE 'Month End'
    END AS month_period
FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Categorizing dates into weekdays and weekends

SELECT DAYOFWEEK(transaction_date),
        CASE 
            WHEN DAYNAME (transaction_date) IN ('Sat','Sun') THEN 'Weekend'
            ELSE 'Weekday'
        END AS day_type
FROM  bright_coffee_shop_sales;

-- COMMAND ----------

---Categorizing by the type of spend each transaction is

SELECT ROUND((CAST(REPLACE(unit_price, ',','.') AS DOUBLE) *transaction_qty),2) AS revenue_per_row,
    CASE 
        WHEN (transaction_qty * CAST(REPLACE(unit_price, ',','.') AS DOUBLE)) <=50 THEN 'Cheap Spend'
        WHEN (transaction_qty * CAST(REPLACE(unit_price, ',','.') AS DOUBLE)) BETWEEN 51 AND 200 THEN 'Low Spend'
        WHEN (transaction_qty * CAST(REPLACE(unit_price, ',','.') AS DOUBLE)) BETWEEN 201 AND 300 THEN 'Medium Spend'
    ELSE 'Expensive Spend'
    END AS spend_bucket

FROM bright_coffee_shop_sales;

-- COMMAND ----------

---Final Big Query with all new columns

SELECT transaction_id,
       transaction_date,
       DATE_FORMAT(transaction_time, 'HH:mm:ss') AS clean_time,
       store_id,
       store_location,
       product_id,
       unit_price,
       transaction_qty,
       product_category,
       product_type,
       product_detail,
       DAYNAME(transaction_date) as day_name,
       MONTHNAME(transaction_date) as month_name,
       DAYOFMONTH(transaction_date) as day_number,

       CASE 
            WHEN DAYNAME (transaction_date) IN ('Sat','Sun') THEN 'Weekend'
            ELSE 'Weekday'
        END AS day_type,
    
        CASE
            WHEN HOUR(transaction_time) BETWEEN 06 AND 11 THEN 'Morning'
            WHEN HOUR(transaction_time) BETWEEN 12 AND 18 THEN 'Afternoon'
            ELSE 'Evening'
        END AS time_bucket,

        CASE
            WHEN DAYOFMONTH(transaction_date) BETWEEN 1 AND 10 THEN 'Early Month'
            WHEN DAYOFMONTH(transaction_date) BETWEEN 11 AND 20 THEN 'Mid Month'
            ELSE 'Month End'
        END AS month_period,

        CAST(REPLACE(unit_price, ',','.') AS DOUBLE) AS clean_unit_price,

        ROUND((CAST(REPLACE(unit_price, ',','.') AS DOUBLE) *transaction_qty),2) AS revenue_per_row,

        CASE 
            WHEN (transaction_qty * CAST(REPLACE(unit_price, ',','.') AS DOUBLE)) <=50 THEN 'Cheap Spend'
            WHEN (transaction_qty * CAST(REPLACE(unit_price, ',','.') AS DOUBLE)) BETWEEN 50 AND 100 THEN 'Medium Spend'
            ELSE 'Expensive Spend'
        END AS spend_bucket

FROM bright_coffee_shop_sales;

