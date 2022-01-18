select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 351 and ss.ss_hash <= 684 and i.i_hash >= 241 and i.i_hash <= 991 and hd.hd_hash >= 456 and hd.hd_hash <= 856
;
