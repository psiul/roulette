select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 281 and ss.ss_hash <= 614 and c.c_hash >= 161 and c.c_hash <= 911 and hd.hd_hash >= 237 and hd.hd_hash <= 637
;
