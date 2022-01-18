select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 243 and ss.ss_hash <= 993 and c.c_hash >= 108 and c.c_hash <= 508 and i.i_hash >= 78 and i.i_hash <= 411
;
