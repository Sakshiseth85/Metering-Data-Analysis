select * from Data

/*Total Revenue: Sum of the total price of all meters */
select sum(Total_Revenue) as Total_Revenue_Sum
from Data

/*Average order value: Average amt. spent per order*/
select sum(Total_Revenue)/ count(distinct Sales_ID) as Average_Order_Value
from Data

/*Total Meters sold*/
select sum(Units_Sold) as Total_Meters_Sold
from data

/*Total_Order_Sales*/
select count(Sales_ID) as Total_Order_Sales
from data

/*Average meter units sold per Sale*/
select sum(Units_Sold)/count( distinct Sales_ID) as Averge_Meters_Per_Order
from Data

/*Percentsge of Units sales by meter category*/
select Meter_Type,concat((sum(Units_Sold) * 100)/(select sum(Units_Sold) from Data), '%') as Perc_of_Units_Sales_By_Category
from Data
group by Meter_Type 

/*Total meter sold by meter category*/
select Meter_Type,sum(Units_Sold) as Total_meter_sold 
from Data 
group by Meter_Type

/*Top Meter sellers by revenue, total quantity, total orders*/
select top 1 Meter_Type,sum(Total_Revenue) as Top_Revenue, sum(Units_Sold) as Quantity_Sold, count(Sales_ID) as Total_Sales_ID
from Data
group by Meter_Type
order by Top_Revenue DESC

select top 1 Meter_Type,sum(Total_Revenue) as Lowest_Revenue, sum(Units_Sold) as Quantity_Sold, count(Sales_ID) as Total_Sales_ID
from Data
group by Meter_Type
order by Lowest_Revenue 