-- 1.	What is the count of distinct cities in the dataset?
		select City,count(distinct(city)) as NoOfCity from sales group by city;
-- 2.	For each branch, what is the corresponding city?
		Select branch, city from sales;
        Select distinct(product_line)  from sales;
-- 3.	What is the count of distinct product lines in the dataset?
		Select count(distinct(product_line)) as NoOfProduct from sales;
-- 4.	Which payment method occurs most frequently?
		select payment_method, count(payment_method) as payment_occurence from sales group by payment_method order by count(payment_method) desc;
-- 5.	Which product line has the highest sales?
		Select product_line, count(quantity) as NoOfQty from sales group by product_line order by count(quantity) desc limit 1;
-- 6.	How much revenue is generated each month?
		-- Select * from sales;
        select monthname, sum(total) as Revenue from sales group by monthname order by sum(total) desc limit 1;
        
-- 7.	In which month did the cost of goods sold reach its peak?
		-- Select * from sales;
        select monthname, sum(cogs) as cogs from sales group by monthname order by sum(cogs) desc limit 1;
-- 8.	Which product line generated the highest revenue?
		Select product_line, sum(total) as HighestRevenue from sales group by product_line order by sum(total) desc limit 1;
-- 9.	In which city was the highest revenue recorded?
		Select city, sum(total) as HighestRevenue from sales group by city order by sum(total) desc limit 1;
-- 10.	Which product line incurred the highest Value Added Tax?
		Select product_line, sum(VAT) as HighestVAT from sales group by product_line order by sum(VAT) desc limit 1;
-- 11.	For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
    WITH avg_sales AS (
    SELECT product_line, AVG(total) AS avg_total_sales
    FROM sales
    GROUP BY product_line
	) 
		select s.product_line , case WHEN s.total > sa.avg_total_sales THEN 'Good'ELSE 'Bad'END as Prod_Status
		from sales s
		join avg_sales sa on sa.product_line = s.product_line;
    
    
-- 12.	Identify the branch that exceeded the average number of products sold.
		select branch, sum(quantity) as totalQty 
        from sales
        group by branch
        having totalQty > (select avg(quantity) from sales)
        order by totalQty desc;
-- 13.	Which product line is most frequently associated with each gender?
		Select Product_line, Gender,count(gender) from sales group by product_line, Gender order by count(gender) desc;
	
-- 14.	Calculate the average rating for each product line.
		select product_line, avg(rating) as avgrating from sales group by product_line order by avgrating;

-- Sales Analysis Queries:
-- 15.	Count the sales occurrences for each time of day on every weekday.
		-- select * from sales;
		select timeofday, count(*) as totalsales 
        from sales 
        where dayoftheweek in ('Monday','Tuesday','Wednesday','Thursday''Friday')
        group by timeofday 
        order by totalsales desc;
-- 16.	Identify the customer type contributing the highest revenue.
		Select customer_type, sum(total) as Highest_rev 
        from sales 
        group by customer_type 
        order by Highest_rev desc;
-- 17.	Determine the city with the highest VAT percentage.
		Select city, sum(vat) as Highest_VAT
        from sales 
        group by city 
        order by Highest_VAT desc;

-- 18.	Identify the customer type with the highest VAT payments.
		select * from sales;
        select sa.customer_type,sum(sa.VAT) as HighestVAT from sales sa group by customer_type order by HighestVAT;
-- 19.	What is the count of distinct customer types in the dataset?
		Select Customer_type, count(distinct(customer_type)) as CountOfCustomer_type from sales group by customer_type;
-- 20.	What is the count of distinct payment methods in the dataset?
		Select payment_method,count(distinct(payment_method)) as CountOfPaymentMethod from sales group by payment_method;
-- 21.	Which customer type occurs most frequently?
		select customer_type,count(customer_type) as NoOfCustomerType from sales group by customer_type order by NoOfCustomerType Desc;
-- 22.	Identify the customer type with the highest purchase frequency.
		Select customer_type,payment_method,count(payment_method) as NoOfpurchase from sales group by customer_type,Payment_method order by NoOfpurchase desc;
-- 23.	Determine the predominant gender among customers.
		select gender,count(gender) as countofGender from sales group by gender;
-- 24.	Examine the distribution of genders within each branch.
		select branch,gender,count(gender) as NoOfGender from sales group by branch,gender order by NoOfGender desc;
-- 25.	Identify the time of day when customers provide the most ratings.
		select timeofday, rating, count(time) as NoOfTime from sales group by timeofday,rating order by NoOfTime Desc;
-- 26.	Determine the time of day with the highest customer ratings for each branch.
		Select branch,timeofday,sum(rating) as highrating from sales group by branch,timeofday order by highrating desc;
-- 27.	Identify the day of the week with the highest average ratings.
		select dayoftheweek,avg(rating) as highest_avg_rating from sales group by dayoftheweek order by highest_avg_rating desc; 
-- 28.	Determine the day of the week with the highest average ratings for each branch.
		select branch, dayoftheweek,avg(rating) as highest_avg_rating from sales group by branch,dayoftheweek order by highest_avg_rating desc; 
