-- NOW SOLVING THE VARIOUS QUESTIONS

-- Q1 sales in each state
SELECT state, count(*) as number_of_sales_per_state
from car_prices
group by state;

-- Q2  how many make and model do we have?
select make, model, count(*)
from car_prices
group by make, model;

-- Q3 avg state prices
select state, count(*), avg(sellingprice) as Avg_Selling_Price
from car_prices
group by state;

-- Q4 avg prices per month
-- here i need to change the saledate string from text to a date

-- creating sale_year, month and day
select saledate, mid(saledate,12,4) as sale_year,
mid(saledate,5,3) as sale_monthname,
mid(saledate,9,2) as sale_day
from car_prices
limit 1000;

-- now i sort out the various month with numbers for easy reference by using case statement
select saledate,
case mid(saledate,5,3)
	when 'Jan' then 1
    when 'Feb' then 2
    when 'Mar' then 3
    when 'Apr' then 4
    when 'May' then 5
    when 'Jun' then 6
    when 'Jul' then 7
    when 'Aug' then 8
    when 'Sep' then 9
    when 'Oct' then 10
    when 'Nov' then 11
    when 'Dec' then 12
    else 'None'
end as sale_month
from car_prices;

-- now i will merge these together.

select saledate,mid(saledate,12,4) as sale_year,
mid(saledate,5,3) as sale_monthname,
mid(saledate,9,2) as sale_day,
case mid(saledate,5,3)
	when 'Jan' then 1
    when 'Feb' then 2
    when 'Mar' then 3
    when 'Apr' then 4
    when 'May' then 5
    when 'Jun' then 6
    when 'Jul' then 7
    when 'Aug' then 8
    when 'Sep' then 9
    when 'Oct' then 10
    when 'Nov' then 11
    when 'Dec' then 12
    else 'None'
end as sale_month
from car_prices
limit 1000;

-- now i store all in a temporary tabe
create temporary table car_prices_valid as
select
`year` as manufactured_year,
make,
model,
trim,
body,
transmission,
vin,
state,
`condition` as car_condition,
odometer,
color,
interior,
seller,
mmr,
sellingprice,
saledate,
mid(saledate,12,4) as sale_year,
mid(saledate,5,3) as sale_monthname,
mid(saledate,9,2) as sale_day,
case mid(saledate,5,3)
	when 'Jan' then 1
    when 'Feb' then 2
    when 'Mar' then 3
    when 'Apr' then 4
    when 'May' then 5
    when 'Jun' then 6
    when 'Jul' then 7
    when 'Aug' then 8
    when 'Sep' then 9
    when 'Oct' then 10
    when 'Nov' then 11
    when 'Dec' then 12
    else 'None'
end as sale_month
from car_prices;
select *
from car_prices_valid;

-- NOW ANSWERING THE AVERAGE PRICES FOR EACH MONTH
select sale_year, sale_month, avg(sellingprice) as avg_selling_price
from car_prices_valid
group by sale_year, sale_month
order by sale_year, sale_month;

-- Q5 num sales each month

select sale_month, count(*) as num_of_sales_per_month
from car_prices_valid
group by sale_month
order by sale_month;

-- Q6 top 5 models for each body type

-- using the limit function as a filter
select
body , count(*) as num_model,
rank() over(order by count(*) desc) as ranking
from car_prices
group by body
limit 5;

-- using the subquery method to determine top 5
select * from (
select
body , count(*) as num_model,
rank() over(order by count(*) desc) as ranking
from car_prices
group by body
) as ranked_table
where ranking <= 5;


-- using the CTE
with ranked_table as(
select
body , count(*) as num_model,
rank() over(order by count(*) desc) as ranking
from car_prices
group by body
)
select * from ranked_table 
where ranking <= 5;
;

