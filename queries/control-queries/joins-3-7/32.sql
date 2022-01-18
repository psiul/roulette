select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 443 and ss.ss_hash <= 776 and hd.hd_hash >= 89 and hd.hd_hash <= 839 and c.c_hash >= 367 and c.c_hash <= 767
;
