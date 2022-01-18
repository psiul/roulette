select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 70 and ss.ss_hash <= 470 and i.i_hash >= 399 and i.i_hash <= 732 and hd.hd_hash >= 35 and hd.hd_hash <= 785
;
