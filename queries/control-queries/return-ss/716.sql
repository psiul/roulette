select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,store_returns sr,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 172 and ss.ss_hash <= 572 and i.i_hash >= 19 and i.i_hash <= 769 and hd.hd_hash >= 445 and hd.hd_hash <= 778
;
