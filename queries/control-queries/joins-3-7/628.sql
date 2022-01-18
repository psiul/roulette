select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 201 and ss.ss_hash <= 534 and hd.hd_hash >= 488 and hd.hd_hash <= 888 and c.c_hash >= 214 and c.c_hash <= 964
;
