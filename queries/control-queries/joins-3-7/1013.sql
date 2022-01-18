select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 582 and ss.ss_hash <= 982 and hd.hd_hash >= 12 and hd.hd_hash <= 762 and c.c_hash >= 78 and c.c_hash <= 411
;
