select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 371 and ss.ss_hash <= 704 and c.c_hash >= 231 and c.c_hash <= 981 and hd.hd_hash >= 72 and hd.hd_hash <= 472
;
