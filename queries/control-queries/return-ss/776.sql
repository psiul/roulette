select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 245 and hd.hd_hash <= 645 and d.d_hash >= 222 and d.d_hash <= 972 and c.c_hash >= 547 and c.c_hash <= 880
;
