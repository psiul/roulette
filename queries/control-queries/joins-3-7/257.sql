select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 209 and ss.ss_hash <= 959 and cd.cd_hash >= 64 and cd.cd_hash <= 397 and c.c_hash >= 528 and c.c_hash <= 928
;
