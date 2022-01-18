select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 288 and ss.ss_hash <= 621 and hd.hd_hash >= 153 and hd.hd_hash <= 903 and c.c_hash >= 556 and c.c_hash <= 956
;
