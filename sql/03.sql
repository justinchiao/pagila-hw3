/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

select country, sum(amount) total_payments from(
	customer join address using(address_id) join
	city using(city_id) join
	country using(country_id) join
	payment using(customer_id)
)
group by country 
order by total_payments desc, country
;
