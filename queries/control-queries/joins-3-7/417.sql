select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 248 and ss.ss_hash <= 581 and c.c_hash >= 14 and c.c_hash <= 764 and hd.hd_hash >= 63 and hd.hd_hash <= 463
;
