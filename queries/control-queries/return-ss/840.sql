select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,store_returns sr,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 39 and ss.ss_hash <= 789 and hd.hd_hash >= 439 and hd.hd_hash <= 839 and c.c_hash >= 136 and c.c_hash <= 469
;
