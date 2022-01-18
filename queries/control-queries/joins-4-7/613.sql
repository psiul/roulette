select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 276 and ss.ss_hash <= 609 and cd.cd_hash >= 35 and cd.cd_hash <= 435 and c.c_hash >= 129 and c.c_hash <= 879
;
