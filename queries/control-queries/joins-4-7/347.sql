select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 642 and c.c_hash <= 975 and hd.hd_hash >= 27 and hd.hd_hash <= 777 and i.i_hash >= 251 and i.i_hash <= 651
;
