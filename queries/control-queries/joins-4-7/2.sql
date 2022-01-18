select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 202 and i.i_hash <= 952 and c.c_hash >= 11 and c.c_hash <= 411 and hd.hd_hash >= 239 and hd.hd_hash <= 572
;
