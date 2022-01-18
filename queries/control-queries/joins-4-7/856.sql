select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 4 and ss.ss_hash <= 754 and hd.hd_hash >= 300 and hd.hd_hash <= 700 and c.c_hash >= 83 and c.c_hash <= 416
;
