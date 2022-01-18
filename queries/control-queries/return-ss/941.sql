select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,store_returns sr,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 16 and d.d_hash <= 766 and c.c_hash >= 65 and c.c_hash <= 398 and hd.hd_hash >= 503 and hd.hd_hash <= 903
;
