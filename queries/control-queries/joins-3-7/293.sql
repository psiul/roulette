select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 120 and ss.ss_hash <= 870 and cd.cd_hash >= 109 and cd.cd_hash <= 442 and c.c_hash >= 213 and c.c_hash <= 613
;
