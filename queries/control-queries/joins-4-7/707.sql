select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 102 and ss.ss_hash <= 435 and cd.cd_hash >= 55 and cd.cd_hash <= 805 and c.c_hash >= 475 and c.c_hash <= 875
;
