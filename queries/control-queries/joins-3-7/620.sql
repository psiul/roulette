select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 11 and ss.ss_hash <= 344 and hd.hd_hash >= 16 and hd.hd_hash <= 766 and c.c_hash >= 237 and c.c_hash <= 637
;
