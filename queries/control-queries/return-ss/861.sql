select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 119 and ss.ss_hash <= 869 and hd.hd_hash >= 485 and hd.hd_hash <= 885 and c.c_hash >= 266 and c.c_hash <= 599
;
