select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,store_returns sr,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 106 and ss.ss_hash <= 856 and d.d_hash >= 485 and d.d_hash <= 885 and hd.hd_hash >= 198 and hd.hd_hash <= 531
;
