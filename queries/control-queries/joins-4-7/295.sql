select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 74 and hd.hd_hash <= 824 and i.i_hash >= 26 and i.i_hash <= 426 and c.c_hash >= 514 and c.c_hash <= 847
;
