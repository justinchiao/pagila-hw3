/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

select distinct(first_name || ' ' || last_name) as "Actor Name"  from film join (select  film_id from
	film_actor
	join actor using(actor_id)
	where last_name='BACALL')n1 using(film_id) join
	film_actor using(film_id) join
	actor using(actor_id)
where actor_id != 112
order by "Actor Name";
