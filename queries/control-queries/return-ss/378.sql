select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 298 and ss.ss_hash <= 631 and d.d_hash >= 10 and d.d_hash <= 410 and c.c_hash >= 166 and c.c_hash <= 916
;
