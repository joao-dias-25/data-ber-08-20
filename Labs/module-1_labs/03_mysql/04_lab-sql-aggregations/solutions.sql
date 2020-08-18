
/* 1 */
select district_id, count(client_id)
from bank.client
Where district_id < 10
group by district_id
order by district_id asc;

/*2 */
select type, count(card_id) as freq
from bank.card
group by type
order by freq desc;

/* 3 */
select account_id, sum(amount) as total_amount
from bank.loan
group by account_id
order by total_amount desc
limit 10;


/* 4 */
select date, count(loan_id) as qt
from bank.loan 
where date < 930907
group by date
order by date desc;

/* 5 */

select date, duration, count(loan_id) as qt_loan 
from bank.loan
where date between 971201 and 971231
group by date, duration
order by date, duration;

/* 6 */
select account_id, type, sum(amount) as total_amount
from bank.trans
where account_id=396
group by type;

/* 7 */
select account_id,
case when type = 'PRIJEM' then 'Incoming'
	when type = 'VYDAJ' then 'Outgoing'
    end as flow_type,
    floor(sum(amount)) as total_amount
from bank.trans
where account_id=396
group by account_id, type;


/* 8 */
Select account_id, sum(
 case when flow_type = 'Incoming' then total_amount
 end) as inco,
sum( case when flow_type = 'Outgoing' then total_amount
 end) as outo,
 
 sum(
 case when flow_type = 'Incoming' then total_amount
 end) -
sum( case when flow_type = 'Outgoing' then total_amount
 end) as difference
 
from( select account_id,

Case when type = 'PRIJEM' then 'Incoming'
	when type = 'VYDAJ' then 'Outgoing'
    end as flow_type,
    floor(sum(amount)) as total_amount
from bank.trans
where account_id=396
group by account_id, type) sumi
group by account_id;


/* 9 */
Select account_id,
 
 sum(
 case when flow = 'Incoming' then total_amount
 end) -
sum( case when flow = 'Outgoing' then total_amount
 end) as difference
 
 
from( select account_id,
	Case when type = 'PRIJEM' then 'Incoming'
	when type = 'VYDAJ' then 'Outgoing'
    end as flow,
    floor(sum(amount)) as total_amount
from bank.trans
group by account_id, type) sumi
group by account_id
order by difference desc
limit 10;

