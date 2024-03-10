/*
 * Compute the country with the most customers in it. 
 */

select country from (select country, count(*) from(
	customer join address using(address_id) join
	city using(city_id) join
	country using(country_id)
)
group by country 
order by count desc
limit 1)n1
;
