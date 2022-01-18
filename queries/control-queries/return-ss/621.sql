select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 200 and ss.ss_hash <= 600 and d.d_hash >= 228 and d.d_hash <= 561 and hd.hd_hash >= 75 and hd.hd_hash <= 825
;
