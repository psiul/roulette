select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 22 and ss.ss_hash <= 772 and c.c_hash >= 139 and c.c_hash <= 472 and hd.hd_hash >= 517 and hd.hd_hash <= 917
;
