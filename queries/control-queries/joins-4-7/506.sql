select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 226 and ss.ss_hash <= 976 and c.c_hash >= 176 and c.c_hash <= 509 and hd.hd_hash >= 92 and hd.hd_hash <= 492
;
