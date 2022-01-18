select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 97 and ss.ss_hash <= 847 and hd.hd_hash >= 105 and hd.hd_hash <= 505 and c.c_hash >= 578 and c.c_hash <= 911
;
