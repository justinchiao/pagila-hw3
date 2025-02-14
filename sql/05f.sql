/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */


select f2.title from
film f1 join film_category fc1 on fc1.film_id=f1.film_id
join category c on c.category_id=fc1.category_id
join film_category fc2 on fc2.category_id=c.category_id
join film f2 on f2.film_id=fc2.film_id
where f1.title='AMERICAN CIRCUS'
group by f2.title
having count(fc1.category_id)>1
intersect
select f2.title from
film f1 join film_actor fa1 on f1.film_id=fa1.film_id
join film_actor fa2 on fa1.actor_id=fa2.actor_id
join film f2 on f2.film_id=fa2.film_id
where f1.title='AMERICAN CIRCUS'
group by f2.title
having count(fa1.actor_id)>0
order by title;
