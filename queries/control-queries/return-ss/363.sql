select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 68 and ss.ss_hash <= 818 and c.c_hash >= 118 and c.c_hash <= 518 and hd.hd_hash >= 99 and hd.hd_hash <= 432
;
