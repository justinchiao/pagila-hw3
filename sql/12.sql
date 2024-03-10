/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

select c.customer_id, c.first_name, c.last_name from customer c
left join lateral(
    select r.customer_id, fc.category_id
    from rental r
    join inventory i on r.inventory_id=i.inventory_id
    join film f on i.film_id=f.film_id
    join film_category fc on f.film_id=fc.film_id
    where fc.category_id=(select category_id from category where name='Action')
    and r.customer_id=c.customer_id
    limit 5) as recent on true
group by  c.customer_id
having count( case when category_id=(select category_id from category where name='Action') then 1 end) >=4
order by customer_id;
