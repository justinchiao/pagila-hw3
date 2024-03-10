/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMP,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */

select title from (select title, count(*) from 
	(film join film_actor using(film_id))n1 right join 
	(select actor_id from film join film_actor using(film_id) where title ='AMERICAN CIRCUS' or title='ACADEMY DINOSAUR' or title='AGENT TRUMAN')n2
	using(actor_id)
group by title)n3
where count>=3
order by title
;
