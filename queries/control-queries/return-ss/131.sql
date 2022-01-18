select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 160 and d.d_hash <= 910 and c.c_hash >= 587 and c.c_hash <= 987 and hd.hd_hash >= 305 and hd.hd_hash <= 638
;
