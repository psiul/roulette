select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,store_returns sr,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 359 and ss.ss_hash <= 759 and i.i_hash >= 188 and i.i_hash <= 938 and hd.hd_hash >= 38 and hd.hd_hash <= 371
;
