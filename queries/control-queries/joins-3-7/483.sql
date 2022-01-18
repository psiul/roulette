select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 199 and ss.ss_hash <= 599 and cd.cd_hash >= 328 and cd.cd_hash <= 661 and c.c_hash >= 215 and c.c_hash <= 965
;
