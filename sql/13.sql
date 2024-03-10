/*
 * Management wants to create a "best sellers" list for each actor.
 *
 * Write a SQL query that:
 * For each actor, reports the three films that the actor starred in that have brought in the most revenue for the company.
 * (The revenue is the sum of all payments associated with that film.)
 *
 * HINT:
 * For correct output, you will have to rank the films for each actor.
 * My solution uses the `rank` window function.
 */

select actor_id, first_name, last_name, film_id, title, r.rank, r.revenue
from actor a 
left join lateral(
    select t.title, film_id, coalesce(t.sum, 0.00) as revenue, rank() over ( order by coalesce(t.sum, 0.00) desc, t.title) "rank"
    from film join(
        select f.title, film_id, sum(p.amount) from film f
        left join inventory i using(film_id)
        left join rental r using(inventory_id)
        left join payment p using(rental_id)
        group by title, film_id)t using(film_id)
    join film_actor using(film_id)
    where actor_id=a.actor_id
    order by revenue desc
    limit 3)r on true
order by actor_id, rank
;
