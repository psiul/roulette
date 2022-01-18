select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,store_returns sr,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 468 and ss.ss_hash <= 868 and hd.hd_hash >= 106 and hd.hd_hash <= 856 and c.c_hash >= 483 and c.c_hash <= 816
;
