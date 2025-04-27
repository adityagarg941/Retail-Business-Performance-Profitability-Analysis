use project;

select * from cleaned_store_dataset;

show columns from cleaned_store_dataset;

-- Total Sales, Profit, and Margin by Category

select category, round(sum(Sales),2) Total_Sales , round(sum(Profit),2) Total_Profit, round((sum(profit)/sum(sales)*100),2) Margin
from cleaned_store_dataset
group by Category;

-- Region-wise Profit Performance

select Region, round(sum(Profit),2) Profit from cleaned_store_dataset
group by Region
order by Profit desc;

-- Monthly Sales Trend (Seasonality)

SELECT MONTH(`Order Date`) AS month,
       category,
       SUM(Sales) AS monthly_sales
FROM cleaned_store_dataset
GROUP BY MONTH(`Order Date`), category;

-- Top 10 Loss-Making Products

SELECT `Product Name`, Category, `Sub-Category`, 
       SUM(profit) AS total_profit
FROM cleaned_store_dataset
GROUP BY `Product Name`, Category, `Sub-Category`
ORDER BY total_profit ASC
LIMIT 10;


































select distinct `Ship Mode` from cleaned_store_dataset;

select count(distinct `Order ID`) from superstore;

select Category , round(sum(Sales),2) from superstore
group by Category;


















select State , sum(sales) as Total_Sales from superstore
group by State
order by Total_Sales desc
limit 1;

select `Customer ID`, `Customer Name`, count(distinct `Order ID`) from superstore
group by `Customer ID`, `Customer Name`
having Quantity > 2;




select * from superstore
where Profit < 0;


select City, sum(sales) from superstore
group by City
having sum(sales) > 10000;

select `Product Name`, Profit, sum(sales) from superstore
where (Profit = 0 and sum(sales) > 0);

select 


