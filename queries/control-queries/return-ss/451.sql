select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,household_demographics hd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 347 and ss.ss_hash <= 747 and d.d_hash >= 182 and d.d_hash <= 515 and hd.hd_hash >= 2 and hd.hd_hash <= 752
;
