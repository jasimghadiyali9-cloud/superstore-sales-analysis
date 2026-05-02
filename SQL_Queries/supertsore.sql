CREATE DATABASE superstore_db;
USE superstore_db;

CREATE TABLE customer (
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Customer_type VARCHAR(50),
    Order_size VARCHAR(50)
);

CREATE TABLE product (
    Product_ID VARCHAR(50),
    Product_Name VARCHAR(200),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_performance_flag VARCHAR(20)
);

CREATE TABLE geography (
    Postal_Code INT,
    City VARCHAR(100),
    State VARCHAR(100),
    Region VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE delivery (
    Order_ID VARCHAR(50),
    Ship_Mode VARCHAR(50),
    Delivery_status VARCHAR(50),
    Delivery_days INT
);

CREATE TABLE orders (
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Customer_ID VARCHAR(50),
    Product_ID VARCHAR(50),
    Postal_Code INT,
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT,
    Sales_per_unit FLOAT,
    Discount_amount FLOAT,
    Final_price FLOAT,
    High_discount VARCHAR(10)
);


-- 1. Total ales,profit and orders 
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders;
--  2.Monthly trend
SELECT 
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Monthly_Sales
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;
-- 3. Customers by Segment
SELECT 
    c.Segment,
    COUNT(DISTINCT c.Customer_ID) AS Total_Customers
FROM customer c
GROUP BY c.Segment;
-- 4. Top spending customer
SELECT 
    c.Customer_Name,
    SUM(o.Sales) AS Total_Sales
FROM orders o
JOIN customer c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;
-- 5. Loss making prods
SELECT 
    p.Product_Name,
    SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN product p ON o.Product_ID = p.Product_ID
GROUP BY p.Product_Name
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC;
-- 6. Which customers give high sales but low profit?
SELECT 
    c.Customer_Name,
    SUM(o.Sales) AS Total_Sales,
    SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN customer c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
HAVING Total_Sales > 5000 AND Total_Profit < 0
ORDER BY Total_Sales DESC;
-- 7. Discount vs Profit relationship
SELECT 
    High_discount,
    COUNT(*) AS Orders,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY High_discount;
-- 8. Which category has highest discount dependency?
SELECT 
    p.Category,
    AVG(o.Discount) AS Avg_Discount
FROM orders o
JOIN product p ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Avg_Discount DESC;

-- 9. Which segment gives best profit per order?
SELECT 
    c.Segment,
    AVG(o.Profit) AS Profit_per_Order
FROM orders o
JOIN customer c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Segment
ORDER BY Profit_per_Order DESC;

-- 10 Repeat vs one-time customers (VERY GOOD INSIGHT)
SELECT 
    Customer_ID,
    COUNT(DISTINCT Order_ID) AS Order_Count
FROM orders
GROUP BY Customer_ID
Order by  Order_count desc
Limit 10;

-- 11.Which ship mode takes up  most days?
SELECT 
    Ship_Mode,
    AVG(Delivery_days) AS Avg_Delivery,
    COUNT(*) AS Orders
FROM delivery
GROUP BY Ship_Mode
ORDER BY Avg_Delivery DESC;
-- 12 Frequently sold but less profitable prods 
SELECT 
    p.Product_Name,
    COUNT(*) AS Order_Count,
    SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN product p ON o.Product_ID = p.Product_ID
GROUP BY p.Product_Name
HAVING Order_Count > 10 AND Total_Profit < 0
ORDER BY Total_Profit ASC;

-- 13. Loss making sub cats 
SELECT 
    p.Sub_Category,
    SUM(o.Profit) AS Total_Profit
FROM orders o
JOIN product p 
    ON o.Product_ID = p.Product_ID
GROUP BY p.Sub_Category
HAVING SUM(o.Profit) < 0
ORDER BY Total_Profit ASC;