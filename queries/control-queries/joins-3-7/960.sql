select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 19 and ss.ss_hash <= 769 and cd.cd_hash >= 483 and cd.cd_hash <= 883 and c.c_hash >= 160 and c.c_hash <= 493
;
