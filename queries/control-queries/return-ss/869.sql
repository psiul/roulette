select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 107 and ss.ss_hash <= 857 and c.c_hash >= 281 and c.c_hash <= 614 and hd.hd_hash >= 186 and hd.hd_hash <= 586
;
