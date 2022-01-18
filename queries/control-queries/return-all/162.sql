select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 153 and ss.ss_hash <= 553 and hd.hd_hash >= 155 and hd.hd_hash <= 905 and d.d_hash >= 635 and d.d_hash <= 968
;
