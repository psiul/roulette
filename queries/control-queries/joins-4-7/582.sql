select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 294 and ss.ss_hash <= 627 and hd.hd_hash >= 246 and hd.hd_hash <= 646 and cd.cd_hash >= 51 and cd.cd_hash <= 801
;
