select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 136 and ss.ss_hash <= 536 and i.i_hash >= 399 and i.i_hash <= 732 and hd.hd_hash >= 97 and hd.hd_hash <= 847
;
