select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,store_returns sr,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 539 and ss.ss_hash <= 939 and hd.hd_hash >= 192 and hd.hd_hash <= 525 and c.c_hash >= 237 and c.c_hash <= 987
;
