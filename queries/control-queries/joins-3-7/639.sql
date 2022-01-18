select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 363 and ss.ss_hash <= 763 and hd.hd_hash >= 18 and hd.hd_hash <= 768 and c.c_hash >= 225 and c.c_hash <= 558
;
