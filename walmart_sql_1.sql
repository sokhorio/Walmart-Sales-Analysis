
-- 1. Show all data
select * from walmart;

-- 2. Identify how many row exist in this dataset
select count(*) as Total_Row from walmart;

-- 3. Total Branch
select count(distinct Branch) as Total_Branch 
from walmart;

-- 4. Total City
select count(distinct City) as Total_City 
from walmart;

-- 5. Total category
select count(distinct category) as Total_Category 
from walmart;

-- 6. Maximum sales qty
select max(quantity) as Maximum_Sales 
from walmart;

-- 7. Define the transection quantity and total sales base on payment method
select payment_method as Payment, 
	count(*) as Transection_Qty, 
    round((total_sales),2) Total_sales 
from walmart
group by payment_method
order by count(*) desc;

-- 8. Identify the higest rated category in each branch
select Branch,
		category,
        round(avg(rating),2) as Avg_Rating,
        rank() over(partition by Branch order by avg(rating) desc) as Rank_Position
from walmart
group by Branch, category;
-- order by Branch, category

-- 9. Identify the category wich rank position is one base on branch
select * 
from
(	select Branch,
		category,
        round(avg(rating),2) as Avg_Rating,
        rank() over(partition by Branch order by avg(rating) desc) as Rank_Position
	from walmart
	group by Branch, category
) as rank_query
where Rank_Position = 1;

-- 10. Identify the day with the maximum transaction count for every branch.
select *
from
(	SELECT 
	  Branch,
	  dayname(STR_TO_DATE(date, '%d/%m/%y')) as Day_Name,
	  count(*) as No_Transection,
	  rank() over(partition by Branch order by count(*) desc) as Rank_position
	FROM walmart
	group by Branch, Day_Name
) as Position
where Rank_Position = 1;

-- 11. Total revenue and total profit base on category
select
	category as Category,
    round(sum(total_sales),2) as Revenue,
    round(sum(total_sales * profit_margin),2) as Total_Profit
from walmart
group by category;

-- 12. Indentify the most common payment method for each branch
with bp_position
as
(	select 
		Branch,
		payment_method as Payment,
		count(*) No_Transection,
		rank() over(partition by Branch order by count(*) desc) Position_Rank
	from walmart
	group by Branch, payment_method
)

select *
from bp_position
where Position_Rank = 1;

-- 13. Categorize sales time into 3 group Morning, Afternoon, Evening. Then find out the invoice number of the each shift.

-- (Create a new coulumn from time(text format) to formated_time(time format))
-- STR_TO_DATE(time, '%H:%i') time function to covert string formated time to date time formate time

-- 13.1 Identify the total transection by shift of each branch
select
	Branch,
	case 
		when hour(STR_TO_DATE(time, '%H:%i')) < 12 then 'Morning'
        when hour(STR_TO_DATE(time, '%H:%i')) between 12 and 17 then 'Afternoon'
        else 'Evening'
	end day_shift,
    count(*) as Total_Transection
from walmart
group by Branch, day_shift
order by Branch, day_shift ;

/* 14. Find the top 5 branches that experienced the highest drop in revenue when 
comparing the current year (2023) to the previous year (2022). */
-- Revenue decrease ration = (last_rev - Curr_rev)last_rev

select *,
	STR_TO_DATE(date, '%d/%m/%y') as Formated_date
from walmart;

-- 2022 Revenue

/*CTE(Common Table Expression)*/
with last_rev 
as
(	select
		Branch,
		round(sum(total_sales),2) as Revenue
	from walmart
	where year(STR_TO_DATE(date, '%d/%m/%y')) = 2022
	group by Branch
),
 curr_rev
 as
(	select
		Branch,
		round(sum(total_sales),2) as Revenue
	from walmart
	where year(STR_TO_DATE(date, '%d/%m/%y')) = 2023
	group by Branch
)

select
	l_rev.Branch,
    l_rev.Revenue as 2022_Revenue,
    c_rev.Revenue as 2023_Renenue,
    round((l_rev.Revenue - c_rev.Revenue)/l_rev.Revenue * 100,2) as `Revenue_Decrease_Ratio(%)`
from last_rev as l_rev
join 
curr_rev as c_rev
on l_rev.Branch = c_rev.Branch
where
	 l_rev.Revenue > c_rev.Revenue
order by `Revenue_Decrease_Ratio(%)` desc
limit 5










	
