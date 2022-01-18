select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 275 and ss.ss_hash <= 608 and hd.hd_hash >= 65 and hd.hd_hash <= 465 and c.c_hash >= 122 and c.c_hash <= 872
;
