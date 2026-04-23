-- COUNTRY AND REGIONAL COMPARISON
-- Average petrol and diesel prices for each country.

SELECT 
    global_fuel_tb.country AS country,
    ROUND(AVG(global_fuel_tb.petrol_usD_litre), 3) AS average_petrol_usd,
    ROUND(AVG(global_fuel_tb.diesel_usd_litre), 3) AS average_diesel_usd
FROM
    global_fuel_tb
GROUP BY country
ORDER BY country; 

-- which REGION HAS the highest AVERAGE PETROL prices.

SELECT 
	global_fuel_tb.region AS region,
	AVG(global_fuel_tb.petrol_usD_litre) AS petrol_usd
FROM global_fuel_tb
GROUP BY region
ORDER BY petrol_usd DESC;

-- INCOME RELATIONSHIP WITH PRICE OF PETROL

SELECT 
	global_fuel_tb.income_level AS income_level,
    AVG(global_fuel_tb.petrol_usD_litre) AS avg_petrol_price
FROM 
	global_fuel_tb
GROUP BY income_level
ORDER BY income_level;


/*
TOP and bottom perfomers in terms of price of fuel

 country with the most expensive petrol prices and their levels of income
*/

SELECT 
    global_fuel_tb.country AS country,
    global_fuel_tb.subsidy_level AS subsidy_level,
    global_fuel_tb.income_level AS income_level,
    AVG(global_fuel_tb.petrol_usD_litre) AS petrol_price
FROM
    global_fuel_tb
GROUP BY country, subsidy_level, income_level
ORDER BY petrol_price DESC
LIMIT 5;


-- countries with the cheapest petrol prices and their levels of income

SELECT 
    global_fuel_tb.country AS country,
    global_fuel_tb.subsidy_level AS subsidy_level,
    global_fuel_tb.income_level AS income_level,
    ROUND(AVG(global_fuel_tb.petrol_usD_litre), 3) AS petrol_price_usd
FROM
    global_fuel_tb
GROUP BY country , subsidy_level , income_level
ORDER BY petrol_price_usd ASC
LIMIT 10;

-- Countries with high income level and low petrol prices

SELECT 
	global_fuel_tb.country AS Country,
    global_fuel_tb.income_level AS income_level,
    ROUND(AVG(global_fuel_tb.petrol_usD_litre), 3) AS petrol_price_usd
FROM global_fuel_tb
GROUP BY Country, income_level
HAVING income_level = 'High'
ORDER BY petrol_price_usd ASC
LIMIT 10;

-- low income countries with expensive petrol

SELECT 
    global_fuel_tb.country AS Country,
    global_fuel_tb.income_level AS income_level,
    ROUND(AVG(global_fuel_tb.petrol_usD_litre), 3) AS petrol_price_usd
FROM
    global_fuel_tb
GROUP BY Country , income_level
HAVING income_level = 'low'
ORDER BY petrol_price_usd ASC
LIMIT 10;


-- Global price of petrol over the years in relation to brent crude

SELECT 
   YEAR(global_fuel_tb.date) AS year,
   ROUND(AVG(global_fuel_tb.petrol_usD_litre), 3) AS avg_petrol_price,
   ROUND(AVG(global_fuel_tb.brent_crude_usd_litre), 3) AS crude_price
FROM global_fuel_tb
GROUP BY year
ORDER BY year ASC; 



--Impact of high subsidy level on the price of fuel 

SELECT 
    global_fuel_tb.country AS country,
    global_fuel_tb.subsidy_level AS subsidy,
    global_fuel_tb.income_level AS income_level,
    AVG(global_fuel_tb.petrol_usD_litre) AS petrol_usd
FROM
    global_fuel_tb

GROUP BY country, subsidy, income_level
HAVING subsidy IN('High', 'very High')
ORDER BY petrol_usd DESC;


-- impact of tax on the price of petrol

SELECT 
    global_fuel_tb.country AS country,
     AVG(global_fuel_tb.tax_percentage)AS tax,
    AVG(global_fuel_tb.petrol_usD_litre) AS petrol_price
FROM
    global_fuel_tb
GROUP BY country
ORDER BY petrol_price;


-- 