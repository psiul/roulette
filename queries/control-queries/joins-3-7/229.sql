select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 597 and ss.ss_hash <= 997 and c.c_hash >= 151 and c.c_hash <= 901 and hd.hd_hash >= 607 and hd.hd_hash <= 940
;
