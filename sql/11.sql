/* For each customer, find the movie that they have rented most recently.
 *
 * NOTE:
 * This problem can be solved with either a subquery (using techniques we've covered in class),
 * or a new type of join called a LATERAL JOIN.
 * You are not required to use LATERAL JOINs,
 * and we will not cover in class how to use them.
 * Nevertheless, they can greatly simplify your code,
 * and so I recommend that you learn to use them.
 * The website <https://linuxhint.com/postgres-lateral-join/> provides a LATERAL JOIN that solves this problem.
 * All of the subsequent problems in this homework can be solved with LATERAL JOINs
 * (or slightly less conveniently with subqueries).
 */

select c.first_name, c.last_name, title, r.rental_date from customer c
left join lateral (
    select rental_id, rental_date, inventory_id
    from rental
    where customer_id=c.customer_id
    order by rental_date desc
    limit 1) r on true
join inventory using(inventory_id)
join film using(film_id)
order by last_name, first_name
