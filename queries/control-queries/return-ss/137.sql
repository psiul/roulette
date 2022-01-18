select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,household_demographics hd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 127 and ss.ss_hash <= 877 and hd.hd_hash >= 222 and hd.hd_hash <= 555 and c.c_hash >= 278 and c.c_hash <= 678
;
