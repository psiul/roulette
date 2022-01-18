select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 331 and ss.ss_hash <= 664 and d.d_hash >= 149 and d.d_hash <= 899 and c.c_hash >= 519 and c.c_hash <= 919
;
