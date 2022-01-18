select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,household_demographics hd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 7 and ss.ss_hash <= 757 and i.i_hash >= 203 and i.i_hash <= 603 and c.c_hash >= 118 and c.c_hash <= 451
;
