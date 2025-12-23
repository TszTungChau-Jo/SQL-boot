-- How many female customers do we have from the state of Oregon or and new york
--select firstname, lastname, state, gender from customers
--select count(firstname) from customers
--where gender = 'F' and (state = 'NY' OR state = 'OR');

-- How many customers aren't 55?
--select firstname, age from customers
-- select count(firstname) from customers
-- where not age = '55';

-- Who over the age of 44 has an income of 100,000?
-- Use comparison operators!


-- How many female customers do we have from the state of Oregon?
--select count(firstname) from customers
--where state = 'OR' and gender = 'F';

-- Who over the age of 44 has an income of 100,000 or more?
--select firstname from customers
--where (age > 44) and (income >= 100000);

-- Who between the ages of 30 and 50 has an income of less than 50,000?
--select firstname, age, income from customers
-- between means to include the edges
--where (30 <= age) and (age <= 50) and (income < 50000);

-- What is the average income between the ages of 20 and 50?
--select firstname, age from customers
SELECT avg(income) FROM customers
WHERE (20 <= age) AND (age <= 50);









