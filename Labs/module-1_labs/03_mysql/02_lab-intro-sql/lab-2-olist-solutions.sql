/* 1 */
select min(first_contact_date), max(first_contact_date)
from olist.marketing_qualified_leads;

/* 2 */
select origin, 
count(*) as frq
from olist.marketing_qualified_leads
where (date(first_contact_date) between '2018-01-01' and'2018-12-31')
group by origin
order by frq desc
limit 3;

/* 3 */
select first_contact_date, count(mql_id) as mql_entries
from olist.marketing_qualified_leads
group by date(first_contact_date)
order by mql_entries desc
limit 1;

/* 4 */
select product_category_name, count(product_category_name)
from olist.products
group by product_category_name
order by count(product_category_name) desc
limit 2;

/* 5 */
select product_category_name, product_weight_g
from olist.products
order by product_weight_g desc
limit 1;

/* 6 */

select product_category_name, (product_length_cm+product_height_cm+product_width_cm) as soma
from olist.products
order by soma desc
limit 1;

/* 7 */

select payment_type, count(order_id)
from olist.order_payments
group by payment_type
order by count(order_id) desc
limit 1;

/* 8 */
select max(payment_value)
from olist.order_payments;


/* 9 */
select seller_state, count(distinct seller_city) as n_cities
from olist.sellers
group by seller_state
order by n_cities desc
limit 3;
