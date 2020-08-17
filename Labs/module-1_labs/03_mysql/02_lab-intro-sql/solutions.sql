/* 1 */
select  max(price), min(price)
from olist.order_items;

/* 2 */
select  min(shipping_limit_date) , max(shipping_limit_date)
from olist.order_items;

/* 3 */
SELECT customer_state, count(customer_state) 
from olist.customers
group by customer_state
order by count(customer_state) desc
limit 3;

/* 4 */
SELECT customer_city, count(customer_city) 
from olist.customers
where customer_state = 'SP'
group by customer_city
order by count(customer_city) desc
limit 3;

/*5 */
SELECT count(distinct(business_segment))
from olist.closed_deals;

/*6*/ 
select business_segment
from olist.closed_deals
group by business_segment
order by sum(declared_monthly_revenue) desc
limit 3;

/*7*/
select count(distinct(review_score))
from olist.order_reviews;

/*8 */
select *,
	case
    when review_score=1 then 'very_bad'
    when review_score=2 then 'bad'
    when review_score=3 then 'average'
    when review_score=4 then 'good'
    when review_score=5 then 'very_good'
    end
from olist.order_reviews
limit 10;




/*9 */
select review_score, count(*) as qt
from olist.order_reviews
group by review_score
order by qt desc
limit 1;