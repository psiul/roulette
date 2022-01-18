select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 98 and ss.ss_hash <= 848 and hd.hd_hash >= 17 and hd.hd_hash <= 417 and d.d_hash >= 58 and d.d_hash <= 391
;
