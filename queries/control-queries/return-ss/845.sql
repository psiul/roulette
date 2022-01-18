select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,item i,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 213 and ss.ss_hash <= 613 and hd.hd_hash >= 97 and hd.hd_hash <= 430 and c.c_hash >= 179 and c.c_hash <= 929
;
