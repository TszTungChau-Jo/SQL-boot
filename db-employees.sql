-- SELECT * FROM public.departments;
-- SELECT * FROM public.salaries;
-- select * from public.titles;

-- select emp_no as "Employee #", first_name as "First name", birth_date as "Birthday" from public.employees;

-- select concat(emp_no, ' is a ', title) as "Employee Title" from public.titles;

-- select emp_no, concat(first_name, ' ', last_name) as "Full Name"
-- from public.employees;

-- select count(emp_no) from public.employees;


-- select max(salary) from public.salaries;
-- select sum(salary) from public.salaries;


-- select avg(salary) 
-- from public.salaries;
-- 
-- 
-- select max(birth_date)
-- from public.employees;

-- Select: to filter Mayumi Schueller
--Select first_name, last_name from "public"."employees"
/*
filter on first name AND last name to limit the amount of data returned
and focus the filtering on a single person
*/ 
--where first_name = 'Mayumi' and last_name = 'Schueller';

-- Select: sepecfic employees example
--Select first_name, last_name, hire_date from employees
--where (first_name = 'Georgi' and last_name = 'Facello' and hire_date = '1986-06-26')
--or (first_name = 'Bezalel' and last_name = 'Simmel');

/*
* DB: Employees
* Table: employees
* Question: Find the age of all employees who's name starts with M.
* Sample output: https://imgur.com/vXs4093
* Use EXTRACT (YEAR FROM AGE(birth_date)) we will learn about this in later parts of the course
*/
--SELECT emp_no, first_name, EXTRACT (YEAR FROM AGE(birth_date)) as "age" 
--FROM employees
--where first_name like 'M%';


/*
* DB: Employees
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/
-- select count(emp_no)
-- from employees
-- where first_name like 'A%r';



/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

-- SELECT AGE(birth_date), * FROM public.employees
-- WHERE (
--     EXTRACT (YEAR FROM AGE(birth_date))
-- ) > 60;
-- 


/*
* DB: Employees
* Table: employees
* Question: How many employees were hired in February?
*/

--SELECT * FROM employees
-- SELECT count(emp_no) FROM employees
-- where (
--     EXTRACT (MONTH FROM hire_date) = 2
-- );


/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

--SELECT * FROM employees
-- SELECT count(emp_no) FROM employees
-- where (
--     EXTRACT (MONTH FROM birth_date) = 11
-- );
-- 

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

--SELECT MAX(AGE(birth_date)) FROM employees;


/*
* DB: Employees
* Table: titles
* Question: What unique titles do we have?
*/

--SELECT DISTINCT title FROM titles;


/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/

-- SELECT count(DISTINCT birth_date )
-- FROM employees;


/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/
-- 
-- select * from employees
-- order by first_name asc, last_name DESC;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by age
*/

--select age(birth_date), * from employees
--order by age(birth_date) asc;
--order by birth_date;

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/
-- select * from employees
-- where first_name ilike 'k%'
-- order by hire_date;

-- SELECT a.emp_no, 
--     CONCAT(a.first_name, a.last_name) as "name",
-- 	b.salary,
-- 	COALESCE(c.title, 'No title change') AS "title",
-- 	COALESCE(c.from_date::text, '-') AS "title taken on"
-- FROM employees AS a
-- INNER JOIN salaries AS b ON a.emp_no = b.emp_no
-- INNER JOIN titles AS c 
-- ON a.emp_no = c.emp_no AND (
-- 	c.from_date = (b.from_date + INTERVAL '2 days') OR
-- 	c.from_date = b.from_date
-- )
-- ORDER BY a.emp_no;

-- How many employees aren't managers
-- SELECT COUNT(emp.emp_no)
-- FROM employees AS emp
-- LEFT JOIN dept_manager AS dep ON emp.emp_no = dep.emp_no
-- where dep.emp_no is NULL;


-- Every salary raise and also know which ones were a promotion
-- SELECT a.emp_no, b.salary, COALESCE(c.title, '-')
-- FROM employees AS a
-- INNER JOIN salaries AS b ON b.emp_no = a.emp_no
-- LEFT JOIN titles AS c ON c.emp_no = a.emp_no 
-- AND (
-- 	c.from_date = (b.from_date + INTERVAL '2 days') OR
-- 	c.from_date = b.from_date
-- )
-- ORDER BY a.emp_no;

-- using keyword example
-- select e.emp_no, e.first_name, d.dept_name
-- from employees AS e 
-- INNER JOIN dept_emp AS de on de.emp_no = e.emp_no
--inner join dept_emp as de using (emp_no)
-- to get the deparment name
-- inner join departments as d using(dept_no);

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
SELECT e.emp_no, 
        concat(e.first_name, e.last_name),
        de.dept_no,
        d.dept_name
FROM employees AS e 
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no;

















