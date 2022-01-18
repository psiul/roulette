select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 295 and ss.ss_hash <= 695 and cd.cd_hash >= 79 and cd.cd_hash <= 412 and hd.hd_hash >= 241 and hd.hd_hash <= 991
;
