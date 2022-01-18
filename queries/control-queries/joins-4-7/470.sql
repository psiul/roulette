select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 489 and ss.ss_hash <= 822 and cd.cd_hash >= 64 and cd.cd_hash <= 814 and hd.hd_hash >= 160 and hd.hd_hash <= 560
;
