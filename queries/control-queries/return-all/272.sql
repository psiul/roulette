select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 158 and d.d_hash <= 908 and c.c_hash >= 400 and c.c_hash <= 800 and hd.hd_hash >= 110 and hd.hd_hash <= 443
;
