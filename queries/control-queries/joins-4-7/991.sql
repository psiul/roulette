select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 120 and i.i_hash <= 520 and hd.hd_hash >= 82 and hd.hd_hash <= 832 and c.c_hash >= 162 and c.c_hash <= 495
;
