select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 363 and cd.cd_hash <= 696 and c.c_hash >= 101 and c.c_hash <= 851 and hd.hd_hash >= 19 and hd.hd_hash <= 419
;
