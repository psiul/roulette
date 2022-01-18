select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 203 and ss.ss_hash <= 953 and hd.hd_hash >= 383 and hd.hd_hash <= 783 and c.c_hash >= 110 and c.c_hash <= 443
;
