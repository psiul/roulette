select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,store_returns sr,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 29 and ss.ss_hash <= 779 and c.c_hash >= 432 and c.c_hash <= 765 and hd.hd_hash >= 571 and hd.hd_hash <= 971
;
