select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 362 and ss.ss_hash <= 762 and cd.cd_hash >= 1 and cd.cd_hash <= 751 and c.c_hash >= 250 and c.c_hash <= 583
;
