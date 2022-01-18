select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 229 and ss.ss_hash <= 979 and c.c_hash >= 22 and c.c_hash <= 422 and hd.hd_hash >= 472 and hd.hd_hash <= 805
;
