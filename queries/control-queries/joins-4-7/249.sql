select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 146 and hd.hd_hash <= 896 and i.i_hash >= 584 and i.i_hash <= 917 and c.c_hash >= 28 and c.c_hash <= 428
;
