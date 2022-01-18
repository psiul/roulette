select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 363 and ss.ss_hash <= 763 and c.c_hash >= 249 and c.c_hash <= 999 and hd.hd_hash >= 195 and hd.hd_hash <= 528
;
