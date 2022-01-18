select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 205 and d.d_hash <= 955 and c.c_hash >= 634 and c.c_hash <= 967 and hd.hd_hash >= 365 and hd.hd_hash <= 765
;
