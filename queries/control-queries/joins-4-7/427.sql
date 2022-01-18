select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 408 and c.c_hash <= 808 and hd.hd_hash >= 162 and hd.hd_hash <= 912 and i.i_hash >= 418 and i.i_hash <= 751
;
