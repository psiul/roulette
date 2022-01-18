select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 408 and ss.ss_hash <= 741 and c.c_hash >= 70 and c.c_hash <= 470 and hd.hd_hash >= 136 and hd.hd_hash <= 886
;
