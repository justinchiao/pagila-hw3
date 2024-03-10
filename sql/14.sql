/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */

select name, title,r."total rentals" from category c
left join lateral(
    select t.title, film_id, coalesce(t.count,0.00) as "total rentals"
    from film 
    join (
        select f.title, film_id, count(rental_id)
        from film f left join inventory i using(film_id)
        left join rental r using(inventory_id)
        group by title, film_id
    ) t using(film_id)
    join film_category using(film_id)
    where category_id=c.category_id
    order by "total rentals" desc, title desc
    limit 5
)r on true
order by name, "total rentals" desc, title
;
