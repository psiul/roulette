select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 84 and ss.ss_hash <= 834 and i.i_hash >= 98 and i.i_hash <= 498 and hd.hd_hash >= 136 and hd.hd_hash <= 469
;
