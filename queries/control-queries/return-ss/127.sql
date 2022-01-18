select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 51 and ss.ss_hash <= 801 and hd.hd_hash >= 23 and hd.hd_hash <= 356 and c.c_hash >= 371 and c.c_hash <= 771
;
