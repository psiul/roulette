select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 264 and ss.ss_hash <= 597 and c.c_hash >= 32 and c.c_hash <= 782 and hd.hd_hash >= 202 and hd.hd_hash <= 602
;
