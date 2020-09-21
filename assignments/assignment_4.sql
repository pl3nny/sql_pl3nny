-- Assignment 4: Practice Aggregation Queries

-- using fruit imports table

-- QUESTIONS

-- 1. Write a query that displays only the state with the largest amount
-- of fruit supply

SELECT "state", SUM(supply) AS most_supplies
FROM fruit_imports
GROUP BY "state"
ORDER BY most_supplies DESC
LIMIT 1

--  OR

SELECT "state"
FROM fruit_imports
GROUP BY "state"
ORDER BY SUM(supply) DESC
limit 1

-- 2. Write a quer ythat returns the most expensive cost_per_unit
-- of every season. The query should display 2 columns, the season and
-- the cost_per_unit

SELECT season, MAX(cost_per_unit) AS cost_per_unit
FROM fruit_imports
GROUP BY season
ORDER BY cost_per_unit DESC

-- 3. Write a query that returns the state that has more than 1 import
-- of the same fruit.

SELECT "state", "name", COUNT("name")
FROM fruit_imports
GROUP BY "state", "name"
HAVING COUNT("name") > 1
ORDER BY COUNT("name") DESC

-- 4. Write a query that retuns the seasons that produce either 3 fruits
-- or 4 fruits

SELECT season, COUNT("name")
FROM fruit_imports
GROUP BY season
HAVING (COUNT("name") = 3 OR COUNT("name") = 4)
ORDER BY COUNT("name") DESC

-- 5. Write a query that takes into consideration the supply and 
-- cost_per_unit columns for determining  the total cost and returns
-- the most expensive state with the total cost.

SELECT "state", SUM(supply * cost_per_unit) AS max_cost
FROM fruit_imports
GROUP BY "state"
ORDER BY max_cost DESC
LIMIT 1


-- 6. Execute the below SQL script and answer the question that follows:

CREATE table fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);

-- Write a query that returns the count of 4. You'll need to count on the 
-- column fruit_name and not use COUNT(*)

-- HINT: you'll need to use an additional function inside of count to make
-- this work

SELECT COUNT(COALESCE(fruit_name, 'some value'))
FROM fruits