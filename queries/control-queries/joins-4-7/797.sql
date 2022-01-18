select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 102 and i.i_hash <= 852 and c.c_hash >= 264 and c.c_hash <= 664 and hd.hd_hash >= 658 and hd.hd_hash <= 991
;
