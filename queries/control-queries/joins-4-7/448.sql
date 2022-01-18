select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 269 and i.i_hash <= 669 and c.c_hash >= 334 and c.c_hash <= 667 and hd.hd_hash >= 126 and hd.hd_hash <= 876
;
