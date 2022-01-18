select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 79 and hd.hd_hash <= 479 and cd.cd_hash >= 328 and cd.cd_hash <= 661 and c.c_hash >= 215 and c.c_hash <= 965
;
