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
SELECT count(emp_no)
FROM employees
WHERE first_name LIKE 'A%r';

















