select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 76 and ss.ss_hash <= 409 and i.i_hash >= 204 and i.i_hash <= 954 and hd.hd_hash >= 279 and hd.hd_hash <= 679
;
