select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,store_returns sr,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 53 and ss.ss_hash <= 803 and d.d_hash >= 194 and d.d_hash <= 594 and c.c_hash >= 581 and c.c_hash <= 914
;
