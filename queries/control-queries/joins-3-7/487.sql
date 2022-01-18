select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 29 and ss.ss_hash <= 779 and cd.cd_hash >= 52 and cd.cd_hash <= 452 and c.c_hash >= 167 and c.c_hash <= 500
;
