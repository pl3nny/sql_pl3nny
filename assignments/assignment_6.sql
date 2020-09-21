-- Assignment 6: Practice using Case and Tranposing Data

-- The assignemnt involves using the table you created in assignment 4. We'll be getting
-- practice using the CASE statement in interesting ways and transposing data

-- The table is of exports

-- 1. Write a query that displays 3 columns. The query should display the fruit and it's
-- total supply along with a category of eithe LOW, ENOUGH, or FULL. Low category means
-- that the total supply of the fruit is less than 20,000. The enough category means that
-- the total supply is between 20,000 and 50,000. If the total supply is greater than 
-- 50,000 then that fruit falls in the full category.

SELECT name, a.total_supply,
(
	CASE
		WHEN a.total_supply < 20000 THEN 'LOW'
		WHEN a.total_supply > 20000 AND a.total_supply < 50000 THEN 'ENOUGH'
		WHEN a.total_supply > 50000 THEN 'FULL'
	END
) AS category
FROM 
(
	SELECT name, sum(supply) AS total_supply
	FROM fruit_imports
	GROUP BY name
) a

-- 2. Taking into consideratin the supply column and the cost_per_unit column, you should
-- be able to tabulate the total cost to import fruits by each season. The result will 
-- look something like this:

"Winter" "10072.50"
"Summer" "19623.00"
"All Year" "22688.00"
"Spring" "29930.00"
"Fall" "29035.00"

-- Write a query that would transpose this data so that the seasons become columns and the
-- total cost for each season fills the first row?

SELECT
SUM(CASE WHEN season = 'Winter' THEN a.total_supply_cost END) AS winter_total,
SUM(CASE WHEN season = 'Summer' THEN a.total_supply_cost END) AS summer_total,
SUM(CASE WHEN season = 'All Year' THEN a.total_supply_cost END) AS all_year_total,
SUM(CASE WHEN season = 'Spring' THEN a.total_supply_cost END) AS spring_total,
SUM(CASE WHEN season = 'Fall' THEN a.total_supply_cost END) AS fall_total
FROM 
(
	SELECT season, SUM(cost_per_unit * supply) AS total_supply_cost
	FROM fruit_imports
	GROUP BY season
) a