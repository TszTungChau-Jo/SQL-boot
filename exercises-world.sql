-- How many official languages are there?
SELECT count("language") 
FROM public.countrylanguage
WHERE "isofficial" = TRUE;

-- What is the average life expectancy in the world?
SELECT avg("lifeexpectancy")
FROM public.country;

-- What is the average population for cities in the netherlands?
SELECT avg("population")
FROM public.city
WHERE "countrycode" = 'NLD';

/*
* DB: World
* Table: city
* Question: How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
*/
SELECT COUNT(id)
FROM city
WHERE district IN ('Zuid-Holland', 'Noord-Brabant', 'Utrecht');


