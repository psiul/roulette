select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 377 and ss.ss_hash <= 710 and i.i_hash >= 15 and i.i_hash <= 765 and c.c_hash >= 557 and c.c_hash <= 957
;
