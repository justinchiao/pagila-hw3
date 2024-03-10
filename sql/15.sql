/*
 * Find every documentary film that is rated PG.
 * Report the title and the actors.
 *
 * HINT:
 * Getting the formatting right on this query can be tricky.
 * You are welcome to try to manually get the correct formatting.
 * But there is also a view in the database that contains the correct formatting,
 * and you can SELECT from that VIEW instead of constructing the entire query manually.
 */

select t.title, string_agg(t.name, ', ') as actors from(
    select title, initcap(first_name) || initcap(last_name) as name
    from actor a
    join film_actor fa using(actor_id)
    join film f using(film_id)
    join film_category fc using(film_id)
    join category c using(category_id)
    where f.rating='G' and c.name='Documentary'
)t 
group by t.title
order by title;
