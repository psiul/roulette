select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,store_returns sr,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 303 and ss.ss_hash <= 636 and hd.hd_hash >= 182 and hd.hd_hash <= 932 and c.c_hash >= 13 and c.c_hash <= 413
;
