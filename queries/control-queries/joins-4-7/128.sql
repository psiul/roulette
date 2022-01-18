select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 110 and ss.ss_hash <= 860 and cd.cd_hash >= 271 and cd.cd_hash <= 604 and hd.hd_hash >= 102 and hd.hd_hash <= 502
;
