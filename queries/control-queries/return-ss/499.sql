select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 78 and ss.ss_hash <= 411 and d.d_hash >= 173 and d.d_hash <= 923 and hd.hd_hash >= 120 and hd.hd_hash <= 520
;
