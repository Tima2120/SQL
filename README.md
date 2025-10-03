# SQL
My SQL Project 

SELECT
    Category,
    COUNT(DISTINCT Order_ID) AS total_orders,         
    SUM(Units_Sold) AS total_units_sold,              
    Round(SUM(Revenue),2 ) AS total_revenue,                    
    Round(SUM(Profit),2 ) AS total_profit,                     
    ROUND(AVG(Unit_Price), 2) AS avg_price,           
    ROUND(AVG(Discount), 2) AS avg_discount,          
    ROUND(AVG(Customer_Age), 1) AS avg_customer_age   
FROM `dac5bigquery-470119.Adidas.Adidas_sales`
GROUP BY Category
ORDER BY total_revenue DESC; 


SELECT 
CASE
        WHEN Store_Type = 'Online' THEN 'Online' 
        WHEN Store_Type IN ('Retail', 'Outlet', 'Wholesale') THEN 'Physical (Offline)'
        ELSE 'Other' 
    END AS Channel_Type,
    Round(SUM(Revenue),2 ) AS Total_Revenue,
     Round((SUM(Revenue) * 100.0 / SUM(SUM(Revenue)) OVER ()),0) AS Percentage_of_Total_Revenue FROM `dac5bigquery-470119.Adidas.Adidas_sales` 
GROUP BY
    Channel_Type 

ORDER BY
    Total_Revenue DESC
