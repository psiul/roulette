select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 116 and ss.ss_hash <= 449 and hd.hd_hash >= 189 and hd.hd_hash <= 589 and c.c_hash >= 67 and c.c_hash <= 817
;
