select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 3 and hd.hd_hash <= 336 and i.i_hash >= 95 and i.i_hash <= 845 and c.c_hash >= 178 and c.c_hash <= 578
;
