select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 113 and ss.ss_hash <= 513 and d.d_hash >= 166 and d.d_hash <= 916 and hd.hd_hash >= 455 and hd.hd_hash <= 788
;
