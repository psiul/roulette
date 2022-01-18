select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 274 and ss.ss_hash <= 607 and hd.hd_hash >= 94 and hd.hd_hash <= 494 and c.c_hash >= 7 and c.c_hash <= 757
;
