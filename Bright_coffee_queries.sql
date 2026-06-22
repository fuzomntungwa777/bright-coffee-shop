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

---Which store location had the highest revenue

SELECT store_location,
        ROUND(SUM(CAST(REPLACE(unit_price, ',','.') AS DOUBLE) *transaction_qty),2) AS total_revenue_per_store
FROM bright_coffee_shop_sales
GROUP BY store_location;
