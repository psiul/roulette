select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 29 and ss.ss_hash <= 779 and hd.hd_hash >= 103 and hd.hd_hash <= 436 and c.c_hash >= 111 and c.c_hash <= 511
;
