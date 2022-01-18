select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,store_returns sr,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 455 and d.d_hash <= 855 and c.c_hash >= 19 and c.c_hash <= 769 and hd.hd_hash >= 178 and hd.hd_hash <= 511
;
