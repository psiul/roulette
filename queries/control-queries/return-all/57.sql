select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,date_dim d,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 324 and ss.ss_hash <= 657 and c.c_hash >= 310 and c.c_hash <= 710 and d.d_hash >= 51 and d.d_hash <= 801
;
