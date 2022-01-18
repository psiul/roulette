select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 31 and ss.ss_hash <= 431 and hd.hd_hash >= 96 and hd.hd_hash <= 846 and c.c_hash >= 30 and c.c_hash <= 363
;
