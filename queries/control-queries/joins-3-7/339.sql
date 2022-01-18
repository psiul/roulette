select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 170 and ss.ss_hash <= 503 and cd.cd_hash >= 225 and cd.cd_hash <= 975 and c.c_hash >= 569 and c.c_hash <= 969
;
