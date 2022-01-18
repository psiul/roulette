select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer c,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 380 and ss.ss_hash <= 780 and c.c_hash >= 60 and c.c_hash <= 393 and d.d_hash >= 75 and d.d_hash <= 825
;
