select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,store_returns sr,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 26 and ss.ss_hash <= 359 and i.i_hash >= 53 and i.i_hash <= 803 and c.c_hash >= 340 and c.c_hash <= 740
;
