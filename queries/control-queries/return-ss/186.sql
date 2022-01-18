select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 283 and ss.ss_hash <= 616 and hd.hd_hash >= 387 and hd.hd_hash <= 787 and c.c_hash >= 172 and c.c_hash <= 922
;
