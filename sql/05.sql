/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

select title from 
	(film join film_actor using(film_id))n1 right join 
	(select actor_id from film join film_actor using(film_id) where title ='AMERICAN CIRCUS')n2
	using(actor_id)
order by title;
