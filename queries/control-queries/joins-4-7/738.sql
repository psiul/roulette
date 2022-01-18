select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 76 and ss.ss_hash <= 826 and i.i_hash >= 476 and i.i_hash <= 876 and hd.hd_hash >= 473 and hd.hd_hash <= 806
;
