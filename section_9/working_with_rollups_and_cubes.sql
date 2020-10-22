-- ADD TABLE TO QUERY

CREATE TABLE sales
(
	continent varchar(20),
	country varchar(20),
	city varchar(20),
	units_sold integer
);

INSERT INTO sales VALUES ('North America', 'Canada', 'Toronto', 10000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Montreal', 5000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Vancouver', 15000);
INSERT INTO sales VALUES ('Asia', 'China', 'Hong Kong', 7000);
INSERT INTO sales VALUES ('Asia', 'China', 'Shanghai', 3000);
INSERT INTO sales VALUES ('Asia', 'Japan', 'Tokyo', 5000);
INSERT INTO sales VALUES ('Europe', 'UK', 'London', 6000);
INSERT INTO sales VALUES ('Europe', 'UK', 'Manchester', 12000);
INSERT INTO sales VALUES ('Europe', 'France', 'Paris', 5000);

-- break down by continent, country, and city

SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY GROUPING SETS(continent, country, city)

-- break down by continent, country, city and nothing with ()
SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY GROUPING SETS(continent, country, city, ())

-- using ROLLUP
SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY ROLLUP(continent, country, city)


-- using CUBE
-- shows all different combinations
SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY CUBE(continent, country, city)