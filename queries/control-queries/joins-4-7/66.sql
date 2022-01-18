select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 24 and ss.ss_hash <= 774 and cd.cd_hash >= 23 and cd.cd_hash <= 356 and c.c_hash >= 470 and c.c_hash <= 870
;
