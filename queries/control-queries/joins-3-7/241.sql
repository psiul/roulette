select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 224 and ss.ss_hash <= 974 and c.c_hash >= 9 and c.c_hash <= 409 and hd.hd_hash >= 168 and hd.hd_hash <= 501
;
