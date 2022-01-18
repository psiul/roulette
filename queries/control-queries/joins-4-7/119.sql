select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 129 and ss.ss_hash <= 879 and i.i_hash >= 209 and i.i_hash <= 609 and hd.hd_hash >= 152 and hd.hd_hash <= 485
;
