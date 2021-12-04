-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
use sakila;

select title, length, rank() over (order by length desc) as 'Rank'
from sakila.film
where length is not null and length <> ''
order by length; 

-- Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.

select title, length, rating, rank() over (order by length desc) as 'Rank'
from sakila.film
where length is not null and length <> ''
order by length;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query

SELECT category, Count(*) AS FilmsCount
FROM film_list
GROUP BY Category
ORDER BY FilmsCount;

-- Which actor has appeared in the most films?

SELECT count(film_actor.actor_id), actor.first_name, actor.last_name 
FROM actor INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id ;

select concat(a.FIRST_NAME,' ', a.LAST_NAME) as Full_name
from ACTOR a
left join FILM_ACTOR fa on a.ACTOR_ID = fa.ACTOR_ID
group by a.ACTOR_ID, a.FIRST_NAME, a.LAST_NAME
order by count(*) desc
limit 1;

-- Most active customer (the customer that has rented the most number of films)

SELECT customer_id, count(*) as Total_Rentals
FROM rental
GROUP BY customer_id
ORDER BY Total_Rentals DESC LIMIT 1;