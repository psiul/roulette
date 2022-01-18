select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,store_returns sr,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 23 and c.c_hash <= 423 and i.i_hash >= 220 and i.i_hash <= 970 and hd.hd_hash >= 553 and hd.hd_hash <= 886
;
