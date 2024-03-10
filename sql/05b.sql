/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */

select title from (select title, count(*) from 
	(film join film_actor using(film_id))n1 right join 
	(select actor_id from film join film_actor using(film_id) where title ='AMERICAN CIRCUS')n2
	using(actor_id)
group by title)n3
where count>=2
order by title
;
