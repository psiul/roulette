select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 241 and ss.ss_hash <= 641 and hd.hd_hash >= 170 and hd.hd_hash <= 920 and d.d_hash >= 655 and d.d_hash <= 988
;
