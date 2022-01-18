select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 447 and ss.ss_hash <= 847 and i.i_hash >= 71 and i.i_hash <= 821 and hd.hd_hash >= 0 and hd.hd_hash <= 333
;
