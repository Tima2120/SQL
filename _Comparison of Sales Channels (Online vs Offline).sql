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