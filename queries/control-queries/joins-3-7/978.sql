select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 76 and ss.ss_hash <= 826 and cd.cd_hash >= 73 and cd.cd_hash <= 406 and c.c_hash >= 458 and c.c_hash <= 858
;
