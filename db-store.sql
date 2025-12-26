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
--select avg(income) from customers
--where (20 <= age) and (age <= 50);

-- Select people either under 30 or over 50 with an income above 50000 that are from either Japan or Australia
/*
select firstname, age, income from customers
where (age < 30 or age > 50) and (country = 'Japan' or country = 'Australia') 
and income > 50000;
*/

-- What was our total sales in June of 2004 for orders over 100 dollars?
--select totalamount, orderdate from orders
--select sum(totalamount) from orders
--where (orderdate >= '2004-06-01' and orderdate <= '2004-06-30')
--and totalamount > 100;


/*
* DB: Store
* Table: customers
* Question: adjust the following query to display the null values as "No Address"
*/
--SELECT coalesce(address2, 'No Address') FROM customers;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/
--SELECT * FROM customers
--WHERE address2 IS NOT null;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/
--SELECT coalesce(lastName, 'Empty'), * from customers
--where (age IS null);


-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)
--SElect firstname, lastname, age
--from customers
--where income < 50000 and (age between 30 and 50);


-- What is the average income between the ages of 20 and 50? (Including 20 and 50)
--select avg(income) 
--from customers
--where age between 20 and 50;

/*
* DB: Store
* Table: orders
* Question: How many orders were made by customer 7888, 1082, 12808, 9623 in total
*/
--select orderid, customerid
--select count(orderid)
--from orders
--where customerid in (7888, 1082, 12808, 9623);


/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211 
*/
--SELECT count(customerid) 
--from customers
--where cast(zip as text) like '%2%';


/*
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109 
*/
--SELECT count(customerid) 
--FROM customers
--WHERE CAST(zip AS TEXT) LIKE '2_1%';


/*
* DB: Store
* Table: customers
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"                                                  
* Expected output: https://imgur.com/AVe6G4c
*/
-- select coalesce(state, 'No State') as "State"
-- from customers
-- where phone::text like '302%';


/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

-- SELECT count(orderid) 
-- FROM orders
-- where DATE_TRUNC('month', orderdate) = date '2004-01-01';


/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/

-- select c.firstname, c.lastname, o.orderid
-- from orders as o  
-- inner join customers as c USING(customerid) -- ON o.customerid = c.customerid
-- order by o.orderid asc;


/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
SELECT p.prod_id, p.title, i.quan_in_stock 
FROM products AS p 
INNER JOIN inventory AS i ON p.prod_id = i.prod_id;













