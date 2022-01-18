select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 310 and ss.ss_hash <= 643 and c.c_hash >= 179 and c.c_hash <= 929 and hd.hd_hash >= 343 and hd.hd_hash <= 743
;
