--1 List all of the customers who live in Texas 

select first_name, last_name, district from customer
join address
on customer.address_id = address.address_id
where address.district = 'Texas';

--2. Get all payments above $6.99 with the Customer’s full name

select first_name, last_name, amount 
from payment p  
join customer c
on p.customer_id = c.customer_id 
where p.amount > 6.99

--3. Show all customer names who have made payments over $175 (use subqueries) (jennifer davis, mildred bailey, harold martino)

select first_name, last_name
from customer c 
where customer_id in (select customer_id from payment where amount > 175)

--4. List all customers that live in Argentina (use the city table) (Tommy Nguyen) 

select first_name, last_name
from customers c 
where customer_id in (select customer_id from country where country = 'Argentina')



--5. Which film category has the most movies in it? (category 15, sports) 

select category_id, name 
from category 
where category_id in 

(select category_id from film_category 
group by category_id
order by count(*) desc
limit 1)


--6. What film had the most actors in it? (Lambs Cincinnati)

select film_id, title
from film
where film_id in (select film_id from film_actor group by film_id order by count(film_id) desc limit 1)


--7. Which actor has been in the least movies?(Penelope Guiness)

select actor_id, first_name, last_name 
from actor a 
join film f
on a.actor_id = f.film_id 
group by actor_id
order by count(*)desc 
limit 1



--8. Which country has the most cities? (india)

select country 
from country
where country_id in 
(select country_id from city 
group by country_id
order by count(city) desc
limit 1)



--9. List the actors who have been in more than 3 films but less than (Jennifer Davis and Johnny Lollobrigida) 


select first_name, last_name
from actor a 
join film f 
on a.actor_id = f.film_id 
where film_id < 6 and film_id > 3








