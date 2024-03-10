/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

select first_name || ' ' || last_name as "Actor Name"
from actor join
(select distinct(actor_id) from film_actor
    where film_id in
    (select film_id from film_actor where actor_id in
        (select distinct(actor_id) from film_actor where film_id in
            (select film_id from actor where first_name='RUSSELL' and last_name='BACALL')
        )
        and actor_id not in(
            select actor_id from actor where first_name='RUSSELL' and last_name='BACALL'
        )
    )
    and actor_id not in(
        select distinct actor_id from film_actor 
        where film_id in(
            select film_id from film_actor where actor_id in(
                select actor_id from actor where first_name='RUSSELL' and last_name='BACALL'
            )
        )
    )
)t using(actor_id)
order by "Actor Name";
