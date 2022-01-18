select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 177 and ss.ss_hash <= 577 and c.c_hash >= 81 and c.c_hash <= 831 and hd.hd_hash >= 114 and hd.hd_hash <= 447
;
