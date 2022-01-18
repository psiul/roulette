select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 190 and ss.ss_hash <= 940 and c.c_hash >= 53 and c.c_hash <= 386 and d.d_hash >= 383 and d.d_hash <= 783
;
