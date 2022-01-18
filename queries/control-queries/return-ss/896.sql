select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 592 and ss.ss_hash <= 925 and i.i_hash >= 369 and i.i_hash <= 769 and hd.hd_hash >= 217 and hd.hd_hash <= 967
;
