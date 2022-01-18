select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 261 and ss.ss_hash <= 594 and hd.hd_hash >= 45 and hd.hd_hash <= 795 and i.i_hash >= 546 and i.i_hash <= 946
;
