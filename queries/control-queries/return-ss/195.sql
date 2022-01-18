select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,household_demographics hd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 293 and ss.ss_hash <= 626 and hd.hd_hash >= 153 and hd.hd_hash <= 553 and c.c_hash >= 139 and c.c_hash <= 889
;
