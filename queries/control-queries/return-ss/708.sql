select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 209 and ss.ss_hash <= 542 and d.d_hash >= 349 and d.d_hash <= 749 and c.c_hash >= 219 and c.c_hash <= 969
;
