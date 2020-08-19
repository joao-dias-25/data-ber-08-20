/* chalenge 1 -step 1 */
select 
s.title_id,
ta.au_id,
t.price,
s.qty,
t.royalty,
ta.royaltyper,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty
from publi.sales s
left join publi.titleauthor ta
on s.title_id = ta.title_id
left join publi.titles t
on s.title_id = t.title_id;

/* 2 step */
select title_id, au_id, sum(sales_royalty) as s_r_sum
from(select 
s.title_id,
ta.au_id,
t.price,
s.qty,
t.royalty,
ta.royaltyper,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty
from publi.sales s
left join publi.titleauthor ta
on s.title_id = ta.title_id
left join publi.titles t
on s.title_id = t.title_id) step1
group by au_id, title_id;

/* step 3 */
select au_id, sum(s_r_sum) as total
from(select title_id, au_id, sum(sales_royalty) as s_r_sum
from(select 
s.title_id,
ta.au_id,
t.price,
s.qty,
t.royalty,
ta.royaltyper,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty
from publi.sales s
left join publi.titleauthor ta
on s.title_id = ta.title_id
left join publi.titles t
on s.title_id = t.title_id) step1
group by au_id, title_id) step2
group by au_id
order by total desc
limit 3;

/* challenge 2 - step 1*/
create temporary table challenge_1 as
select 
s.title_id,
ta.au_id,
t.price,
s.qty,
t.royalty,
ta.royaltyper,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty
from publi.sales s
left join publi.titleauthor ta
on s.title_id = ta.title_id
left join publi.titles t
on s.title_id = t.title_id;

/* C_2 step 2 */

create temporary table c2_s2 as
select title_id, au_id, sum(sales_royalty) as s_r_sum
from challenge_1
group by au_id, title_id;

/* C2_s3 */
select au_id, sum(s_r_sum) as r_total
from c2_s2
group by au_id
order by r_total desc
limit 3;

/* Challenge 3 */
-- create table most_profiting_authors as 
select  -- title_id, au_id, advance 
s.title_id,
ta.au_id,
t.price,
s.qty,
t.royalty,
ta.royaltyper,
t.advance,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty
from publi.sales s
left join publi.titleauthor ta
on s.title_id = ta.title_id
left join publi.titles t
on s.title_id = t.title_id;




