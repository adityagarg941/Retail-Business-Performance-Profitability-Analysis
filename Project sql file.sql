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

with prod as
(SELECT `Product Name`, Category, `Sub-Category`, 
       SUM(profit) AS total_profit
FROM cleaned_store_dataset
GROUP BY `Product Name`, Category, `Sub-Category`
ORDER BY total_profit ASC
LIMIT 10)

select prod.`Product Name`, prod.total_profit, `Order Date` from superstore
join prod
on prod.`Product Name` = supersore.`Product Name`;


-- Region wise Discount

select round(avg(Discount),2) as average discount , Region from superstore
group by Region;

select State, sum(Sales)
from superstore
group by State
order by sum(Sales) desc
limit 1;

select `Customer Name` , count(distinct `Order ID`) as Count
from superstore
group by `Customer Name`
having Count > 2
order by Count desc;

select City , round(sum(Sales),2) as Total_Sales from superstore
group by City
having Total_Sales > 10000
order by Total_Sales desc;

select `Product Name` from superstore
where Profit = 0 and Sales > 0;

select `Sub-Category` from superstore
group by `Sub-Category`
having Max(Discount) = 0;

select `Customer Name`, Region,
Rank () over( Partition by Region order by Profit desc)
from superstore;

select * from superstore where `Customer Name` regexp '[aeiou]{3}';

select `Customer Name` from superstore;


create view first_name as
select substring_index(`Customer Name`," ",1) from superstore;
select * from first_name;

select cast(`Ship Date` as int) from superstore;

select distinct(substring_index(`Ship Mode`, " ",1)) from superstore;

SELECT 
    CASE 
        WHEN MONTH(create_date) in (7,8,9,10) THEN 'Q1'
        WHEN MONTH(create_date) in (11,12,1,2) THEN 'Q2'
        WHEN MONTH(create_date) in (3,4,5,6) THEN 'Q3'
        ELSE 'Q4'
    END AS fiscal_quarter,
    SUM(total_amount) AS total_sales
FROM orders
GROUP BY fiscal_quarter;





















select * from superstore;

select distinct `Ship Mode` from cleaned_store_dataset;

select count(distinct `Order ID`) from superstore;

select Category , round(sum(Sales),2) from superstore
group by Category;


select count(distinct `Customer Name`) from superstore;

select sum(Profit) from superstore
where `Sub-Category` = 'Chairs';

select `Product Name`, sum(sales) from superstore
group by `Product Name`
order by sum(sales) desc
limit 10;

select min(`Order Date`), max(`Order Date`)
from superstore;

select Region, round(avg(discount),2) from superstore
group by Region;

select `Sub-Category`, count(distinct `Product ID`) from
superstore
group by `Sub-Category`; 













select State , sum(sales) as Total_Sales from superstore
group by State
order by Total_Sales desc
limit 1;

select `Customer ID`, `Customer Name`, count(distinct `Order ID`) from superstore
group by `Customer ID`, `Customer Name`
having Quantity > 2;




select * from superstore;
where Profit < 0;


select City, sum(sales) from superstore
group by City
having sum(sales) > 10000;

select `Product Name`, Profit, sum(sales) from superstore
where (Profit = 0 and sum(sales) > 0);

SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
    COUNT(DISTINCT customer_id) AS retained_customers
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE order_date < DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
)
GROUP BY month;



