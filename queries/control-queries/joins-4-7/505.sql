select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 67 and ss.ss_hash <= 467 and hd.hd_hash >= 195 and hd.hd_hash <= 945 and c.c_hash >= 253 and c.c_hash <= 586
;
