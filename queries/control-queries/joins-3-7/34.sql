select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 39 and ss.ss_hash <= 372 and hd.hd_hash >= 201 and hd.hd_hash <= 601 and c.c_hash >= 71 and c.c_hash <= 821
;
