select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 80 and ss.ss_hash <= 413 and i.i_hash >= 33 and i.i_hash <= 433 and c.c_hash >= 136 and c.c_hash <= 886
;
