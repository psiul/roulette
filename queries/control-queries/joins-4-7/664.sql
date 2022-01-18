select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 215 and ss.ss_hash <= 548 and c.c_hash >= 42 and c.c_hash <= 792 and hd.hd_hash >= 39 and hd.hd_hash <= 439
;
