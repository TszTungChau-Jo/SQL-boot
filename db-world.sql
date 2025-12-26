-- How many official languages are there?
-- select count("language") 
-- from public.countrylanguage
-- where "isofficial" = true;
-- 
-- What is the average life expectancy in the world?
-- select avg("lifeexpectancy")
-- from public.country;

-- What is the average population for cities in the netherlands?
-- select avg("population")
-- from public.city
-- where "countrycode" = 'NLD';

/*
* DB: World
* Table: city
* Question: How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
*/
-- select COUNT(id)
-- from city
-- where district in ('Zuid-Holland', 'Noord-Brabant', 'Utrecht');

/*
* DB: World
* Table: country
* Question: Can I get a list of distinct life expectancy ages
* Make sure there are no nulls
*/

SELECT DISTINCT lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT NULL
ORDER BY lifeexpectancy;
