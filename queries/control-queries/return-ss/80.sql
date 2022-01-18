select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,store_returns sr,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 50 and ss.ss_hash <= 800 and c.c_hash >= 263 and c.c_hash <= 663 and d.d_hash >= 148 and d.d_hash <= 481
;
