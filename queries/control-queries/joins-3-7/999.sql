select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 90 and ss.ss_hash <= 840 and cd.cd_hash >= 20 and cd.cd_hash <= 420 and c.c_hash >= 292 and c.c_hash <= 625
;
