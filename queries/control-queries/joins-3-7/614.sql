select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 548 and ss.ss_hash <= 948 and cd.cd_hash >= 194 and cd.cd_hash <= 944 and c.c_hash >= 177 and c.c_hash <= 510
;
