select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,store_returns sr,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 81 and ss.ss_hash <= 831 and c.c_hash >= 588 and c.c_hash <= 988 and d.d_hash >= 409 and d.d_hash <= 742
;
