select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 27 and ss.ss_hash <= 360 and c.c_hash >= 594 and c.c_hash <= 994 and hd.hd_hash >= 188 and hd.hd_hash <= 938
;
