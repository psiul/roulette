select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 110 and ss.ss_hash <= 860 and cd.cd_hash >= 492 and cd.cd_hash <= 892 and c.c_hash >= 45 and c.c_hash <= 378
;
