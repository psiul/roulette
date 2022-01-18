select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 232 and ss.ss_hash <= 632 and cd.cd_hash >= 17 and cd.cd_hash <= 350 and hd.hd_hash >= 10 and hd.hd_hash <= 760
;
