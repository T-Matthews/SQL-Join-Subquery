--Week 5 Monday Homework
---------------------------------------------------------------
--1. List all customers who live in Texas (use JOINs)

select first_name,last_name
from customer
join address a
on customer.address_id = a.address_id 
where a.district = 'Texas'

--There are 5 people living in Texas

-----------------------------------------------------------------
--2. Get all payments above $6.99 with the Customer's Full Name

select customer.first_name,customer.last_name, payment.amount
from payment 
join customer 
on payment.customer_id = customer.customer_id 
where payment.amount > 6.99

--Thought you needed 'Having' clause for a comparison? Anyway, there are 
--1498 payments greater than 6.99.


-------------------------------------------------------------------------------
--3. Show all customers names who have made payments over $175(use subqueries)

select c.first_name, c.last_name  from customer c 
where c.customer_id in (
	select payment.customer_id
	from payment
	where payment.amount >175
)
--There are 3 people who spent over $175. 
	--Jennifer Davis
	--Mildred Bailey
	--Harold Martino

----------------------------------------------------------------------------
--4. List all customers that live in Nepal (use the city table)

select customer.first_name,customer.last_name 
from city
join country
on city.country_id = country.country_id 
join address
on city.city_id = address.city_id 
join customer
on address.address_id = customer.address_id 
where country = 'Nepal'

--Kevin Schuler is the only Nepalese resident on the customer list.

-----------------------------------------------------------------------------
--5. Which staff member had the most transactions?

select staff.staff_id, count(payment.payment_id ) 
from staff
join payment
on staff.staff_id = payment.staff_id 
group by 1

--Staff member 2 had 11 more transactions; 7304 to 7293.

----------------------------------------------------------------------------
--6. How many movies of each rating are there?
select rating, count(rating)  
from film f
group by 1
--Not sure why or how you would use a join or subquerry here. 
--Quite simple to do without.

--PG-13	223
--NC-17	209
--G	    179
--PG    194
--R	    195

-----------------------------------------------------------------------------------
--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)

select customer.first_name, customer.last_name 
from customer
where customer.customer_id in (
						select customer.customer_id 
						from payment
						where payment.amount >6.99
						)
--Im showing 599, although I dont believe that to be accurate.
--I think people who have purchased multiples over 6.99 are included.

---------------------------------------------------------------------------
--8. How many free rentals did our stores give away?

select count(rental.rental_id) 
from rental
where rental.rental_id in (
			select payment.rental_id
			from payment
			where payment.amount = 0)

--The store gave away 23 movie rentals.



