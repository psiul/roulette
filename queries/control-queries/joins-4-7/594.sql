select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 42 and i.i_hash <= 792 and hd.hd_hash >= 46 and hd.hd_hash <= 446 and c.c_hash >= 69 and c.c_hash <= 402
;
