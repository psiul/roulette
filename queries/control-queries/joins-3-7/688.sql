select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 173 and ss.ss_hash <= 506 and cd.cd_hash >= 215 and cd.cd_hash <= 965 and c.c_hash >= 378 and c.c_hash <= 778
;
