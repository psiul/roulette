select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 406 and ss.ss_hash <= 739 and i.i_hash >= 86 and i.i_hash <= 836 and hd.hd_hash >= 292 and hd.hd_hash <= 692
;
