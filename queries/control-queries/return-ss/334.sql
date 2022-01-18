select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and hd.hd_hash >= 136 and hd.hd_hash <= 536 and i.i_hash >= 231 and i.i_hash <= 981 and c.c_hash >= 288 and c.c_hash <= 621
;
