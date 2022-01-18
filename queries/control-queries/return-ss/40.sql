select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 55 and d.d_hash <= 455 and c.c_hash >= 87 and c.c_hash <= 837 and hd.hd_hash >= 365 and hd.hd_hash <= 698
;
