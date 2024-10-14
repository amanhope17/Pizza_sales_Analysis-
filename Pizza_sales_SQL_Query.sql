SELECT *FROM pizza_sales

--- 1 Total Revenue ---
SELECT ROUND(SUM(total_price),2) AS Total_Revenue FROM pizza_sales

---2 Average Order Value ---
SELECT ROUND(SUM(total_price)/COUNT(DISTINCT(order_id)),2) AS Avg_Order_Value FROM pizza_sales

---3 Total Pizza Sold ---
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales

---4 Total Orders ---
SELECT COUNT(DISTINCT(order_id)) AS Total_Orders FROM pizza_sales

---5 Avg Pizzas Per Order ---
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT(order_id)) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales

---6 Dail Trend For Total Order---
SELECT DATENAME(DW , order_date) AS Order_Day , COUNT(DISTINCT(order_id)) AS Total_Order FROM pizza_sales GROUP BY DATENAME(DW , order_date)

---7 Monthly Trend For Order---
SELECT DATENAME(MONTH , order_date) AS Order_Month , COUNT(DISTINCT(order_id)) AS Total_Order FROM pizza_sales GROUP BY DATENAME(MONTH , order_date) ORDER BY Total_Order DESC

---8 % of sales by pizza Category ---
SELECT ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) AS Percentage_of_sales_by_pizza_category , pizza_category FROM pizza_sales GROUP BY pizza_category

---9 % of sales by pizza Size---
SELECT ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) AS Percentage_of_sales_by_pizza_size , pizza_size FROM pizza_sales GROUP BY pizza_size order by pizza_size

---10 Total Pizza Sold by pizza Category ---
SELECT SUM(quantity) AS Total_pizza_sold_by_pizza_category , pizza_category FROM pizza_sales GROUP BY pizza_category ORDER BY Total_pizza_sold_by_pizza_category

---11 Top 5 pizza By Revenue---
SELECT TOP 5 SUM(total_price) AS Revenue , pizza_name FROM pizza_sales GROUP BY pizza_name ORDER BY Revenue DESC

---12 Bottom 5 pizza By Revenue---
SELECT TOP 5 SUM(total_price) AS Revenue , pizza_name FROM pizza_sales GROUP BY pizza_name ORDER BY Revenue 

---13 Top 5 pizza By quantity---
SELECT TOP 5 SUM(quantity) AS Quantity , pizza_name FROM pizza_sales GROUP BY pizza_name ORDER BY Quantity DESC

---14 Bottom 5 pizza By quantity---
SELECT TOP 5 SUM(quantity) AS Quantity , pizza_name FROM pizza_sales GROUP BY pizza_name ORDER BY Quantity 

---15 Top 5 pizza By Total_Order---
SELECT TOP 5 COUNT(DISTINCT(order_id)) AS Total_order , pizza_name FROM pizza_sales GROUP BY pizza_name ORDER BY Total_order DESC

---16 Bottom 5 pizza By Total_Order---
SELECT TOP 5 COUNT(DISTINCT(order_id)) AS Total_order , pizza_name FROM pizza_sales GROUP BY pizza_name ORDER BY Total_order 