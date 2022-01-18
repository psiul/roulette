select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 124 and ss.ss_hash <= 524 and d.d_hash >= 154 and d.d_hash <= 904 and hd.hd_hash >= 170 and hd.hd_hash <= 503
;
