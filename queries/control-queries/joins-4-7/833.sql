select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 39 and ss.ss_hash <= 789 and hd.hd_hash >= 542 and hd.hd_hash <= 942 and cd.cd_hash >= 11 and cd.cd_hash <= 344
;
